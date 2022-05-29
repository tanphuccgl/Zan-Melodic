import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class XPermission {
  static var storage = Permission.storage.status;
  void requestStorage() async {
    var status = await storage;
    if (status.isDenied) {
      await Permission.storage.request();
    }
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    log(status.toString());
  }
}
