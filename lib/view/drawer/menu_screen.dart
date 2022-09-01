import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                const SizedBox(height: 16.0),
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(AppImages.userImage),
                ),

                /// user name
                const SizedBox(height: 16.0),
                FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Column(
                      children: [
                        Text(
                          snapshot.data['firstName'],
                          style: poppinsLight.copyWith(
                            fontSize: 18.0,
                            color: AppColors.whiteColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        /// user number and email
                        const SizedBox(height: 8.0),
                        Text(
                          '${snapshot.data['phoneNumber']} ${snapshot.data['emailAddress']}',
                          style: poppinsLight.copyWith(
                            fontSize: 12.0,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text('Loading.....');
                  }
                }),

                SizedBox(height: height(context) * 0.02),
                MenuButtonWidget(
                  onTap: () {
                    Get.offAll(const DrawerScreen());
                  },
                  text: 'Home',
                  iconPath: AppIcons.homeIcon,
                ),
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const VerifiedAccountsScreen());
                  },
                  text: 'Bank Accounts',
                  iconPath: AppIcons.bankAccountsIcon,
                ),

                MenuButtonWidget(
                  onTap: () {
                    Get.to(const SendMoneyScreen());
                  },
                  text: 'Send Money',
                  iconPath: AppIcons.sendMoneyIcon,
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
                  text: 'Change Language',
                  iconPath: AppIcons.languageIcon,
                ),
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const ContactUsScreen());
                  },
                  text: 'Contact Us',
                  iconPath: AppIcons.chatIcon,
                ),

                MenuButtonWidget(
                  onTap: () {
                    Get.to(const FaqsScreen());
                  },
                  text: 'FAQs',
                  iconPath: AppIcons.faqsIcon,
                ),

                // about us
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const AboutUsScreen());
                  },
                  text: 'About Us',
                  iconPath: AppIcons.aboutIcon,
                ),

                /// terms and condition
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const TermsAndConditionScreen());
                  },
                  text: 'Terms And Conditions',
                  iconPath: AppIcons.notificationIcon,
                ),

                /// privacy and policy screen
                MenuButtonWidget(
                  onTap: () {
                    Get.to(const PrivacyPolicyScreen());
                  },
                  text: 'Privacy & Policy',
                  iconPath: AppIcons.privacyIcon,
                ),

                /// Logout Button
                MenuButtonWidget(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  text: 'Logout',
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
