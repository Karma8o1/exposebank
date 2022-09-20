import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/header.dart';
import 'package:expose_banq/const/random_text_ref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3des/flutter_3des.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:tripledes_nullsafety/tripledes_nullsafety.dart';

class FlutterwaveController {
  static Future<void> transferToMoMoAccount({
    required String accocuntNumber,
    required String amount,
    required String name,
  }) async {
    var details = {
      "account_bank": "FMM",
      "account_number": accocuntNumber,
      "amount": int.parse(amount),
      "narration": 'Transfer to $name',
      "currency": "XAF",
      "reference": 'MoMo-${getRandomString(15)}',
      "beneficiary_name": name.toUpperCase()
    };
  }

  //For nigerian accounts only
  static Future<void> validateBank({
    required String accountNumber,
    required String bankNumber,
  }) async {
    var details = jsonEncode({
      'account_number': accountNumber,
      'account_bank': bankNumber,
    });
    https
        .post(
      Uri.parse('https://api.flutterwave.com/v3/accounts'),
      headers: headers,
      body: details,
    )
        .then((value) {
      if (value.statusCode == 200) {
        print('Success : ${value.body}');
        return jsonDecode(value.body);
      } else {
        print('Error : ${value.reasonPhrase}');
        print('Error Message : ${value.body}');
        return jsonDecode(value.body);
      }
    });
  }

  static Future<void> sendMoneyToAccount(
      {required String accountType,
      required String senderAccount,
      required String amount,
      required String bank,
      required String reciverAccount,
      required String recieverName,
      required String firstName,
      required BuildContext context,
      required}) async {
    FirebaseFirestore.instance
        .collection(accountType)
        .doc(senderAccount)
        .update({'balance': FieldValue.increment(-int.parse(amount))}).then(
            (value) {
      https.post(Uri.parse('https://api.flutterwave.com/v3/transfers'),
          body: jsonEncode({
            "account_bank": bank,
            "account_number": reciverAccount,
            "amount": int.parse(amount),
            "narration": "Transfer from ",
            "currency": "XAF",
            "reference": getRandomString(15),
            "beneficiary_name": recieverName,
          }),
          headers: {
            'Authorization':
                'Bearer FLWSECK-35948c5eceb1ca6dc7164007ed32b803-X',
            'Content-Type': 'application/json'
          }).then((value) {
        Get.back();
        print(jsonDecode(value.body));
        var data = jsonDecode(value.body)['data'];
        FirebaseFirestore.instance.collection('transactions').doc().set({
          'fromAccount': senderAccount,
          //from user is the reference to the data of user send money
          "fromUser": firstName,
          'toAccount': reciverAccount,
          //Amount of money sent
          'amount': int.parse(amount),
          //if the account is current.saving etc.
          'typeOfAccount': bank,
          //deposit, withdraw, transfer, etc.
          'transactionType': 'Inter Bank Transfer',
          'transactionDate': Timestamp.fromDate(DateTime.now()),
          'userId': FirebaseAuth.instance.currentUser!.uid,
          'accounts': [
            senderAccount,
            senderAccount,
          ],
          'reference': data['reference'],
          'id': data['id'],
          'bankName': data['bank_name'],
        }).then((value) {
          ElegantNotification.success(
                  title: Text('Error Occured'),
                  description: Text(
                      'Something went wrong! Please try again after sometime.'))
              .show(context);
          Get.back();
        }).onError((error, stackTrace) {
          Get.back();
          ElegantNotification.error(
              title: Text('Error Occured'),
              description: Text(
                'Something went wrong! Please try again after sometime.',
              )).show(context);
        });
      }).onError((error, stackTrace) {
        Get.back();
        ElegantNotification.error(
                title: Text('Error Occured'),
                description: Text(
                    'Something went wrong! Please try again after sometime. Account refunded!'))
            .show(context);
        FirebaseFirestore.instance
            .collection(accountType)
            .doc(senderAccount)
            .update({'balance': FieldValue.increment(int.parse(amount))});
      }).onError((error, stackTrace) {
        ElegantNotification.error(
                title: Text('Error Occured'),
                description: Text(
                    'Something went wrong! Please try again after sometime.'))
            .show(context);
      });
    });
  }

  static Future<void> depositFromCard({
    required String cardNumber,
    required String cvv,
    required String expiryMonth,
    required String expiryYear,
    required int amount,
    required String email,
  }) async {
    var payload = {
      "card_number": cardNumber,
      "cvv": cvv,
      "expiry_month": expiryMonth,
      "expiry_year": expiryYear,
      "currency": "XAF",
      "amount": amount,
      "email": email,
      "tx_ref": "MC-${getRandomString(15)}",
      "redirect_url": "https://expose_banq.cloud/payment-redirect"
    };
    String encoded = jsonEncode(payload);
    // var blockCipher = BlockCipher(TripleDESEngine(), privateTestKey);
    // var i = blockCipher.encodeB64(encoded);
    var encrypt = await Flutter3des.encrypt(encoded, encTestKey, iv: "");
    print('Encoded data: $encrypt');
    https.post(Uri.parse('https://api.flutterwave.com/v3/charges?type=card'),
        body: jsonEncode({
          'client': encrypt,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${privateTestKey}'
        }).then((value) {
      print(jsonDecode(value.body));
    });
  }

  Map<String, String> encryptJsonPayload(
    String encryptionKey,
    String publicKey,
  ) {
    String encoded = jsonEncode(this);
    String encrypted = getEncryptedData(encoded, encryptionKey);

    final encryptedPayload = {
      "PBFPubKey": publicKey,
      "client": encrypted,
      "alg": "3DES-24"
    };

    return encryptedPayload;
  }

  String getEncryptedData(encoded, encryptionKey) {
    return encrypt(encryptionKey, encoded);
  }

  String encrypt(key, text) {
    var blockCipher = BlockCipher(TripleDESEngine(), key);
    var i = blockCipher.encodeB64(text);
    return i;
  }
}
