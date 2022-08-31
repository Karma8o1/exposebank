import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
      ),
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
                SizedBox(height: height(context) * 0.15),
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

                /// Enter phone number field
                SizedBox(height: height(context) * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: phoneNumberController,
                    hintText: 'Enter phone number',
                    validator: (value) {},
                  ),
                ),

                /// Your Mother’s Full name field
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextField(
                    controller: motherNameController,
                    hintText: 'Your Mother’s Full name',
                    keyboardType: TextInputType.name,
                    validator: (value) {},
                  ),
                ),

                /// Send Pin button
                const SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: height(context) * 0.13,
                  ),
                  child: CustomGradientButton(
                    btnText: 'Send Pin ',
                    onTap: () {},
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
