import 'package:expose_banq/view/payment_transfer/approval_request_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../payment_transfer/approval_request_verify.dart';
import '../verified_accounts/components/verify_box.dart';

class ApprovalRequestScreen extends StatefulWidget {
  const ApprovalRequestScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalRequestScreen> createState() => _ApprovalRequestScreenState();
}

class _ApprovalRequestScreenState extends State<ApprovalRequestScreen> {
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
        centerTitle: true,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'List Of All Verifications',
                style: poppinsRegular.copyWith(
                  fontSize: 18.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            VerifyBox(
              isVerify: true,
              userNameText: 'John Fonesca',
              paymentValueText: '+ ₦1,800,400',
              onTap: () {
                Get.to(const ApprovalRequestVerificationScreen());
              },
            ),
            VerifyBox(
              isVerify: true,
              userNameText: 'John Fonesc',
              paymentValueText: '+ ₦1,800,400',
              onTap: () {
                Get.to(const ApprovalRequestTwoScreen());
              },
            ),
            VerifyBox(
              isVerify: false,
              userNameText: 'MTN Airtime Topup',
              paymentValueText: '- ₦2,500',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
