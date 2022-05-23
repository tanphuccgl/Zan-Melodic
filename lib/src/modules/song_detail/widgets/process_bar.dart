import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_images.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';

class ProcessBar extends StatelessWidget {
  const ProcessBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _pHori = 40.0;
    final _size = MediaQuery.of(context).size.width - _pHori * 2;
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        final _current = state.progress.current.inSeconds.toDouble();
        final _total = state.progress.total.inSeconds.toDouble();
        final _posSeek = _current / (_total / _size);

//     File(p.join((await getTemporaryDirectory()).path, 'waveform.wave'));
//       JustWaveform.extract(audioInFile: audioFile, waveOutFile: waveFile)
//           .listen(progressStream.add, onError: progressStream.addError);
//         state.currentSong.paud
// WaveformProgress().waveform.data

//         const minoractiveColor = Color(0xFFffbf99);
//         const minorinactiveColor = Color(0xFFE1DFDF);
//         const borderColor = Color(0xFFEBEBEB);
//         return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           RectangleWaveform(
//             maxDuration: state.progress.total,
//             elapsedDuration: state.progress.current,
//             samples: [100],
//             height: 100,
//             absolute: true,
//             borderWidth: 0.5,
//             inactiveBorderColor: borderColor,
//             width: MediaQuery.of(context).size.width,
//             inactiveColor: Colors.white,
//             activeBorderColor: borderColor,
//             activeGradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               colors: [
//                 Color(0xFFff3701),
//                 Color(0xFFff6d00),
//               ],
//               stops: [
//                 0,
//                 0.3,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2,
//           ),
//           RectangleWaveform(
//             maxDuration: state.progress.total,
//             elapsedDuration: state.progress.current,
//             samples: [],
//             height: 50,
//             width: MediaQuery.of(context).size.width,
//             absolute: true,
//             invert: true,
//             borderWidth: 0.5,
//             inactiveBorderColor: borderColor,
//             activeBorderColor: borderColor,
//             activeColor: minoractiveColor,
//             inactiveColor: minorinactiveColor,
//           ),
//         ]);
        return Column(
          children: [
            SizedBox(
              height: 60,
              child: Stack(
                children: [
                  Image.asset(
                    MyImage.audio,
                    color: MyColors.colorWhite1,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ProgressBar(
                      progress: state.progress.current,
                      buffered: state.progress.buffered,
                      total: state.progress.total,
                      onSeek: state.audioHandler.seek,
                      timeLabelLocation: TimeLabelLocation.none,
                      thumbCanPaintOutsideBar: false,
                      baseBarColor: Colors.transparent,
                      thumbColor: Colors.transparent,
                      thumbGlowColor: Colors.transparent,
                      progressBarColor: Colors.transparent,
                      bufferedBarColor: Colors.transparent,
                      thumbGlowRadius: 30,
                    ),
                  ),
                  Positioned(
                    left: _posSeek,
                    width: 1,
                    height: 60,
                    child: Container(
                      color: MyColors.colorGray,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _timeSong(state.progress.current),
                _timeSong(state.progress.total)
              ],
            ),
          ],
        );
      },
    );
  }

  Text _timeSong(Duration duration) {
    return Text(
      XUtils.formatDuration(duration),
      style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
    );
  }
}
