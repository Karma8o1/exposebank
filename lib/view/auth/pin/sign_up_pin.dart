import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/const/app_text_styles.dart';
import 'package:expose_banq/const/sizes.dart';
import 'package:expose_banq/controllers/accountController/account_controller.dart';
import 'package:expose_banq/view/wrapper/wrapper.dart';
import 'package:expose_banq/widgets/lib/flutter_pin_code_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/app_colors.dart';

class SignUpPinScreen extends StatefulWidget {
  SignUpPinScreen({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.pinCode,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.sex,
    required this.nationality,
    required this.martialStatus,
    required this.motherLastName,
    required this.nationCardNumber,
    required this.nicOrPassportIssueDate,
    required this.nicOrPassportExpiryDate,
    required this.profession,
    required this.countryOfResidence,
    required this.regionOrProvince,
    required this.town,
    required this.profile,
    required this.cnicFront,
    required this.cnicBack,
    required this.token,
  }) : super(key: key);
  String phoneNumber,
      firstName,
      lastName,
      email,
      username,
      pinCode,
      dateOfBirth,
      placeOfBirth,
      sex,
      nationality,
      martialStatus,
      motherLastName,
      nationCardNumber,
      nicOrPassportIssueDate,
      nicOrPassportExpiryDate,
      profession,
      countryOfResidence,
      regionOrProvince,
      town,
      token;
  String verificationId;

  String? profile, cnicFront, cnicBack;
  @override
  State<SignUpPinScreen> createState() => _SignUpPinScreenState();
}

class _SignUpPinScreenState extends State<SignUpPinScreen> {
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
                  'Enter your passcode recieved on phone',
                  style: poppinsRegular.copyWith(
                    fontSize: 16.0,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: height(context) * 0.026),
                Expanded(
                  child: PinCodeWidget(
                      initialPinLength: 6,
                      onChangedPin: (_) {},
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
                      onFullPin: (value, _) async {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.verificationId,
                                smsCode: value.toString());

                        await FirebaseAuth.instance
                            .signInWithCredential(credential)
                            .then((value) async {
                          //stores data to firestore database entered by user

                          FirebaseFirestore.instance
                              .collection('userData')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                            'firstName': widget.firstName,
                            'emailAddress': widget.email,
                            'phoneNumber': widget.phoneNumber,
                            'userName': widget.username,
                            'pinCode': widget.pinCode,
                            'lastName': widget.lastName,
                            'dateOfBirth': widget.dateOfBirth,
                            'placeOfBirth': widget.placeOfBirth,
                            'sex': widget.sex,
                            'nationality': widget.nationality,
                            'martialStatus': widget.martialStatus,
                            'motherLastName': widget.motherLastName,
                            'nationCardNumber': widget.nationCardNumber,
                            'nicOrPassportIssueDate':
                                widget.nicOrPassportIssueDate,
                            'nicOrPassportExpiryDate':
                                widget.nicOrPassportExpiryDate,
                            'profession': widget.profession,
                            'countryOfResidence': widget.countryOfResidence,
                            'regionOrProvince': widget.regionOrProvince,
                            'townController': widget.town,
                            'notificationToken': widget.token,
                            //Urls of the images stored in firebase storage
                            'profileImage': widget.profile,
                            'nicFront': widget.cnicFront,
                            'nicBack': widget.cnicBack,
                            'isSuspended': false,
                            'isBanned': false,
                          }).then((value) {
                            // showLoading(context);
                            AccountController.createPrivateAccount(
                                    firstName: widget.firstName,
                                    lastName: widget.lastName,
                                    email: widget.email,
                                    phoneNumber: widget.phoneNumber,
                                    billingName: widget.email
                                            .contains('@gmail.com')
                                        ? widget.email
                                            .replaceAll('@gmail.com', '')
                                        : widget.email.replaceAll('.com', ''),
                                    context: context)
                                .then((value) => Get.off(const Wrapper()));
                          });
                        });
                      }),

                  // Sign the user in (or link) with the credential
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
              ]),
        ));
  }
}
