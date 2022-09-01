import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/controllers/authController.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/view/kyc/kyc_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../const/exports.dart';
import '../login/login_screen.dart';

late final _formKey;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                  SizedBox(height: height(context) * 0.05),
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

                  /// francaise texts
                  const SizedBox(height: 16.0),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (lang) {
                          lang = !lang;
                          prefs.setBool('lang', !lang);
                          Get.updateLocale(const Locale('fr', 'FR'));
                        } else {
                          lang = !lang;
                          prefs.setBool('lang', !lang);
                          Get.updateLocale(const Locale('en', 'Us'));
                        }
                        Get.snackbar(
                          'change'.tr,
                          'language'.tr,
                          backgroundColor: Colors.white,
                          margin: const EdgeInsets.all(0),
                          borderRadius: 0,
                        );
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.gradientOneColor,
                            AppColors.gradientTwoColor,
                            AppColors.gradientThreeColor,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: Text(
                        'Francaise',
                        style: poppinsRegular.copyWith(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),

                  /// username or phone field
                  SizedBox(height: height(context) * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: CustomTextField(
                      controller: firstNameController,
                      hintText: 'name'.tr,
                      keyboardType: TextInputType.name,
                      validator: (value) {},
                    ),
                  ),

                  /// email field
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: CustomTextField(
                      controller: emailController,
                      hintText: 'email'.tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!GetUtils.isEmail(value.toString())) {
                          return 'Please enter a valid email';
                        }
                      },
                    ),
                  ),

                  /// phone number field
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: CustomTextField(
                      controller: phoneNumberController,
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
                      },
                    ),
                  ),

                  /// username field
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: CustomTextField(
                      controller: usernameController,
                      hintText: 'username'.tr,
                      keyboardType: TextInputType.name,
                      validator: (value) {},
                    ),
                  ),

                  /// pin code field
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: CustomTextField(
                      controller: pinCodeController,
                      hintText: 'pin'.tr,
                      keyboardType: TextInputType.number,
                      obscure: true,
                      validator: (value) {},
                    ),
                  ),

                  /// enter button
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: height(context) * 0.13,
                    ),
                    child: CustomGradientButton(
                      btnText: 'Enter',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          Get.to(KYCScreen(
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            pin: pinCodeController.text,
                            userName: usernameController.text,
                          ));
                          //information drilled to KYC form so the regsitration could be done after
                          //KYC form is filled

                          //registers user to firebase and stores the collected data.
                          // if (_formKey.currentState!.validate()) {
                          //   showLoading(context);
                          //   AuthController.registerUser(
                          //     phoneNumber: phoneNumberController.text.trim(),
                          //     firstName: firstNameController.text.trim(),
                          //     email: emailController.text.trim(),
                          //     username: usernameController.text.trim(),
                          //     pinCode: pinCodeController.text.trim(),
                          //     context: context,
                          //   );
                          // }
                        }
                      },
                    ),
                  ),

                  /// Already Have App Account? texts
                  SizedBox(height: height(context) * 0.05),
                  Text(
                    'Already Have App Account?',
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

                  /// Login Here button
                  SizedBox(height: height(context) * 0.01),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Login Here',
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
      ),
    );
  }
}
