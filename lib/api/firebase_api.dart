import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    try {
      print("TITULO: ${message.notification?.title}");
      print("BODY: ${message.notification?.title}");
      print("PAYLOAD: ${message.notification?.title}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fCMToken = await firebaseMessaging.getToken();
    debugPrint("TOKEN: ${fCMToken}");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
