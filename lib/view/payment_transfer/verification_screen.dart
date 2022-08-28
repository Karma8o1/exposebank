import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import 'success_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
          'Verification',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              /// sending money texts
              SizedBox(height: height(context) * 0.05),
              Text('Sending money',
                style: poppinsLight.copyWith(
                  fontSize: 16.0,
                  color: AppColors.greyColor,
                ),
              ),

              /// money
              SizedBox(height: height(context) * 0.01),
              Text('XAF 1,360',
                style: poppinsSemiBold.copyWith(
                  fontSize: 42.0,
                  color: AppColors.whiteColor,
                ),
              ),

              /// user image
              SizedBox(height: height(context) * 0.03),
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppImages.userImage),
              ),

              /// user name texts
              SizedBox(height: height(context) * 0.01),
              Text('Maria Callas',
                style: poppinsMedium.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),

              /// user card number texts
              SizedBox(height: height(context) * 0.008),
              Text('5812 9023 8431 1323',
                style: poppinsLight.copyWith(
                  fontSize: 14.0,
                  color: AppColors.whiteColor,
                ),
              ),

              /// master card icon
              SizedBox(height: height(context) * 0.006),
              SvgPicture.asset(AppIcons.masterCardIcon),

              /// arrow image
              SizedBox(height: height(context) * 0.05),
              Image.asset(AppImages.arrowImage),

              /// touch sensor image
              SizedBox(height: height(context) * 0.05),
              GestureDetector(
                onTap: (){
                  Get.to(SuccessScreen());
                },
                child: Image.asset(AppImages.touchSensorImage),
              ),

              /// touch sensor image
              SizedBox(height: height(context) * 0.024),
              Text('Touch ID sensor '
                  '\nto verify transaction',
                textAlign: TextAlign.center,
                style: poppinsMedium.copyWith(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),

              /// please verify texts
              SizedBox(height: height(context) * 0.01),
              Text('Please verify your identity',
                style: poppinsLight.copyWith(
                  fontSize: 16.0,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
