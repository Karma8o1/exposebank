import 'package:expose_banq/view/bank_account/bank_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../const/exports.dart';
import '../home/home_screen.dart';
import 'menu_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();

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
  const DrawerOneScreen({Key? key}) : super(key: key);

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
      mainScreen: const BankAccountPage(),
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
