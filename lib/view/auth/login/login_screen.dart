import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/controllers/AuthController/authController.dart';
import 'package:expose_banq/controllers/biometric/biometricController.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/view/auth/pin/login_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';

import '../forgot_pass/forgot_pass_screen.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// app name
                SizedBox(height: height(context) * 0.2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AppNameWidget(),
                  ],
                ),

                /// exposers texts
                const SizedBox(height: 16.0),
                Text(
                  '#Exposers',
                  style: poppinsMedium.copyWith(
                    fontSize: 16.0,
                    color: AppColors.whiteColor,
                  ),
                ),

                /// username or phone field
                SizedBox(height: height(context) * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: phoneController,
                    hintText: 'phoneno'.tr,
                    keyboardType: TextInputType.phone,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r'[+,0-9]')),
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter mobile number';
                      }
                      if (value.toString().length < 11 ||
                          !value.toString().contains('+')) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                ),

                /// pin code field
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: pinCodeController,
                    hintText: 'Pin Code',
                    keyboardType: TextInputType.number,
                    obscure: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter pin code';
                      }
                      if (value.toString().length < 4) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      MaskedInputFormatter('0000'),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(const ForgotPasswordScreen());
                      },
                      child: Text(
                        'Forgot Password?',
                        style: poppinsRegular.copyWith(
                          fontSize: 14.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                canAuthenticate && phoneNumber!.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          final isAuthenticated =
                              await Biometric.authenticate();
                          if (isAuthenticated) {
                            setState(() {
                              phoneController.text = phoneNumber as String;
                              pinCodeController.text = pinCode as String;
                            });
                            AuthController.signInUser(
                              phoneNumber: phoneNumber as String,
                              pinCode: pinCode as String,
                              context: context,
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.fingerprint_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              'Login with Biometrics',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ))
                    : const SizedBox(height: 0.0),

                /// login button
                const SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: height(context) * 0.13,
                  ),
                  child: CustomGradientButton(
                    btnText: 'Login',
                    onTap: () {
                      setState(() {
                        showVerification = false;
                      });
                      AuthController.signInUser(
                        phoneNumber: phoneController.text,
                        pinCode: pinCodeController.text,
                        context: context,
                      );
                    },
                  ),
                ),

                /// having trouble with login texts
                SizedBox(height: height(context) * 0.08),
                Text(
                  'Having trouble logging in?',
                  style: poppinsRegular.copyWith(
                    fontSize: 14.0,
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),

                /// divider
                SizedBox(height: height(context) * 0.04),
                Container(
                  height: 1.5,
                  width: 70.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.whiteColor,
                  ),
                ),

                /// signup button
                SizedBox(height: height(context) * 0.01),
                TextButton(
                  onPressed: () {
                    Get.off(const SignupScreen());
                  },
                  child: Text(
                    'Signup',
                    style: poppinsRegular.copyWith(
                      fontSize: 14.0,
                      color: AppColors.whiteColor.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
