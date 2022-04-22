import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DashboardWrapperPage extends StatelessWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(body: AutoRouter()));
  }
}
