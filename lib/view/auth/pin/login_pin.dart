// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/view/wrapper/wrapper.dart';
import 'package:expose_banq/widgets/lib/src/flutter_pin_code_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/exports.dart';

class LoginPinScreen extends StatefulWidget {
  LoginPinScreen({
    Key? key,
    required this.verificationId,
    required this.storeData,
    this.email,
    this.firstName,
    this.phoneNumber,
    this.pinCode,
    this.username,
  }) : super(key: key);

  @override
  State<LoginPinScreen> createState() => _LoginPinScreenState();
  String verificationId;
  bool storeData;
  String? firstName, email, phoneNumber, username, pinCode;
}

class _LoginPinScreenState extends State<LoginPinScreen> {
  @override
  void initState() {
    super.initState();
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
              'Enter your passcode recieved on phone',
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
                // leftBottomWidget: GestureDetector(
                //   onTap: (){

                //   },
                //   child: Container(
                //     margin: const EdgeInsets.all(15.0),
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: AppColors.blackColor,
                //       border: Border.all(
                //         color: AppColors.blackLightColor,
                //         width: 1.0,
                //       ),
                //     ),
                //     child: Center(
                //       child: SvgPicture.asset(AppImages.touchBtnImage),
                //     ),
                //   ),
                // ),
                onFullPin: (value, _) async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: value.toString());
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) async {
                      //stores data to firestore database entered by user
                      widget.storeData
                          ? await FirebaseFirestore.instance
                              .collection('userData')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                              'firstName': widget.firstName,
                              'emailAddress': widget.email,
                              'phoneNumber': widget.phoneNumber,
                              'userName': widget.username,
                              'pinCode': widget.pinCode,
                            }).then((value) {
                              Get.off(const Wrapper());
                            })
                          : ({Get.off(const Wrapper())});
                    });
                  } catch (e) {
                    print(e.toString());
                  }

                  // Sign the user in (or link) with the credential
                },
                initialPinLength: 6,
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
// OtpTextField(
//                       numberOfFields: 6,
//                       borderColor: const Color(0xFF512DA8),
//                       //set to true to show as box or false to show as dash
//                       showFieldAsBox: true,
//                       //runs when a code is typed in
//                       onCodeChanged: (String code) {
//                         //handle validation or checks here
//                       },
//                       //runs when every textfield is filled
//                       onSubmit: (String verificationCode) async {
//                         // Create a PhoneAuthCredential with the code
//                         auth.PhoneAuthCredential credential =
//                             auth.PhoneAuthProvider.credential(
//                                 verificationId: verificationId,
//                                 smsCode: verificationCode);

//                         // Sign the user in (or link) with the credential
//                         await auth.FirebaseAuth.instance
//                             .signInWithCredential(credential);
//                       }, // end onSubmit
//                     ),