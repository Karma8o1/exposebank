import 'package:expose_banq/view/wrapper/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/models/UserModel/user.dart';
import 'package:expose_banq/view/auth/pin/login_pin.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

late String imageUrl;

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

  static Future<void> signInUser({
    required String phoneNumber,
    required String pinCode,
    required BuildContext context,
  }) async {
    FirebaseFirestore.instance
        .collection('userData')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .limit(1)
        .get()
        .then((value) {
      showLoading(context);
      if (value.docs[0]['pinCode'] == pinCode) {
        auth.FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (auth.PhoneAuthCredential credential) async {
            await auth.FirebaseAuth.instance.signInWithCredential(credential);
            Get.off(const Wrapper());
          },
          verificationFailed: (auth.FirebaseAuthException e) {
            Get.back();
            ElegantNotification.error(
              title: const Text('Failed to send code'),
              description: Text(e.message.toString()),
              notificationPosition: NotificationPosition.bottom,
              dismissible: true,
              autoDismiss: true,
              animationDuration: const Duration(seconds: 5),
              height: 100,
              width: MediaQuery.of(context).size.width - 50,
            ).show(context);
          },
          codeSent: (String verificationId, int? resendToken) {
            Get.back();
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      insetPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: LoginPinScreen(
                          verificationId: verificationId,
                          //this makes sure the user sign in does not mess with user data
                          storeData: false,
                        ),
                      ));
                });
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } else {
        Get.back();
        ElegantNotification.error(
          title: const Text('Error'),
          description: const Text('Pin Code does not match'),
          toastDuration: const Duration(seconds: 5),
        ).show(context);
        return;
      }
    });
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
        Get.back();
        await auth.FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          await FirebaseFirestore.instance
              .collection('userData')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            'firstName': firstName,
            'emailAddress': email,
            'phoneNumber': phoneNumber,
            'userName': username,
            'pinCode': pinCode,
          }).then((value) => Get.off(const Wrapper()));
        });
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
              return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  insetPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: LoginPinScreen(
                      verificationId: verificationId,
                      //this stores data to firestore upon registration
                      storeData: true,
                      email: email,
                      firstName: firstName,
                      pinCode: pinCode,
                      phoneNumber: phoneNumber,
                      username: username,
                    ),
                  ));
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
