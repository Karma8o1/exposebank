import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:expose_banq/models/UserModel/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthController {
  final auth.FirebaseAuth _fbAuth = auth.FirebaseAuth.instance;
  Users? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return Users(user.uid, user.phoneNumber);
  }

  Stream<Users?>? get user {
    return _fbAuth.authStateChanges().map(_userFromFirebase);
  }

  static Future<void> registerUser({
    required String phoneNumber,
    required String firstName,
    required String email,
    required String username,
    required String pinCode,
    required context,
  }) async {
    await auth.FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (auth.PhoneAuthCredential credential) async {
        await auth.FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (auth.FirebaseAuthException e) {
        Get.back();
        ElegantNotification.error(
          title: const Text('Failed to send code'),
          description: Text(e.message.toString()),
          notificationPosition: NotificationPosition.bottom,
          dismissible: true,
          autoDismiss: true,
          animationDuration: const Duration(seconds: 2),
          height: 70,
          width: MediaQuery.of(context).size.width - 50,
        ).show(context);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.back();
        showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: ((context, setState) {
                return AlertDialog(
                  content: OtpTextField(
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) async {
                      // Create a PhoneAuthCredential with the code
                      auth.PhoneAuthCredential credential =
                          auth.PhoneAuthProvider.credential(
                              verificationId: verificationId,
                              smsCode: verificationCode);

                      // Sign the user in (or link) with the credential
                      await auth.FirebaseAuth.instance
                          .signInWithCredential(credential);
                      FirebaseFirestore.instance
                          .collection('userData')
                          .doc()
                          .set({
                        'firstName': firstName,
                        'emailAddress': email,
                        'phoneNumber': phoneNumber,
                        'userName': username,
                        'pinCode': pinCode,
                      });
                    }, // end onSubmit
                  ),
                );
              }));
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
