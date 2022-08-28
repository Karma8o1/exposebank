import 'package:expose_banq/view/kyc/kyc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/exports.dart';
import '../login/login_screen.dart';

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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                  child: Text('Francaise',
                    style: poppinsRegular.copyWith(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),

                /// username or phone field
                SizedBox(height: height(context) * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
                    keyboardType: TextInputType.name,
                  ),
                ),

                /// email field
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                /// phone number field
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: phoneNumberController,
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                  ),
                ),

                /// username field
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: usernameController,
                    hintText: 'username ',
                    keyboardType: TextInputType.name,
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
                    onTap: () {
                      Get.to(KYCScreen());
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
                    Get.to(LoginScreen());
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
    );
  }
}
