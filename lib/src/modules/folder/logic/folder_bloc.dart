import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'folder_state.dart';

class FolderBloc extends Cubit<FolderState> {
  FolderBloc() : super(FolderState(items: XHandle.completed({}))) {
    fetchListFolder();
  }
  final Domain _domain = Domain();

  Future<void> fetchListFolder() async {
    final _value = await _domain.folder.getListFolder();
    if (_value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(_value.data ?? {})));
    } else {
      XSnackbar.show(msg: 'Fetch list folder error');
    }
  }

  Future<void> pickFolder() async => await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );
  Future<void> browseFiles() async {
    FilePickerResult? result1 = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);
    //  String? result = await FilePicker.platform.getDirectoryPath();
    //   /storage/emulated/0/Download
    // moveFile(File(result1!.files.first.path ?? ''),
    //     '/storage/emulated/0/Download');
    File file = File(result1?.files.single.path ?? '');
    //   File file2 = File('/storage/emulated/0/Zing MP3/1076380391.mp3');
    // print(file2.path);

    moveFile(file, '/storage/emulated/0/Download/1073766552.mp3');

    Directory dir = Directory('/storage/emulated/0/Zing MP3');
    List<FileSystemEntity> _files;
    List<FileSystemEntity> _songs = [];
    _files = dir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in _files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) _songs.add(entity);
    }
  }

  Future<File> moveFile(File sourceFile, String newPath) async {
    try {
      return await sourceFile.rename(newPath);
    } on FileSystemException {
      // if rename fails, copy the source file and then delete it
      final newFile = await sourceFile.copy(newPath);
      await sourceFile.delete();
      return newFile;
    }
  }
}
