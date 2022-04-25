import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XResult<T> {
  T? data;
  String? error;
  static const String unknownError = "Somethings went wrong";

  bool get isError => error != null;
  bool get isSuccess => !isError;

  XResult.success(this.data) {
    error = null;
  }

  XResult.error(String? error) {
    data = null;
    this.error = error ?? '';
  }

  XResult.exception(Object? e) {
    data = null;
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message?.toString();
    } else if (e is FlutterError) {
      error = e.message;
    }
    error ??= unknownError;
  }
}
