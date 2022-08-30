import 'package:expose_banq/const/exports.dart';
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
  TextEditingController usernameOrPhoneController = TextEditingController();
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
                    controller: usernameOrPhoneController,
                    hintText: 'username or phone number',
                    inputFormatter: [
                      MaskedInputFormatter('00000-0000000'),
                    ],
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
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      MaskedInputFormatter('00000'),
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

                /// login button
                const SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: height(context) * 0.13,
                  ),
                  child: CustomGradientButton(
                    btnText: 'Login',
                    onTap: () {
                      Get.to(const LoginPinScreen());
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
                    Get.to(const SignupScreen());
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
