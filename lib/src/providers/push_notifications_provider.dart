import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

String firebaseToken;

class PushNotificatinProvider
{
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) async
  {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications() async
  {
    await _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.subscribeToTopic("restaurant_topic");
    final token = await _firebaseMessaging.getToken();

    print("==== FCM token ====");
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume
    );
  }

  dispose() {
    _mensajesStreamController?.close();
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async
  {
    print("===== onMessage =====");
    print('message: $message');
  }

    Future<dynamic> onLaunch(Map<String, dynamic> message) async
  {
    print("===== onLaunch =====");
    print('message: $message');
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async
  {
    print("===== onResume =====");
    print('message: $message');
  }
}