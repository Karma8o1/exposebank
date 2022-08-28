import 'package:expose_banq/view/payment_transfer/field_screen.dart';
import 'package:expose_banq/view/payment_transfer/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../verified_accounts/verified_accounts_screen.dart';

class ApprovalRequestTwoScreen extends StatefulWidget {
  const ApprovalRequestTwoScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalRequestTwoScreen> createState() =>
      _ApprovalRequestTwoScreenState();
}

class _ApprovalRequestTwoScreenState
    extends State<ApprovalRequestTwoScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController paymentController = TextEditingController();

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
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: AppNameWidget(),
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

              const SizedBox(height: 16.0,),
              Center(
                child: Text(
                  'Verification',
                  style: poppinsRegular.copyWith(
                    fontSize: 20.0,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),

              /// top desc texts
              SizedBox(
                height: height(context) * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'You are requested by the admins of group bank '
                      'account to verify the activity below!',
                  style: poppinsMedium.copyWith(
                    fontSize: 20.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              SizedBox(height: height(context) * 0.03),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                color: AppColors.blackGreyColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.userImage),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Maria Callas',
                            style: poppinsSemiBold.copyWith(
                              fontSize: 16.0,
                              color: AppColors.greyColor,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            '@marialove',
                            style: poppinsLight.copyWith(
                              fontSize: 14.0,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.more_vert_outlined,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),

              /// middle desc texts
              SizedBox(
                height: height(context) * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'You are requested by the admins of group bank '
                      'account to verify the activity below!',
                  style: poppinsMedium.copyWith(
                    fontSize: 20.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              /// arrow image
              SizedBox(height: height(context) * 0.02),
              Image.asset(AppImages.arrowImage),

              /// approve button
              SizedBox(height: height(context) * 0.03),
              Padding(
                padding: EdgeInsets.only(
                    left: height(context) * 0.13,
                    right: height(context) * 0.13,
                    bottom: 40.0),
                child: CustomGradientButton(
                  borderRadius: 16.0,
                  btnHeight: 55.0,
                  btnText: 'Approve',
                  onTap: () {
                    Get.to(const SuccessScreen());
                  },
                  btnColorOne: AppColors.violetColor,
                  btnColorTwo: AppColors.violetColor,
                  btnColorThree: AppColors.violetColor,
                ),
              ),

              /// decline button
              Padding(
                padding: EdgeInsets.only(
                    left: height(context) * 0.13,
                    right: height(context) * 0.13),
                child: CustomGradientButton(
                  borderRadius: 16.0,
                  btnHeight: 55.0,
                  btnText: 'Decline',
                  onTap: () {
                    Get.to(const FailedScreen());
                  },
                  btnColorOne: AppColors.redDarkColor,
                  btnColorTwo: AppColors.redDarkColor,
                  btnColorThree: AppColors.redDarkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
