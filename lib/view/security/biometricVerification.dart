import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/controllers/biometric/biometricController.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/view/drawer/drawer_screen.dart';
import 'package:expose_banq/widgets/lib/src/flutter_pin_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

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
              'Verification Required',
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
                leftBottomWidget: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blackColor,
                    border: Border.all(
                      color: AppColors.blackLightColor,
                      width: 1.0,
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      bool isAuthenticated = await Biometric.authenticate();
                      if (isAuthenticated) {
                        setState(() {
                          showVerification = false;
                        });
                        Get.offAll(DrawerScreen());
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        AppImages.touchBtnImage,
                      ),
                    ),
                  ),
                ),
                onFullPin: (value, __) {
                  if (value == pinCode) {
                    setState(() {
                      showVerification = false;
                    });
                    Get.offAll(DrawerScreen());
                  } else {
                    ElegantNotification.error(
                      title: Text('Error'),
                      description: Text('Pin code does not match'),
                      toastDuration: const Duration(seconds: 5),
                    ).show(context);
                  }
                },
                initialPinLength: 4,
                onChangedPin: (_) {},
              ),
            ),
            SizedBox(height: height(context) * 0.04),
          ],
        ),
      ),
    );
  }
}
