import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Get.to(
        const OnBoardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
