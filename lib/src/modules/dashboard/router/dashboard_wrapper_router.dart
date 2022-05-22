import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class DashboardWrapperPage extends StatefulWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  State<DashboardWrapperPage> createState() => _DashboardWrapperPageState();
}

class _DashboardWrapperPageState extends State<DashboardWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(body: AutoRouter()));
  }

  @override
  void initState() {
    super.initState();
    BaseAudioQuery().permissionsRequest();
  }
}
