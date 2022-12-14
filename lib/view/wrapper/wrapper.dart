import 'package:expose_banq/controllers/AuthController/authController.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/models/UserModel/userAuthModel.dart';
import 'package:expose_banq/view/auth/login/login_screen.dart';
import 'package:expose_banq/view/drawer/drawer_screen.dart';
import 'package:expose_banq/view/security/biometricVerification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthController>(context);
    print(authService.user);
    return StreamBuilder<Users?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<Users?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final Users? user = snapshot.data;
            return user != null ? const DrawerScreen() : const LoginScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
