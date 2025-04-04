import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FirebaseMessagingUtils {
  static Future<String?> getDeviceToken() async {
    return FirebaseMessaging.instance.getToken();
  }

  static Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    debugPrint('Handling a background message ${message.messageId}');
  }

  static Future subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  static Future unsubscribeFromTopic(String topic) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  static void onBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(
      FirebaseMessagingUtils._firebaseMessagingBackgroundHandler,
    );
  }

  static void onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Message data: ${message.data}');
      if (message.notification != null) {
        debugPrint(
          'Message also contained a notification: ${message.notification}',
        );
      }
    });
  }
}
