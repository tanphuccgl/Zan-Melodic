import 'package:flutter/material.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/widgets/base/custom_refresh.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class BaseScaffold<T> extends StatelessWidget {
  final XHandle<List<T>> handle;
  final Widget child;
  final Future<void> Function() onRefresh;
  const BaseScaffold(
      {Key? key,
      required this.handle,
      required this.child,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (handle.isCompleted) {
      return Scaffold(
          body: CustomRefresh(
        child: child,
        onRefresh: onRefresh,
      ));
    } else if (handle.isLoading) {
      return const XStateLoadingWidget(
        isSliver: false,
      );
    } else {
      return const XStateErrorWidget(
        isSliver: false,
      );
    }
  }
}
