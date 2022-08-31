import 'package:expose_banq/controllers/authController.dart';
import 'package:expose_banq/controllers/languages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/starter/splash_screen.dart';

late Box box;
late Locale locale;
late SharedPreferences prefs;
late bool lang;
late bool showOnboardingScreen;
late bool permission;
// var hiveData = Hive.box('Data');
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
