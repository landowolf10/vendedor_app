import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

String firebaseToken;

class PushNotificatinProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      firebaseToken = token;

      print("Hola");

      print("==== FCM token ====");
      print(firebaseToken);

      //dBEx7pHR6JI:APA91bE7rlvTC6QAH5eFON-eMB84oxVISEEk5q6LQBepIqf3EWUVpHKvJb4ATTWaxnf0OR_PpWpZQJn1-vT0jaPIwm-5QSH6C4EfvsmNtzzA3ZCn76w1KcqY6aTk-CGf0N3EuSE23j8V
      //cXN_ooG9vhg:APA91bEeYsjkAW_rPgoPUXBPN6HFFXiq4SzVosz84czLU_rCNxUpHA-9UEGwJVVgq2vcS6mYxw6_hsm691YOAnChhAAuo4DOBxzggbNn1y5Tn4rAoVWvy_RqIPUXcd4IFk6lQcTQyY0z
      //flkVUwvQmv4:APA91bHwiT7GZ8IH8Fp-Q0J4ob0dReDl1RMRDJxRqNsJEIkmXOeuLNS3E-G2MyYvt0M6Qivn9aMLWDsWKYK8dtJmMdT2cxUSJbKmfyMzb8kdnyuP5Q6UDPRkSKtbv00n-5awqxUvhfSJ
    });

    _firebaseMessaging.configure(onMessage: (info) async {
      print("===== On Message =====");
      print(info);

      String argumento = 'no-data';

      if (Platform.isAndroid) {
        argumento = info['data']['comida'] ?? 'no-data';
      }

      _mensajesStreamController.sink.add(argumento);
    }, onLaunch: (info) async {
      print("===== On Launch =====");
      print(info);
    }, onResume: (info) async {
      print("===== On Resume =====");
      print(info);

      final noti = info['data']['comida'];

      //print(noti);
      _mensajesStreamController.sink.add(noti);
    });
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
