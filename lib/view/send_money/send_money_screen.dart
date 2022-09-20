import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/header.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/const/random_text_ref.dart';
import 'package:expose_banq/controllers/apiController/api_controller.dart';
import 'package:expose_banq/controllers/biometric/biometricController.dart';
import 'package:expose_banq/controllers/flutterwaveController/flutterwave_controller.dart';
import 'package:expose_banq/controllers/userDataController/userDataController.dart';
import 'package:expose_banq/models/bankModel/bankModel.dart';
import 'package:expose_banq/widgets/card_data_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../const/exports.dart';
// import '../payment_transfer/components/card_widget.dart';
// import '../security/security_screen.dart';

late List value = [];

TextEditingController accountNumberController = TextEditingController();
TextEditingController accountNameController = TextEditingController();
TextEditingController enterAmountController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? senderAccount;
  String? accountType;
  String? bank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// total balance texts
              SizedBox(height: height(context) * 0.016),
              Center(
                child: Text(
                  'Send Money To Another Exposer',
                  style: poppinsLight.copyWith(
                    fontSize: 14.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Send From this my bank account',
                  style: poppinsRegular.copyWith(
                    fontSize: 15.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              /// from the cards
              const SizedBox(height: 16.0),
              SizedBox(
                  width: width(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: width(context),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Text(
                                "Select Sender's Account Type",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
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
                          value: accountType,
                          onChanged: (value) {
                            setState(() {
                              senderAccount = null;
                              accountType = value as String;
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
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
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
                  )),

              /// from the cards
              const SizedBox(height: 16.0),
              accountType == 'indiAccount'
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
                                                  item['accountName'].length >
                                                          20
                                                      ? item['accountName']
                                                          .subString(0, 20)
                                                      : item['accountName'],
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
                                  value: senderAccount,
                                  onChanged: (value) {
                                    setState(() {
                                      senderAccount = value as String;
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
                                  value: senderAccount,
                                  onChanged: (value) {
                                    setState(() {
                                      senderAccount = value as String;
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
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: enterAmountController,
                    hintText: 'XAF 100.00',
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Please enter account name';
                      } else {
                        return '';
                      }
                    })),
              ),

              /// To Texts
              SizedBox(height: height(context) * 0.016),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'To',
                  style: poppinsSemiBold.copyWith(
                    fontSize: 16.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              /// account number
              SizedBox(height: height(context) * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: accountNumberController,
                    hintText: "Reciver's Account Number",
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Please enter account name';
                      } else {
                        return '';
                      }
                    })),
              ),
              const SizedBox(
                height: 24,
              ),
              FutureBuilder<List<BankModel>>(
                  future: ApiController.getBanks(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
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
                                      'Select Bank',
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
                              items: snapshot.data!
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.code.toString(),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.name,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              item.id.toString(),
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
                              value: bank,
                              onChanged: (value) {
                                setState(() {
                                  bank = value as String;
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
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: width(context) - 10,
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
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 24.00,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomTextField(
                    controller: accountNameController,
                    hintText: 'Beneficery Name',
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Please enter account name';
                      } else {
                        return '';
                      }
                    })),
              ),
              SizedBox(height: height(context) * 0.03),

              /// send money button
              SizedBox(height: height(context) * 0.04),
              GetBuilder<UserDataController>(builder: (_) {
                return Center(
                  child: InkWell(
                    onTap: () async {
                      //account resolution is only available for nigerian banks
                      // FlutterwaveController.validateBank(
                      //   accountNumber: accountNumberController.text,
                      //   bankNumber: bank as String,
                      // );

                      if (_formKey.currentState!.validate()) {
                        bool isAuthenticated = await Biometric.authenticate();
                        if (isAuthenticated) {
                          // showLoading(context);
                          // FlutterwaveController.transferToMoMoAccount(accocuntNumber: accocuntNumber, amount: amount, name: name)
                        }
                      } else {
                        ElegantNotification.error(
                                title: Text('Fields Missing'),
                                description:
                                    Text('It is mandatory to fill all fields.'))
                            .show(context);
                      }
                    },
                    borderRadius: BorderRadius.circular(40.0),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.primaryOneColor,
                            AppColors.secondaryColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Text(
                        'Send Money',
                        style: poppinsSemiBold.copyWith(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Transfer({
    required String accountNameController,
    required String accountNumberController,
    required String amount,
    required String naration,
  }) async {}
}
