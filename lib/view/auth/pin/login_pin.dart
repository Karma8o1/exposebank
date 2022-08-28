import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/exports.dart';
import '../../../widgets/lib/flutter_pin_code_widget.dart';
import '../../drawer/drawer_screen.dart';


class LoginPinScreen extends StatefulWidget {
  const LoginPinScreen({Key? key}) : super(key: key);

  @override
  State<LoginPinScreen> createState() => _LoginPinScreenState();
}

class _LoginPinScreenState extends State<LoginPinScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 4), () => Get.to(const DrawerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        centerTitle: false,
        titleSpacing: 8.0,
        title: Text(
          'Security',
          style: poppinsRegular.copyWith(
            fontSize: 20.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),

      /// body
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height(context) * 0.05),
            Text(
              'Enter your passcode',
              style: poppinsRegular.copyWith(
                fontSize: 16.0,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: height(context) * 0.026),
            Expanded(
              child: PinCodeWidget(
                clearOnFilled: false,
                buttonColor: AppColors.blackLightColor,
                borderSide: const BorderSide(
                  color: AppColors.blackLightColor,
                  width: 1.0,
                ),
                deleteButtonColor: AppColors.blackColor,
                numbersStyle: poppinsLight.copyWith(
                  fontSize: 32.0,
                  color: AppColors.whiteColor,
                ),
                emptyIndicatorColor: AppColors.blackLightColor,
                filledIndicatorColor: AppColors.parrotColor,
                leftBottomWidget: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blackColor,
                      border: Border.all(
                        color: AppColors.blackLightColor,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(AppImages.touchBtnImage),
                    ),
                  ),
                ),
                onFullPin: (_, __) {},
                initialPinLength: 4,
                onChangedPin: (_) {},
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Resend PIN',
                style: poppinsRegular.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            SizedBox(height: height(context) * 0.04),
          ],
        ),
      ),
    );
  }
}
