import 'dart:convert';
import 'package:expose_banq/const/header.dart';
import 'package:expose_banq/const/random_text_ref.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountController {
  static Future<void> createPrivateAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String billingName,
    required BuildContext context,
  }) async {
    final firestore = FirebaseFirestore.instance.collection('indiAccount');

    var data = jsonEncode({
      "email": "developers@flutterwavego.com",
      "tx_ref": "VA12- ${getRandomString(6)}",
      "phonenumber": phoneNumber.replaceAll('+', ''),
      "firstname": firstName,
      "lastname": lastName,
      "narration": "$firstName $lastName"
    });
    http
        .post(
            Uri.parse('https://api.flutterwave.com/v3/virtual-account-numbers'),
            headers: headers,
            body: data)
        .then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body)['data'];
        createNewCard(
          name: billingName,
          context: context,
          accountRef: data['account_number'],
        );
        firestore.doc(data['account_number']).set({
          'userRef': FirebaseAuth.instance.currentUser!.uid,
          'accountNumber': phoneNumber,
          'typeOfAccount': 'private',
          'accountName': billingName,
          'balance': 0,
          'isBlocked': false,
          'isSuspended': false,
          'isCardIssued': false,
          'creationDate': Timestamp.fromDate(DateTime.now()),
          'isVerified': true,
          "flw_ref": data['flw_ref'],
          "order_ref": data['order_ref'],
          "account_number": data['account_number'],
          "bank_name": data['bank_name'],
          "created_at": data['created_at'],
        }).then((value) {
          return ElegantNotification.success(
            title: const Text('Account Created'),
            description:
                Text('$billingName has been added to your private accounts'),
            toastDuration: const Duration(seconds: 3),
          ).show(context);
        });
      } else {
        ElegantNotification.error(
            title: Text('Something went wrong!'),
            description: Text(
              'Unable to process your account at the moment. Please try again.',
            )).show(context);
      }
    });
  }

  // //for creating account without flutterwave
  // static Future<void> createNewAccounts({
  //   required String accountName,
  //   required String phoneNumber,
  //   required BuildContext context,
  // }) async {
  //   final _firestore = FirebaseFirestore.instance.collection('indiAccount');
  //   _firestore.doc(accountName).get().then((value) {
  //     if (value.exists) {
  //       return ElegantNotification.error(
  //         title: const Text('Error'),
  //         description: const Text(
  //             'Account with this name already exists. Choose other name'),
  //         dismissible: false,
  //         toastDuration: const Duration(seconds: 3),
  //       ).show(context);
  //     } else {
  //       _firestore.doc(accountName).set({
  //         'userRef': FirebaseAuth.instance.currentUser!.uid,
  //         'accountNumber': phoneNumber,
  //         'typeOfAccount': 'private',
  //         'accountName': accountName,
  //         'balance': 0,
  //         'isBlocked': false,
  //         'isSuspended': false,
  //         'isCardIssued': false,
  //         'creationDate': Timestamp.fromDate(DateTime.now()),
  //         'isVerified': true,
  //       }).then((value) {
  //         return ElegantNotification.success(
  //           title: const Text('Account Created'),
  //           description:
  //               Text('$accountName has been added to your private accounts'),
  //           dismissible: false,
  //           toastDuration: const Duration(seconds: 3),
  //         ).show(context);
  //       });
  //     }
  //   });
  // }

  //when card functionality is to be added
  //create card with creation of account through flutterwave
  static Future<void> createNewCard({
    required String name,
    required String accountRef,
    required BuildContext context,
  }) async {
    var data = jsonEncode({
      "currency": "USD",
      "amount": 5,
      "billing_name": name,
    });
    http
        .post(
      Uri.parse('https://api.flutterwave.com/v3/virtual-cards'),
      body: data,
      headers: headers,
    )
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        var data = jsonDecode(value.body)['data'];
        FirebaseFirestore.instance.collection('virtualCards').doc().set({
          "id": data['id'],
          "account_id": data['account_id'],
          "amount": data['amount'],
          "currency": data['currency'],
          "card_hash": data['card_hash'],
          "card_pan": data['card_pan'],
          "masked_pan": data['masked_pan'],
          "cvv": data['cvv'],
          "expiration": data['expiration'],
          "card_type": data['card_type'],
          "name_on_card": data['name_on_card'],
          "created_at": data['created_at'],
          "is_active": data['is_active'],
          "belongs_to": accountRef,
        });
      } else {
        ElegantNotification.error(
                description: Text(value.reasonPhrase as String))
            .show(context);
        print('Error on card request: ${value.body}');
        return value.reasonPhrase;
      }
    }).onError((error, stackTrace) {
      print('Error from server: $error');
    });
  }
}
