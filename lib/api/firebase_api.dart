import 'package:firebase_messaging/firebase_messaging.dart';


// Future<void> handleBackgroundMessage(RemoteMessage message)async{
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  String? _fcmToken; // Class-level variable to store the token

  Future<String?> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    _fcmToken = await _firebaseMessaging.getToken();
    print("Token FCM: $_fcmToken");
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    return _fcmToken;
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    print("Subscribed to topic: $topic");
  }

  String getFcmToken() {
    return _fcmToken ?? '';
  }
}