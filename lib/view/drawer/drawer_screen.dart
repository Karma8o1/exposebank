// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/controllers/AuthController/authController.dart';
import 'package:expose_banq/controllers/biometric/biometricController.dart';
import 'package:expose_banq/controllers/userDataController/userDataController.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/models/jointAccountModel/joint_account_model.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:expose_banq/models/userData/userDataModel.dart';
import 'package:expose_banq/view/bank_account/bank_account_screen.dart';
import 'package:expose_banq/view/security/biometricVerification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../const/exports.dart';
import '../home/home_screen.dart';
import 'menu_screen.dart';

late final UserDataController userData;

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showVerification
          ? showDialog(
              context: context,
              builder: (context) {
                return const CreatePinScreen();
              })
          : null;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      FirebaseFirestore.instance
          .collection('userData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        userData =
            Get.put(UserDataController(userData: UserData.fromJson(value)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const HomeScreen(),
      clipMainScreen: false,
      borderRadius: 24.0,
      angle: 0.0,
      slideWidth: MediaQuery.of(context).size.width * 0.85,
      showShadow: true,
      mainScreenScale: 0.2,
      dragOffset: 50.0,
      androidCloseOnBackTap: false,
      style: DrawerStyle.defaultStyle,
      mainScreenTapClose: true,
      menuScreenTapClose: false,
      menuBackgroundColor: Colors.white,
      menuScreenWidth: width(context),
    );
  }
}

class DrawerOneScreen extends StatefulWidget {
  DrawerOneScreen(
      {Key? key, required this.accountName, required this.accountType})
      : super(key: key);
  String accountName;
  String accountType;
  @override
  State<DrawerOneScreen> createState() => _DrawerOneScreenState();
}

class _DrawerOneScreenState extends State<DrawerOneScreen> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: BankAccountPage(
        accountName: widget.accountName,
        accountType: widget.accountType,
      ),
      clipMainScreen: false,
      borderRadius: 24.0,
      angle: 0.0,
      slideWidth: MediaQuery.of(context).size.width * 0.85,
      showShadow: true,
      mainScreenScale: 0.2,
      dragOffset: 50.0,
      androidCloseOnBackTap: false,
      style: DrawerStyle.defaultStyle,
      mainScreenTapClose: true,
      menuScreenTapClose: false,
      menuBackgroundColor: Colors.white,
      menuScreenWidth: width(context),
    );
  }
}
