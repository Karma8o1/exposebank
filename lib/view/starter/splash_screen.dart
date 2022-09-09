// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/view/auth/login/login_screen.dart';
import 'package:expose_banq/view/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../const/exports.dart';
import '../onboarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Changes after 5 seconds from splash screen to onboarding
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result != true) {
        ElegantNotification.error(
          title: const Text("No or Unstable Connection"),
          description:
              const Text("Make sure your device is connected to internet"),
          notificationPosition: NotificationPosition.bottom,
          dismissible: true,
          autoDismiss: true,
          animationDuration: const Duration(seconds: 2),
          height: 70,
          width: MediaQuery.of(context).size.width - 50,
        ).show(context);
      }
      Timer(
          const Duration(seconds: 0),
          () => Get.off(showOnboardingScreen
              ? const OnBoardingScreen()
              : const Wrapper()));
    });
    return BackGroundColorWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: height(context),
          width: width(context),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppNameWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
