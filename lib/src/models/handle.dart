import 'dart:core';
import 'result.dart';

class XHandle<T> {
  String? message;

  T? _data;

  T? get data => _data;

  Status _status = Status.initial;
  bool get isInitial => _status == Status.initial;

  bool get isLoading => _status == Status.loading;

  bool get isCompleted => _status == Status.success;

  bool get isError => _status == Status.error;

  XHandle.initial() {
    _status = Status.initial;
  }

  XHandle.loading({this.message}) {
    _status = Status.loading;
  }

  XHandle.completed(T data) {
    _data = data;
    message = '';
    _status = Status.success;
  }

  XHandle.error(this.message) {
    _data = null;
    _status = Status.error;
  }

  XHandle.result(XResult<T> result) {
    message = result.error;
    _data = result.data;
    _status = result.isError ? Status.error : Status.success;
  }
}

enum Status { initial, loading, error, success }
