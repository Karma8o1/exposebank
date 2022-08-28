import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../drawer/drawer_screen.dart';
import 'components/verify_box.dart';

class VerifiedAccountsScreen extends StatefulWidget {
  const VerifiedAccountsScreen({Key? key}) : super(key: key);

  @override
  State<VerifiedAccountsScreen> createState() => _VerifiedAccountsScreenState();
}

class _VerifiedAccountsScreenState extends State<VerifiedAccountsScreen> {
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
        /*title: Text(
          'List Of All Verifications',
          style: poppinsRegular.copyWith(
            fontSize: 20.0,
            color: AppColors.whiteColor,
          ),
        ),*/
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [

            const SizedBox(height: 36.0),

            Center(
              child: Text(
                'Bank Accounts List',
                style: poppinsRegular.copyWith(
                  fontSize: 20.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            const SizedBox(height: 36.0),
            VerifyBox(
              isVerify: true,
              userNameText: 'John Fonesca',
              timeText: '10:30pm',
              paymentValueText: '+ ₦1,800,400',
              onTap: () {
                Get.offAll(const DrawerOneScreen());
              },
            ),
            VerifyBox(
              isVerify: true,
              userNameText: 'John Fonesca',
              timeText: '10:30pm',
              paymentValueText: '+ ₦1,800,400',
              onTap: () {
                Get.offAll(const DrawerOneScreen());
              },
            ),
            VerifyBox(
              isVerify: false,
              userNameText: 'MTN Airtime Topup',
              timeText: '05:40pm',
              paymentValueText: '- ₦2,500',
              onTap: () {
                Get.offAll(const DrawerOneScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
