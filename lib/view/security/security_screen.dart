import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/controllers/biometric/biometricController.dart';
import 'package:expose_banq/controllers/userDataController/userDataController.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:expose_banq/models/userData/userDataModel.dart';
import 'package:expose_banq/view/home/home_screen.dart';
import 'package:expose_banq/view/payment_transfer/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_functions/cloud_functions.dart';
import '../../const/exports.dart';
import '../../widgets/lib/flutter_pin_code_widget.dart';
import '../drawer/drawer_screen.dart';

class SecurityScreen extends StatefulWidget {
  SecurityScreen({
    Key? key,
    required this.amount,
    required this.recieverAccount,
    required this.senderAccount,
    required this.reciverAccountType,
    required this.senderAccountType,
    required this.recieverId,
  }) : super(key: key);
  int amount;
  String senderAccount;
  String recieverAccount;
  String reciverAccountType;
  String senderAccountType;
  String? recieverId;
  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    print('sender account type: ${widget.senderAccountType}');
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
      body: GetBuilder<UserDataController>(
        builder: (_) {
          return SizedBox(
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
                      onTap: () async {
                        bool isAuthenticated = await Biometric.authenticate();
                        if (isAuthenticated) {
                          showLoading(context);

                          FirebaseFirestore.instance
                              .collection(widget.senderAccountType)
                              .doc(widget.senderAccount)
                              .update({
                            'balance': FieldValue.increment(-widget.amount)
                          }).then((value) {
                            FirebaseFirestore.instance
                                .collection(widget.reciverAccountType)
                                .doc(widget.recieverAccount)
                                .update({
                              'balance': FieldValue.increment(widget.amount)
                            }).then((value) {
                              FirebaseFirestore.instance
                                  .collection('transactions')
                                  .doc()
                                  .set({
                                    'fromAccount': widget.senderAccount,
                                    //from user is the reference to the data of user send money
                                    "fromUser": _.userData.firstName,
                                    'toAccount': widget.recieverAccount,
                                    //Amount of money sent
                                    'amount': widget.amount,
                                    //if the account is current.saving etc.
                                    'typeOfAccount': widget.reciverAccountType,
                                    //deposit, withdraw, transfer, etc.
                                    'transactionType': 'funds transfer',
                                    'transactionDate':
                                        Timestamp.fromDate(DateTime.now()),
                                    'userId':
                                        FirebaseAuth.instance.currentUser!.uid,
                                    'accounts': [
                                      widget.senderAccount,
                                      widget.recieverAccount,
                                    ]
                                  })
                                  .then((value) {
                                    Get.back();
                                    Get.offAll(DrawerScreen());
                                    ElegantNotification.success(
                                            title: Text(
                                                'Funds transfer have been successful!'),
                                            description:
                                                Text('Transaction successful!'))
                                        .show(context);
                                  })
                                  .onError((error, stackTrace) {})
                                  .then((value) {});
                            }).then((value) {});
                          });
                        } else {
                          ElegantNotification.error(
                            title: Text('Verification Failed'),
                            description: Text(
                                'Verification failed due to fingerprint mismatch.'),
                          );
                        }
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
                    onFullPin: (data, __) {
                      showLoading(context);
                      FirebaseFirestore.instance
                          .collection('userData')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .get()
                          .then((value) {
                        if (value['pinCode'] == data) {
                          FirebaseFirestore.instance
                              .collection('indiAccount')
                              .doc(widget.senderAccount)
                              .update({
                            'balance': FieldValue.increment(-widget.amount)
                          }).then((value) {
                            FirebaseFirestore.instance
                                .collection(widget.reciverAccountType)
                                .doc(widget.recieverAccount)
                                .update({
                              'balance': FieldValue.increment(widget.amount)
                            }).then((value) {
                              // callNotificatioFunction(
                              //   title: 'Transaction Notification',
                              //   description:
                              //       'Funds of ${widget.amount} have been transfered',
                              //   recieverId: widget.recieverId,
                              // );

                              FirebaseFirestore.instance
                                  .collection('transactions')
                                  .doc()
                                  .set({
                                'fromAccount': widget.senderAccount,
                                //from user is the reference to the data of user send money
                                "fromUser": _.userData.firstName,
                                'toAccount': widget.recieverAccount,
                                //Amount of money sent
                                'amount': widget.amount,
                                //if the account is current.saving etc.
                                'typeOfAccount': widget.reciverAccountType,
                                //deposit, withdraw, transfer, etc.
                                'transactionType': 'funds transfer',
                                'transactionDate':
                                    Timestamp.fromDate(DateTime.now()),
                                'userId':
                                    FirebaseAuth.instance.currentUser!.uid,
                                'relatedAccounts': [
                                  widget.senderAccount,
                                  widget.recieverAccount
                                ],
                              }).then((value) {
                                Get.back();
                                Get.offAll(DrawerScreen());
                                ElegantNotification.success(
                                        title: Text(
                                            'Funds transfer have been successful!'),
                                        description:
                                            Text('Transaction successful!'))
                                    .show(context);
                              });
                            });
                          });
                        }
                      });
                    },
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
          );
        },
      ),
    );
  }
}
