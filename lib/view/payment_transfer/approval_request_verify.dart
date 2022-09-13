// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/models/requestModel/request_model.dart';
import 'package:expose_banq/view/payment_transfer/field_screen.dart';
import 'package:expose_banq/view/payment_transfer/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';

class ApprovalRequestVerificationScreen extends StatefulWidget {
  ApprovalRequestVerificationScreen({
    Key? key,
    required this.request,
  }) : super(key: key);
  RequestModel request;
  @override
  State<ApprovalRequestVerificationScreen> createState() =>
      _ApprovalRequestVerificationScreenState();
}

class _ApprovalRequestVerificationScreenState
    extends State<ApprovalRequestVerificationScreen> {
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
              /// top desc texts
              SizedBox(
                height: height(context) * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'request'.tr,
                  style: poppinsMedium.copyWith(
                    fontSize: 20.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              /// available
              SizedBox(
                height: height(context) * 0.08,
              ),

              /// amount field
              SizedBox(height: height(context) * 0.016),
              SizedBox(
                height: 40.0,
                width: width(context) / 1.3,
                child: TextFormField(
                  controller: paymentController,
                  style: poppinsSemiBold.copyWith(
                    fontSize: 38.0,
                    color: AppColors.whiteColor,
                  ),
                  showCursor: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'XAF 0',
                    hintStyle: poppinsRegular.copyWith(
                      fontSize: 38.0,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ),

              /// commission texts
              SizedBox(height: height(context) * 0.016),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Commission:',
                    style: poppinsLight.copyWith(
                      fontSize: 16.0,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Text(
                    ' XAF 0',
                    style: poppinsMedium.copyWith(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
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
                    showLoading(context);
                    FirebaseFirestore.instance
                        .collection('jointAccount')
                        .doc(widget.request.accountName)
                        .set({
                      'accountName': widget.request.accountName,
                      'balance': 0,
                      'isSuspended': false,
                      'typeOfAccount': widget.request.accountType,
                      'partners': [
                        widget.request.senderRef,
                        widget.request.recieverRef
                      ],
                      'isCardIssued': false,
                      'creationDate': Timestamp.fromDate(DateTime.now()),
                    }).then((value) {
                      FirebaseFirestore.instance
                          .collection('requests')
                          .doc(
                            widget.request.id,
                          )
                          .update({'isPermissionGranted': 'Granted'}).then(
                              (value) {
                        ElegantNotification.success(
                                title: Text('Permission granted'),
                                description: Text(
                                    'Joint account has been created with name ${widget.request.accountName}'))
                            .show(context);
                      });
                      Get.to(SuccessScreen());
                    }).onError((error, stackTrace) {
                      ElegantNotification.error(
                          title: Text('Permission Denied'),
                          description: Text(
                            'Permission to create joint account has been denied.',
                          )).show(context);
                      Get.back();
                    });
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
                    try {
                      showLoading(context);
                      FirebaseFirestore.instance
                          .collection('requests')
                          .doc(widget.request.id)
                          .update({'isPermissionGranted': 'Denied'}).then(
                              (value) {
                        Get.back();
                      }).onError((error, stackTrace) {
                        Get.back();
                      });
                    } on FirebaseException catch (e) {
                      Get.to(FailedScreen());
                      ElegantNotification.error(
                          description: Text(
                        'Something went wrong. Please check your internet connection.',
                      )).show(context);
                    }
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
