import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../drawer/drawer_screen.dart';

class FailedScreen extends StatefulWidget {
  const FailedScreen({Key? key}) : super(key: key);

  @override
  State<FailedScreen> createState() => _FailedScreenState();
}

class _FailedScreenState extends State<FailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        titleSpacing: 8.0,
        title: Text(
          'Transaction Success',
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height(context) * 0.085,
                  width: height(context) * 0.085,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.redDarkColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                Text(
                  'Sorry, Tansaction failed!',
                  style: poppinsLight.copyWith(
                    fontSize: 13.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 30.0),
              child: CustomGradientButton(
                borderRadius: 16.0,
                btnHeight: 55.0,
                btnText: 'Back to Homepage',
                onTap: () {
                  Get.offAll(DrawerScreen());
                },
                btnColorOne: AppColors.violetColor,
                btnColorTwo: AppColors.violetColor,
                btnColorThree: AppColors.violetColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
