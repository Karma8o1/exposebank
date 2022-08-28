import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../drawer/drawer_screen.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({Key? key}) : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
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
        title: Text(
          'Activity Details',
          style: poppinsRegular.copyWith(
            fontSize: 20.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),

      /// body
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: height(context) * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              /// receipt
              const SizedBox(height: 36.0),
              Container(
                width: width(context),
                padding: EdgeInsets.only(
                  top: height(context) * 0.08,
                  bottom: height(context) * 0.06,
                  left: 20.0,
                  right: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.receiptImage),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Transfered Total',
                      style: poppinsRegular.copyWith(
                        fontSize: 13.0,
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(height: height(context) * 0.01),
                    Text(
                      'XAF 1200.00',
                      style: poppinsRegular.copyWith(
                        fontSize: 30.0,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: height(context) * 0.014),
                    receiptDetailsText('Date', '12 May 2021'),
                    receiptDetailsText('Details', 'Netflix'),
                    receiptDetailsText('Reference num', 'A06453826151'),
                    receiptDetailsText('Account', 'Mike Wazowsky'),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: height(context) * 0.024,
                        left: height(context) * 0.05,
                        right: height(context) * 0.04,
                      ),
                      child: SizedBox(
                        width: width(context),
                        child: Image.asset(
                          AppImages.separateLineImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    receiptDetailsText('Total Payment', 'XAF 11.00'),
                    receiptDetailsText('Tax', 'XAF 0.00'),
                    receiptDetailsText('Admin fee', 'XAF 1.00'),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: height(context) * 0.024,
                        left: height(context) * 0.05,
                        right: height(context) * 0.04,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: poppinsBold.copyWith(
                              fontSize: 13.0,
                              color: AppColors.blackColor,
                            ),
                          ),
                          Text(
                            'XAF 12.00',
                            style: poppinsSemiBold.copyWith(
                              fontSize: 14.0,
                              color: AppColors.violetColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// app name widget
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AppNameWidget(),
                ],
              ),

              /// exposers texts
              const SizedBox(height: 16.0),
              Text('#Exposers',
                style: poppinsRegular.copyWith(
                  fontSize: 15.0,
                  color: AppColors.whiteColor,
                ),
              ),

              /// back to home button
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: CustomGradientButton(
                  borderRadius: 16.0,
                  btnHeight: 55.0,
                  btnText: 'Back to Homepage',
                  onTap: () {
                    Get.offAll(DrawerScreen());
                  },
                  btnColorOne: AppColors.violetColor,
                  btnColorTwo: AppColors.violetColor,
                  btnColorThree: AppColors.violetColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget receiptDetailsText(head, detail) => Padding(
        padding: EdgeInsets.only(
          bottom: height(context) * 0.024,
          left: height(context) * 0.05,
          right: height(context) * 0.04,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              head,
              style: poppinsRegular.copyWith(
                fontSize: 13.0,
                color: AppColors.greyColor,
              ),
            ),
            Text(
              detail,
              style: poppinsRegular.copyWith(
                fontSize: 14.0,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      );
}
