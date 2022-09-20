import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AccountController {
  static Future<void> createNewAccounts({
    required String accountName,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    final _firestore = FirebaseFirestore.instance.collection('indiAccount');
    _firestore.doc(accountName).get().then((value) {
      if (value.exists) {
        return ElegantNotification.error(
          title: const Text('Error'),
          description: const Text(
              'Account with this name already exists. Choose other name'),
          dismissible: false,
          toastDuration: const Duration(seconds: 3),
        ).show(context);
      } else {
        _firestore.doc(accountName).set({
          'userRef': FirebaseAuth.instance.currentUser!.uid,
          'accountNumber': phoneNumber,
          'typeOfAccount': 'private',
          'accountName': accountName,
          'balance': 0,
          'isBlocked': false,
          'isSuspended': false,
          'isCardIssued': false,
          'creationDate': Timestamp.fromDate(DateTime.now()),
          'isVerified': true,
        }).then((value) {
          return ElegantNotification.success(
            title: const Text('Account Created'),
            description:
                Text('$accountName has been added to your private accounts'),
            dismissible: false,
            toastDuration: const Duration(seconds: 3),
          ).show(context);
        });
      }
    });
  }

  //when card functionality is to be added
  static Future<void> createNewCard({
    required String city,
    required String state,
    required String country,
    required String postalCode,
    required String town,
    required String name,
    required String assignedAccount,
  }) async {
    var data = jsonEncode({
      "currency": "USD",
      "amount": 5,
      "debit_currency": "NGN",
      "billing_name": name,
      "billing_address": "$town, $city, $state, $country",
      "billing_city": city,
      "billing_state": state,
      "billing_postal_code": postalCode,
      "billing_country": country,
    });
    http.post(
      Uri.parse('https://api.flutterwave.com/v3/virtual-cards'),
      body: data,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer FLWSECK-35948c5eceb1ca6dc7164007ed32b803-X'
      },
    ).then((value) {
      print('Response from server: ${value.body}');
    }).onError((error, stackTrace) {
      print('Error from server: $error');
    });
  }
}
