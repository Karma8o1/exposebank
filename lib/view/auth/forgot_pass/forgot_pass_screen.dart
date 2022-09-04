import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/exports.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: height(context),
          width: width(context),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// app name
                  SizedBox(height: height(context) * 0.15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AppNameWidget(),
                    ],
                  ),

                  /// exposers texts
                  const SizedBox(height: 16.0),
                  Text(
                    '#Exposers',
                    style: poppinsMedium.copyWith(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),

                  /// Enter phone number field
                  SizedBox(height: height(context) * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: CustomTextField(
                      controller: phoneNumberController,
                      hintText: 'Enter phone number',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field cannot be empty.';
                        }
                        if (!value.contains('+')) {
                          return 'Internation format is required.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  /// Your Mother’s Full name field
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: CustomTextField(
                      controller: motherNameController,
                      hintText: 'Your Mother’s last name',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field cannot be empty.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  /// Send Pin button
                  const SizedBox(height: 32.0),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: height(context) * 0.13,
                    ),
                    child: CustomGradientButton(
                      btnText: 'Send Pin ',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          showLoading(context);
                          //Gets the data stored against the phone number
                          FirebaseFirestore.instance
                              .collection('userData')
                              .where('phoneNumber',
                                  isEqualTo: phoneNumberController.text)
                              .limit(1)
                              .get()
                              .then((value) {
                            //Checks if the user is registered
                            if (value.docs.isNotEmpty) {
                              //Checks if the name provided is true
                              var sendUserPinCode = FirebaseFunctions.instance
                                  .httpsCallable('sendUserPinCode');
                              sendUserPinCode({});
                              if (value.docs[0]['motherLastName']
                                      .toString()
                                      .toLowerCase() ==
                                  motherNameController.text.toLowerCase()) {
                                twilioFlutter
                                    .sendSMS(
                                        toNumber: phoneNumberController.text,
                                        messageBody:
                                            'Pin code for your account is: ${value.docs[0]['pinCode']}')
                                    .then((value) {
                                  Get.back();

                                  ElegantNotification.success(
                                          title: const Text(
                                              'Verification Successful'),
                                          description: const Text(
                                              'Your pin code has been sent to your mobile phone'))
                                      .show(context);
                                });
                              } else {
                                Get.back();
                                ElegantNotification.error(
                                        title:
                                            const Text('Verification Failed'),
                                        description: const Text(
                                            "Mother's name did not match."))
                                    .show(context);
                              }
                            } else {
                              //Incase of unregistered user trying to forget password
                              ElegantNotification.error(
                                      title: const Text('Unregistered user'),
                                      description: const Text(
                                          "User is not registered with this bank."))
                                  .show(context);
                            }
                          });
                        } else {
                          ElegantNotification.error(
                                  title: const Text('Incomplete data'),
                                  description: const Text(
                                      "All fields should be filled."))
                              .show(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
