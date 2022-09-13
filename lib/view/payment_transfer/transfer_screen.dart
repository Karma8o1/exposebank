import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/models/jointAccountModel/joint_account_model.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:expose_banq/models/userData/userDataModel.dart';
import 'package:expose_banq/view/security/security_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'components/card_widget.dart';
import 'components/to_card_widget.dart';

late List value;

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);
  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String? selectedValue;
  var choosenUser;
  String toAccount = 'indiAccount';
  String fromAccount = 'indiAccount';

  TextEditingController amountController = TextEditingController();
  TextEditingController recieverAccountController = TextEditingController();
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
        title: const Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// from the card texts
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                'Transfer to account',
                style: poppinsMedium.copyWith(
                  fontSize: 18.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'From Account',
                style: poppinsRegular.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
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
                        selectedValue = null;
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
                    builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        value = snapshot.data!.docs;
                        return Padding(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item['accountName'],
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                item['balance'].toString(),
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
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
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
                    builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        value = snapshot.data!.docs;
                        return Padding(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item['accountName'],
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                item['balance'].toString(),
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
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
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

            /// to the account texts
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'To account',
                style: poppinsRegular.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

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
                            "Select Reciever's Account Type",
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
                    value: toAccount,
                    onChanged: (value) {
                      setState(() {
                        choosenUser = null;
                        toAccount = value as String;
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

            /// to the cards
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: recieverAccountController,
                keyboardType: TextInputType.name,
                style: poppinsRegular.copyWith(
                  fontSize: 15.0,
                  color: AppColors.blackColor,
                  height: 1.5,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: AppColors.violetDarkColor,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: AppColors.violetDarkColor,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_search_rounded,
                    color: AppColors.greyColor,
                    size: 20.0,
                  ),
                  fillColor: AppColors.whiteColor,
                  filled: true,
                  labelText: 'Search Reciever',
                  hintText:
                      "Search Reciever's Expose username (Usernames are case sensetive)",
                  hintStyle: poppinsRegular.copyWith(
                    fontSize: 15.0,
                    color: AppColors.greyColor,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50.0),
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
                controller: amountController,
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
            recieverAccountController.text.isNotEmpty
                ? showAccounts(toAccount)
                : SizedBox(),

            /// cards list
            SizedBox(height: height(context) * 0.2),
            Center(
              child: InkWell(
                onTap: () {
                  print(selectedValue);
                  FirebaseFirestore.instance
                      .collection(fromAccount)
                      .doc(selectedValue)
                      .get()
                      .then((account) {
                    if (account['balance'] > int.parse(amountController.text)) {
                      if (toAccount == 'indiAccount') {
                        //gets reference for the reciver
                        FirebaseFirestore.instance
                            .collection('indiAccount')
                            .doc(recieverAccountController.text)
                            .get()
                            .then((value) {
                          FirebaseFirestore.instance
                              .collection('userData')
                              .doc(value['userRef'])
                              .get()
                              .then((value) {
                            Get.to(SecurityScreen(
                              amount: int.parse(amountController.text),
                              recieverAccount: recieverAccountController.text,
                              senderAccount: selectedValue.toString(),
                              reciverAccountType: toAccount,
                              senderAccountType: fromAccount,
                              recieverId: value['notificationToken'],
                            ));
                          });
                        });
                      } else {
                        Get.to(SecurityScreen(
                          amount: int.parse(amountController.text),
                          recieverAccount: recieverAccountController.text,
                          senderAccount: selectedValue.toString(),
                          reciverAccountType: toAccount,
                          senderAccountType: fromAccount,
                          recieverId: null,
                        ));
                      }
                    } else {
                      ElegantNotification.error(
                        title: Text('Error'),
                        description:
                            Text('Account does not have enough funds.'),
                        dismissible: false,
                        toastDuration: const Duration(seconds: 5),
                        notificationPosition: NotificationPosition.bottom,
                      ).show(context);
                    }
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
            ),
          ],
        ),
      ),
    );
  }

  // static Future<void> createNotification({
  //   required String title,
  //   required String description,
  //   required String recieverId,
  // }) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(
  //           'https://us-central1-expose-banq.cloudfunctions.net/fundsTransfer'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         'title': title,
  //         'desc': description,
  //         'recieverId': recieverId,
  //         'senderId': currentUser['notificationToken'],
  //       }),
  //     );
  //     if (response.statusCode == 201) {
  //       // If the server did return a 201 CREATED response,
  //       // then parse the JSON.
  //       print('server responsed');
  //     } else {
  //       // If the server did not return a 201 CREATED response,
  //       // then throw an exception.
  //       throw Exception('response failed. ${response.request}');
  //     }
  //   } catch (e) {
  //     print('Function error : $e');
  //   }
  // }

  Future<void> callNotificatioFunction({
    required String title,
    required String description,
    required String recieverId,
  }) async {
    try {
      FirebaseFirestore.instance
          .collection('userData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) async {
        final HttpsCallable callable =
            FirebaseFunctions.instance.httpsCallable('fundsTransfer');
        final resp = await callable.call(<String, dynamic>{
          'title': title,
          'desc': description,
          'recieverId': recieverId,
          'senderId': value['notificationToken'],
        });
        print('data from the response : ${resp.data}');
      });
    } on FirebaseFunctionsException catch (e) {
      print('Here is the error with functions: $e');
    }
  }

  Widget showAccounts(String accountType) {
    if (accountType == 'indiAccount') {
      return FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('indiAccount')
              .doc(recieverAccountController.text)
              .get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.exists) {
              PrivateAccountModel privateAccount =
                  PrivateAccountModel.fromJSON(snapshot.data!);
              return InkWell(
                onTap: () {
                  setState(() {
                    choosenUser = privateAccount;
                  });
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                  width: width(context),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.blackGreyColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              privateAccount.accountName,
                              style: poppinsMedium.copyWith(
                                fontSize: 16.0,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              privateAccount.accountNumber,
                              style: poppinsMedium.copyWith(
                                fontSize: 14.0,
                                color: AppColors.redDarkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasData && snapshot.data!.exists) {
              return Center(
                child: Text('No account with this name or number exists'),
              );
            }
            if (snapshot.hasError) {
              print('Error while search: ${snapshot.error}');
              return Center(
                child: Text('Error Occured!'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              );
            }
          });
    } else {
      return FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('jointAccount')
              .doc(recieverAccountController.text)
              .get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.exists) {
              JointAccountModel jointAccount =
                  JointAccountModel.fromSnapshot(snapshot.data!);
              return InkWell(
                onTap: () {
                  setState(() {
                    choosenUser = jointAccount;
                  });
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                  width: width(context),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.blackGreyColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              jointAccount.accountName,
                              style: poppinsMedium.copyWith(
                                fontSize: 16.0,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              jointAccount.typeOfAccount,
                              style: poppinsMedium.copyWith(
                                fontSize: 14.0,
                                color: AppColors.redDarkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No account with this name or number exists'),
              );
            }
            if (snapshot.hasError) {
              print('Error while search: ${snapshot.error}');
              return Center(
                child: Text('Error Occured!'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              );
            }
          });
    }
  }
}
