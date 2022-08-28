import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../const/exports.dart';
import 'verification_screen.dart';

class AmountScreen extends StatefulWidget {
  const AmountScreen({Key? key}) : super(key: key);

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {

  TextEditingController paymentController = TextEditingController();

 /* static const _locale = 'en';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;*/


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
          'Amount',
          style: poppinsRegular.copyWith(
            fontSize: 20.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),

      /// body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// card box
          SizedBox(height: height(context) * 0.016),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.userImage),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Maria Callas',
                        style: poppinsSemiBold.copyWith(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '5812 9023 8431 1323',
                            style: poppinsLight.copyWith(
                              fontSize: 14.0,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          SvgPicture.asset(AppIcons.masterCardIcon),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_vert_outlined,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),

          const Expanded(child: SizedBox()),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Available:',
                    style: poppinsLight.copyWith(
                      fontSize: 16.0,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Text(
                    ' \$ 3,150.70',
                    style: poppinsMedium.copyWith(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height(context) * 0.016),
              SizedBox(
                height: 40.0,
                width: width(context) / 2,
                child: TextFormField(
                  controller: paymentController,
                  style: poppinsSemiBold.copyWith(
                    fontSize: 42.0,
                    color: AppColors.whiteColor,
                  ),
                  showCursor: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '\$ 1,360.00',
                    hintStyle: poppinsRegular.copyWith(
                      fontSize: 42.0,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height(context) * 0.016),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Commission:',
                    style: poppinsLight.copyWith(
                      fontSize: 16.0,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Text(
                    ' \$ 3.30',
                    style: poppinsMedium.copyWith(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          CustomGradientButton(
            onTap: () {
              Get.to(VerificationScreen());
            },
            borderRadius: 0.0,
            btnText: 'Send Money',
            btnColorOne: AppColors.parrotColor,
            btnColorTwo: AppColors.parrotColor,
            btnColorThree: AppColors.orangeColor,
          ),
        ],
      ),
    );
  }
}
