import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_state.dart';

class PermissionBloc extends Cubit<PermissionState> {
  PermissionBloc() : super(_initialValue) {
    requestStorage();
  }
  static const PermissionState _initialValue =
      PermissionState(status: PermissionStatus.denied);

  Future<void> requestStorage() async {
    var status = await Permission.storage.status;

    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    if (await Permission.storage.request().isGranted == true) {
      emit(state.copyWith(status: PermissionStatus.granted));
    } else {
      emit(state.copyWith(status: status));
    }
  }
}
