import 'package:flutter/material.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/widgets/base/base_refresh.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class BaseScaffold<T> extends StatelessWidget {
  final XHandle<List<T>> handle;
  final XHandle<List<T>>? handle2;
  final Widget child;
  final Future<void> Function() onRefresh;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  const BaseScaffold(
      {Key? key,
      required this.handle,
      this.floatingActionButtonLocation,
      this.floatingActionButton,
      required this.child,
      this.handle2,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (handle2 == null) {
      if (handle.isCompleted) {
        return Scaffold(
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            body: BaseRefresh(
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
    } else {
      if (handle.isCompleted && handle2!.isCompleted) {
        return Scaffold(
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            body: BaseRefresh(
              child: child,
              onRefresh: onRefresh,
            ));
      } else if (handle.isLoading || handle2!.isLoading) {
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
}
