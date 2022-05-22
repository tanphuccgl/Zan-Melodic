import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'folder_state.dart';

class FolderBloc extends UpperControlBloc<FolderState> {
  FolderBloc() : super(_initialValue) {
    fetchListFolder();
  }
  final Domain _domain = Domain();
  static final FolderState _initialValue =
      FolderState(items: XHandle.loading());

  Future<void> fetchListFolder() async {
    final _value = await _domain.folder.getListFolder();
    if (_value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(_value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Fetch list folder error');
    }
  }

  Future<void> pickFolder() async => await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );
  Future<void> browseFiles() async => await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: true,
      );

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
