import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class XJustWaveform {
  static const MethodChannel _channel =
      MethodChannel('com.ryanheise.just_waveform');

  static Stream<XWaveformProgress> extract({
    required File audioInFile,
    required File waveOutFile,
    XWaveformZoom zoom = const XWaveformZoom.pixelsPerSecond(100),
  }) {
    StreamController<XWaveformProgress> progressController =
        StreamController<XWaveformProgress>.broadcast();

    _channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'onProgress':
          Waveform? waveform;

          waveform = await parse(waveOutFile);

          progressController.add(XWaveformProgress._(waveform));
          break;
      }
    });

    _channel.invokeMethod('extract', {
      'audioInPath': audioInFile.path,
      'waveOutPath': waveOutFile.path,
      'samplesPerPixel': zoom._samplesPerPixel,
      'pixelsPerSecond': zoom._pixelsPerSecond,
    });

    return progressController.stream;
  }

  static Future<Waveform> parse(File waveformFile) async {
    final bytes = Uint8List.fromList(await waveformFile.readAsBytes()).buffer;
    const headerLength = 20;
    final header = Uint32List.view(bytes, 0, headerLength);
    final flags = header[1];
    final data = flags == 0
        ? Int16List.view(bytes, headerLength ~/ 2)
        : Int8List.view(bytes, headerLength);
    return Waveform(
      version: header[0],
      flags: flags,
      sampleRate: header[2],
      samplesPerPixel: header[3],
      length: header[4],
      data: data,
    );
  }
}

class XWaveformProgress {
  final Waveform? waveform;

  XWaveformProgress._(this.waveform);
}

class Waveform {
  final int version;
  final int flags;
  final int sampleRate;
  final int samplesPerPixel;
  final int length;
  final List<int> data;

  Waveform({
    required this.version,
    required this.flags,
    required this.sampleRate,
    required this.samplesPerPixel,
    required this.length,
    required this.data,
  });

  int operator [](int i) => i >= 0 && i < data.length ? data[i] : 0;

  int getPixelMin(int i) => this[2 * i];

  int getPixelMax(int i) => this[2 * i + 1];

  Duration get duration => Duration(
      microseconds: 1000 * 1000 * length * samplesPerPixel ~/ sampleRate);

  double positionToPixel(Duration position) =>
      position.inMicroseconds * sampleRate / (samplesPerPixel * 1000000);
}

class XWaveformZoom {
  final int? _samplesPerPixel;
  final int? _pixelsPerSecond;

  const XWaveformZoom.samplesPerPixel(int samplesPerPixel)
      : _samplesPerPixel = samplesPerPixel,
        _pixelsPerSecond = null;

  const XWaveformZoom.pixelsPerSecond(int pixelsPerSecond)
      : _pixelsPerSecond = pixelsPerSecond,
        _samplesPerPixel = null;
}
