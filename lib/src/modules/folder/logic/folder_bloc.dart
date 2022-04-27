import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'folder_state.dart';

class FolderBloc extends Cubit<FolderState> {
  FolderBloc() : super(FolderState(items: XHandle.completed([]))) {
    fetchListFolder();
  }
  final Domain _domain = Domain();

  Future<void> fetchListFolder() async {
    final listFolder = await _domain.folder.fetchListFolder();
    if (listFolder.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(listFolder.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Fetch list folder error');
    }
  }

  void onItemChanged() {
    _domain.folder.saveFolder(state.items.data ?? []);
  }

  Future<void> addItem() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    final _itemsState = state.items.data ?? [];
    print('levi+ ' +selectedDirectory.toString());
    bool isDuplication = _itemsState
        .where(
            (e) => Utils.getNameFolderOfLink(selectedDirectory ?? '') == e.name)
        .isNotEmpty;

    if (selectedDirectory != null && isDuplication == false) {
      final folder = XFolder(
          color: Utils.colorRandom(),
          name: Utils.getNameFolderOfLink(selectedDirectory),
          size: 0,
          id: Utils.idRandom(),
          date: Utils.dateTimeFolder(),
          listTracks: []);
      final List<XFolder> _items = [...(_itemsState), folder];

      emit(state.copyWith(items: XHandle.completed(_items)));
      onItemChanged();
    } else if (isDuplication) {
      XSnackbar.show(msg: 'Directory already exists');
    } else {
      XSnackbar.show(msg: 'Add folder error');
    }
  }
}
