import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vendedor_app/src/pages/pedido_estatus.dart';

String firebaseToken;

class PushNotificatinProvider
{
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajesStream => _mensajesStreamController.stream;

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

  Future<dynamic> onMessage(Map<String, dynamic> message) async
  {
    print("===== onMessage =====");
    print('message: $message');

    final argument = message['data']['comida'];
    print("DATA: " + argument);

    _mensajesStreamController.sink.add(argument);

    /*Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext ctx) => PedidoRealizado()));*/
  }

    Future<dynamic> onLaunch(Map<String, dynamic> message) async
  {
    print("===== onLaunch =====");
    print('message: $message');

    final argument = message['data']['comida'];
    print("DATA: " + argument);

    _mensajesStreamController.sink.add(argument);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async
  {
    print("===== onResume =====");
    print('message: $message');

    final argument = message['data']['comida'];
    print("DATA: " + argument);

    _mensajesStreamController.sink.add(argument);
  }

  dispose()
  {
    _mensajesStreamController?.close();
  }
}