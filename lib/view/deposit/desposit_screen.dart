import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/const/header.dart';
import 'package:expose_banq/const/random_text_ref.dart';
import 'package:expose_banq/controllers/flutterwaveController/flutterwave_controller.dart';
import 'package:expose_banq/controllers/userDataController/userDataController.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/widgets/confirm_bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

// import 'package:flutterwave/flutterwave.dart';

import '../withdraw/components/withdraw_box_widget.dart';

TextEditingController depositValueController = TextEditingController();
TextEditingController accountController = TextEditingController();
TextEditingController cvvController = TextEditingController();
TextEditingController expiryMonthController = TextEditingController();
TextEditingController expiryYearController = TextEditingController();
TextEditingController emailController = TextEditingController();
late List value;

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  String? selectedAccount;
  String? depositorMethod;
  var choosenUser;
  String fromAccount = 'indiAccount';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
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
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Desposit texts
              const SizedBox(height: 24.0),
              Text(
                'Desposit to Expose Banq',
                style: poppinsMedium.copyWith(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),

              /// payment texts
              SizedBox(height: height(context) * 0.03),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 60,
                  width: width(context),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              "Select Sender's Account Type",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: ['indiAccount', 'jointAccount']
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item == 'indiAccount'
                                          ? 'Private Account'
                                          : 'Joint Account',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: fromAccount,
                      onChanged: (value) {
                        setState(() {
                          selectedAccount = null;
                          fromAccount = value as String;
                          print(value);
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                ),
              ),

              /// from the cards
              const SizedBox(height: 16.0),
              fromAccount == 'indiAccount'
                  ? StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('indiAccount')
                          .where(
                            'userRef',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                          )
                          .snapshots(),
                      builder:
                          ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          value = snapshot.data!.docs;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              height: 60,
                              width: width(context),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Account',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: value
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item.id,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item['accountName'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  item['balance'].toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedAccount,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAccount = value as String;
                                      print(value);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: 160,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
                          );
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              'No Accounts have been created yet',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                            ),
                          );
                        }
                      }),
                    )
                  : StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('jointAccount')
                          .where(
                        'partners',
                        arrayContainsAny: [
                          FirebaseAuth.instance.currentUser!.uid
                        ],
                      ).snapshots(),
                      builder:
                          ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          value = snapshot.data!.docs;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              height: 60,
                              width: width(context),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Account',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: value
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item.id,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item['accountName'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  item['balance'].toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedAccount,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAccount = value as String;
                                      print(value);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: 160,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              'No Accounts have been created yet',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                            ),
                          );
                        }
                      }),
                    ),

              /// payment texts
              SizedBox(height: height(context) * 0.03),

              Container(
                height: 50.0,
                width: width(context),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.5),
                    width: 0.5,
                  ),
                ),
                child: TextFormField(
                  controller: depositValueController,
                  keyboardType: TextInputType.number,
                  style: poppinsMedium.copyWith(
                    fontSize: 17.0,
                    color: AppColors.whiteColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 24.0),
                    labelText: 'Amount',
                    labelStyle: poppinsRegular.copyWith(
                      fontSize: 15.0,
                      color: AppColors.greyColor.withOpacity(0.5),
                    ),
                    hintText: 'XAF 20.00',
                    hintStyle: poppinsMedium.copyWith(
                      fontSize: 17.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height(context) * 0.01),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 60,
                  width: width(context),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              "Select Transaction Type",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: [
                        'Card',
                        'Mobile Money',
                      ]
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: depositorMethod,
                      onChanged: (value) {
                        setState(() {
                          depositorMethod = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                ),
              ),

              /// space
              SizedBox(
                height: height(context) * 0.07,
              ),
              depositorMethod == null
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: parameters(
                        transactionType: depositorMethod ?? '',
                        hintText: 'Please enter $depositorMethod ',
                      )),

              /// space
              SizedBox(
                height: height(context) * 0.27,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget parameters({
    required String transactionType,
    required String hintText,
  }) {
    if (transactionType == 'Card') {
      return Column(
        children: [
          CustomTextField(
              controller: accountController,
              keyboardType: TextInputType.number,
              hintText: '$hintText number',
              inputFormatter: [MaskedInputFormatter('0000 0000 0000 0000')],
              validator: ((value) {})),
          const SizedBox(
            height: 14,
          ),
          CustomTextField(
              controller: cvvController,
              keyboardType: TextInputType.number,
              hintText: '$hintText cvv',
              validator: ((value) {})),
          const SizedBox(
            height: 14,
          ),
          CustomTextField(
              controller: expiryMonthController,
              keyboardType: TextInputType.number,
              hintText: '$hintText Expiry Month',
              validator: ((value) {})),
          const SizedBox(
            height: 14,
          ),
          CustomTextField(
              controller: expiryYearController,
              keyboardType: TextInputType.number,
              hintText: '$hintText Expiry Year',
              validator: ((value) {})),
          const SizedBox(
            height: 14,
          ),
          CustomTextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              hintText: 'Email Address',
              validator: ((value) {})),
          const SizedBox(
            height: 14,
          ),
          GetBuilder<UserDataController>(
            builder: ((controller) {
              return Center(
                child: InkWell(
                  onTap: () {
                    FlutterwaveController.depositFromCard(
                      cardNumber: accountController.text,
                      cvv: cvvController.text,
                      expiryMonth: expiryMonthController.text,
                      expiryYear: expiryYearController.text,
                      amount: int.parse(depositValueController.text),
                      email: emailController.text,
                    );
                  },
                  borderRadius: BorderRadius.circular(50.0),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48.0, vertical: 14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.btnOneColor,
                          AppColors.blackColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      'Transfer',
                      style: poppinsSemiBold.copyWith(
                        fontSize: 14.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      );
    }
    if (transactionType == 'Mobile Money') {
      return Column(
        children: [
          CustomTextField(
              controller: accountController,
              hintText: hintText,
              validator: ((value) {})),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<UserDataController>(
            builder: ((controller) {
              return Center(
                child: InkWell(
                  onTap: () {
                    if (int.parse(depositValueController.text) < 200) {
                      ElegantNotification.error(
                              description:
                                  Text('Minimum sending amount is XAF 200.00'))
                          .show(context);
                      return;
                    }
                    var payload = jsonEncode({
                      'phone_number': '+237693374327'.replaceAll('+', ''),
                      'amount': 1,
                      'currency': 'XAF',
                      'email': controller.userData.email,
                      'tx_ref': 'MM-${getRandomString(15)}',
                    });
                    post(
                      Uri.parse(
                          'https://api.flutterwave.com/v3/charges?type=mobile_money_franco'),
                      body: payload,
                      headers: headers,
                    ).then((value) {
                      print(jsonDecode(value.body));
                    });
                  },
                  borderRadius: BorderRadius.circular(50.0),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48.0, vertical: 14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.btnOneColor,
                          AppColors.blackColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      'Transfer',
                      style: poppinsSemiBold.copyWith(
                        fontSize: 14.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }
}
