import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
}
