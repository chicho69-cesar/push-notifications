// SHA1: 43:7C:31:13:F9:9E:F4:73:E7:4E:54:75:01:00:A8:3A:64:04:24:4E

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('TOKEN: $token');

    // Local notifications
  }
}
