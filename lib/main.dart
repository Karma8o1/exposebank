import 'package:expose_banq/controllers/authController.dart';
import 'package:expose_banq/controllers/languages.dart';
import 'package:expose_banq/view/kyc/kyc_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'view/starter/splash_screen.dart';

late Box box;
late Locale locale;
late SharedPreferences prefs;
late bool lang;
late bool showOnboardingScreen;
late bool permission;
var twilioFlutter = TwilioFlutter(
    accountSid:
        'ACd007b19e430cd677ddb854c507d84e10', // replace *** with Account SID
    authToken:
        'c0096727c19bfa30a07371bf3e98598c', // replace xxx with Auth Token
    twilioNumber: '+15074797332' // replace .... with Twilio Number
    );
//firebase messaging initialized global variable
FirebaseMessaging messaging = FirebaseMessaging.instance;
//Specifying channel for notifications
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: Colors.blue,
          //image of the app icon
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  permission = prefs.getBool('askForPermission') ?? true;
  lang = prefs.getBool('language') ?? true;
  if (lang) {
    locale = const Locale('en', 'US');
  } else {
    locale = const Locale('fr', 'FR');
  }
  showOnboardingScreen = prefs.getBool('showOnboardingScreen') ?? true;
  if (permission) {
    //asks user for permission to use gallery and camera
    await Permission.photos.request();
    await Permission.camera.request();
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new message has been published');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthController>(
          create: (_) => AuthController(),
        ),
      ],
      child: GetMaterialApp(
        translations: LanguageController(),
        debugShowCheckedModeBanner: false,
        locale: locale,
        fallbackLocale: const Locale('en', 'US'),
        title: 'Expose Banq',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
