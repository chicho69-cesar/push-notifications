// SHA1: 43:7C:31:13:F9:9E:F4:73:E7:4E:54:75:01:00:A8:3A:64:04:24:4E

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _onBackgroundHandler(RemoteMessage message) async {
    // print('onBackground Handler ${ message.messageId }');
    // _messageStream.sink.add(message.notification!.title ?? 'No title');
    _messageStream.sink.add(message.data['product'] ?? 'No product');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('onMessageHandler Handler ${ message.messageId }');
    // _messageStream.sink.add(message.notification!.title ?? 'No title');
    _messageStream.sink.add(message.data['product'] ?? 'No product');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print('onMessageOpenApp Handler ${ message.messageId }');
    // _messageStream.sink.add(message.notification!.title ?? 'No title');
    _messageStream.sink.add(message.data['product'] ?? 'No product');
  }

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('TOKEN: $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // Local notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
