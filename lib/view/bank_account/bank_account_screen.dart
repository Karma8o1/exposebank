// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expose_banq/models/jointAccountModel/joint_account_model.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:expose_banq/models/transactionModel/transaction_model.dart';
import 'package:expose_banq/view/approval_request_page/approval_request_screen.dart';
import 'package:expose_banq/view/drawer/drawer_screen.dart';
import 'package:expose_banq/widgets/fade_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../deposit/desposit_screen.dart';
import '../home/components/bank_card.dart';
import '../home/components/quick_service_box.dart';
import '../home/components/transaction_card_box.dart';
import '../payment_transfer/transfer_screen.dart';
import '../withdraw/withdraw_screen.dart';

class BankAccountPage extends StatefulWidget {
  BankAccountPage({
    Key? key,
    required this.accountName,
    required this.accountType,
    required this.accountNumber,
  }) : super(key: key);
  String accountName;
  String accountType;
  String accountNumber;

  @override
  State<BankAccountPage> createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  List<String> transTypeTexts = [
    'Deposit',
    'Withdrawal',
    'Transfer',
    'Deposit',
    'Withdrawal',
    'Transfer',
  ];

  List<Color> textColors = [
    AppColors.violetColor,
    AppColors.redDarkColor,
    AppColors.redDarkColor,
    AppColors.violetColor,
    AppColors.redDarkColor,
    AppColors.redDarkColor,
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.accountNumber);
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAll(DrawerScreen());
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
            size: 20,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// hi first name texts
            FadeAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              delay: 1.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${widget.accountName}',
                      style: poppinsRegular.copyWith(
                        fontSize: 20.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FadeAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                delay: 0.7,
                child: BankCardWidget(
                  accountName: widget.accountNumber,
                  accountType: widget.accountType,
                )),

            /// Bank Card

            const SizedBox(height: 24.0),

            Container(
              width: width(context),
              decoration: const BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.0),
                  topLeft: Radius.circular(24.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Quick Service texts
                  SizedBox(height: height(context) * 0.024),
                  FadeAnimation(
                    curve: Curves.ease,
                    delay: 1.2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'quick_service'.tr,
                        style: poppinsLight.copyWith(
                          fontSize: 15.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),

                  /// quick services box
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FadeAnimation(
                      curve: Curves.ease,
                      delay: 1.2,
                      child: SizedBox(
                        width: width(context),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              QuickServiceBox(
                                onTap: () {
                                  Get.to(const TransferScreen());
                                },
                                icon: CupertinoIcons.arrow_right_arrow_left,
                                text: 'transfer'.tr,
                              ),
                              SizedBox(width: height(context) * 0.032),
                              QuickServiceBox(
                                onTap: () {
                                  Get.to(const DepositScreen());
                                },
                                icon: CupertinoIcons.arrow_down,
                                text: 'deposit'.tr,
                              ),
                              SizedBox(width: height(context) * 0.032),
                              QuickServiceBox(
                                onTap: () {
                                  Get.to(const WithdrawScreen());
                                },
                                icon: CupertinoIcons.arrow_up,
                                text: 'withdraw'.tr,
                                borderColor: AppColors.redDarkColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Transaction history texts
                  SizedBox(height: height(context) * 0.016),
                  FadeAnimation(
                    curve: Curves.ease,
                    delay: 1.3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'transactionHistory'.tr,
                        style: poppinsLight.copyWith(
                          fontSize: 15.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),

                  /// list of transactions
                  const SizedBox(height: 10.0),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('transactions')
                          .where('accounts', arrayContainsAny: [
                        widget.accountNumber
                      ]).snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data!.docs.isNotEmpty) {
                          return FadeAnimation(
                            curve: Curves.ease,
                            delay: 1.3,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 50.0),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return TransactionCardBox(
                                  transactionType: snapshot.data!.docs[index]
                                      ['transactionType'],
                                  moneyColor: snapshot.data!.docs[index]
                                              ['toAccount'] ==
                                          widget.accountName
                                      ? Colors.green
                                      : Colors.red,
                                  amount: snapshot.data!.docs[index]['amount']
                                      .toString(),
                                  fromAccount: snapshot.data!.docs[index]
                                      ['fromAccount'],
                                  toAccount: snapshot.data!.docs[index]
                                      ['toAccount'],
                                  transactionDate: snapshot.data!.docs[index]
                                      ['transactionDate'],
                                );
                              },
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 4.8,
                              child: Center(
                                child: Text(
                                  'noTransactions'.tr,
                                  style: poppinsRegular.copyWith(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 4.8,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
