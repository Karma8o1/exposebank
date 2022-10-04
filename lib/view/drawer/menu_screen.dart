import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/controllers/userDataController/userDataController.dart';
import 'package:expose_banq/main.dart';
import 'package:expose_banq/models/userData/userDataModel.dart';
import 'package:expose_banq/view/bill_payment/bill_payment_screen.dart';
import 'package:expose_banq/view/wrapper/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../about_us/about_us_screen.dart';
import '../contact_us/contact_us_screen.dart';
import '../faq/faqs_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../send_money/send_money_screen.dart';
import '../terms_and_condition/terms_and_condition_screen.dart';
import '../verified_accounts/verified_accounts_screen.dart';
import 'components/menu_button_widget.dart';
import 'drawer_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context),
      width: width(context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.blackColor,
            AppColors.blackColor,
            AppColors.violetColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// app name
                SizedBox(height: height(context) * 0.07),
                const AppNameWidget(),

                /// circle avatar image

                /// user name
                const SizedBox(height: 16.0),

                /// Open Bank Account Immediately button
                FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('userData')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.exists) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16.0),
                            CircleAvatar(
                                radius: 25.0,
                                backgroundImage: NetworkImage(
                                    snapshot.data!['profileImage'])),
                            Text(
                              snapshot.data!['firstName'],
                              style: poppinsLight.copyWith(
                                fontSize: 18.0,
                                color: AppColors.whiteColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),

                            /// user number and email
                            const SizedBox(height: 8.0),
                            Text(
                              '${snapshot.data!['phoneNumber']} ${snapshot.data!['emailAddress'].contains('@gmail.com') ? snapshot.data!['emailAddress'].toString().replaceAll('@gmail.com', '') : snapshot.data!['emailAddress'].toString().replaceAll('.com', '')}',
                              style: poppinsLight.copyWith(
                                fontSize: 12.0,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        );
                      }
                      if (!snapshot.data!.exists) {
                        return Text('No User Data Found');
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.blue,
                          ),
                        );
                      }
                    }),

                SizedBox(height: height(context) * 0.02),
                MenuButtonWidget(
                  onTap: () {
                    zoomDrawerController.close;
                    Get.offAll(const DrawerScreen());
                  },
                  text: 'home'.tr,
                  iconPath: AppIcons.homeIcon,
                ),
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const VerifiedAccountsScreen());
                  },
                  text: 'Bank Account'.tr,
                  iconPath: AppIcons.bankAccountsIcon,
                ),

                MenuButtonWidget(
                  onTap: () {
                    Get.to(const SendMoneyScreen());
                  },
                  text: 'Send Money'.tr,
                  iconPath: AppIcons.sendMoneyIcon,
                ),
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const BillPayment());
                  },
                  text: 'bill'.tr,
                  iconPath: AppIcons.billPayment,
                ),

                MenuButtonWidget(
                  onTap: () {
                    setState(() {
                      if (lang) {
                        lang = !lang;
                        prefs.setBool('lang', !lang);
                        Get.updateLocale(const Locale('fr', 'FR'));
                      } else {
                        lang = !lang;
                        prefs.setBool('lang', !lang);
                        Get.updateLocale(const Locale('en', 'Us'));
                      }
                      Get.snackbar(
                        'change'.tr,
                        'language'.tr,
                        backgroundColor: Colors.white,
                        margin: const EdgeInsets.all(0),
                        borderRadius: 0,
                      );
                    });
                  },
                  text: 'Change Language'.tr,
                  iconPath: AppIcons.languageIcon,
                ),
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const ContactUsScreen());
                  },
                  text: 'Contact Us'.tr,
                  iconPath: AppIcons.chatIcon,
                ),

                MenuButtonWidget(
                  onTap: () {
                    Get.to(const FaqsScreen());
                  },
                  text: 'FAQs'.tr,
                  iconPath: AppIcons.faqsIcon,
                ),

                // about us
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const AboutUsScreen());
                  },
                  text: 'About Us'.tr,
                  iconPath: AppIcons.aboutIcon,
                ),

                /// terms and condition
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const TermsAndConditionScreen());
                  },
                  text: 'T&C'.tr,
                  iconPath: AppIcons.notificationIcon,
                ),

                /// privacy and policy screen
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const PrivacyPolicyScreen());
                  },
                  text: 'P&P'.tr,
                  iconPath: AppIcons.privacyIcon,
                ),

                /// Logout Button
                MenuButtonWidget(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Get.offAll(const Wrapper());
                    });
                  },
                  text: 'Logout'.tr,
                  textColor: AppColors.redDarkColor,
                  iconPath: AppIcons.logoutIcon,
                  iconColor: AppColors.redDarkColor,
                  textSize: 17.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
