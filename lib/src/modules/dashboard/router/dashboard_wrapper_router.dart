import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

import '../../../../main.dart';

class DashboardWrapperPage extends StatefulWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  State<DashboardWrapperPage> createState() => _DashboardWrapperPageState();
}

class _DashboardWrapperPageState extends State<DashboardWrapperPage> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    BaseAudioQuery().permissionsRequest();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {}
    });
    FirebaseMessaging.instance.getToken().then((value) {
      log('Token device firebase : ${value ?? 'N.A'}');
    });

    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async {});
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null) {
        if (android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                  icon: android.smallIcon,
                ),
              ));
        } else {
          XSnackbar.show(
              msg: 'title: ${notification.title}'
                  '\n'
                  'body: ${notification.body}');
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(body: AutoRouter()));
  }
}
