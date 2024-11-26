import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobpro/api/firebase_api.dart';
import 'package:jobpro/presentation/notification/notification_screen.dart';
import 'package:jobpro/utils/user_controller.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/app_export.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyBk3Qp539bEB4Jez5ZATKfkdhz1tD1IVng",  // Replace with your actual API key
//       appId: "1:892620492679:android:93d4a6f222e9c0125f4d22",    // Replace with your actual App ID
//       messagingSenderId: "892620492679", // Replace with your actual Sender ID
//       projectId: "jobpro-f8bef", // Replace with your actual Project ID
//       // databaseURL: "your_database_url", // Optional
//       // storageBucket: "your_storage_bucket", // Optional
//       // authDomain: "your_auth_domain", // Optional
//     ),
//   );
//   await FirebaseApi().initNotifications();
//   await GetStorage.init();
  
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]).then((value) {
//     Get.put(UserController());
//     Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    
//     runApp(MyApp());
//   });
  
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBk3Qp539bEB4Jez5ZATKfkdhz1tD1IVng",  // Replace with your actual API key
      appId: "1:892620492679:android:93d4a6f222e9c0125f4d22",    // Replace with your actual App ID
      messagingSenderId: "892620492679", // Replace with your actual Sender ID
      projectId: "jobpro-f8bef", // Replace with your actual Project ID
      // databaseURL: "your_database_url", // Optional
      // storageBucket: "your_storage_bucket", // Optional
      // authDomain: "your_auth_domain", // Optional
    ),
  );

  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    // Route to Notification Screen if a notification opened the app
    Get.to(() => NotificationScreen(notifications: notifications));
  }

  await FirebaseApi().initNotifications();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Get.put(UserController());
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'jobpro',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}



