import 'package:flutter/material.dart';

import '../const/exports.dart';

class ConfirmBottomSheet extends StatefulWidget {
  const ConfirmBottomSheet({Key? key, this.isWithdraw}) : super(key: key);

  final bool? isWithdraw;

  @override
  State<ConfirmBottomSheet> createState() => _ConfirmBottomSheetState();
}

class _ConfirmBottomSheetState extends State<ConfirmBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: height(context) * 0.04),

          /// withdarw texts
          Text(
            widget.isWithdraw == true ? 'Confirm Withdraw' : 'Confirm Deposit',
            style: poppinsRegular.copyWith(
              fontSize: 14.0,
              color: AppColors.blackColor,
            ),
          ),

          /// amount box
          SizedBox(height: height(context) * 0.036),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            width: width(context),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(
                color: AppColors.blackColor.withOpacity(0.2),
                width: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Amount',
                  style: poppinsLight.copyWith(
                    fontSize: 12.0,
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  'XAF 20.00',
                  style: poppinsMedium.copyWith(
                    fontSize: 16.0,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),

          /// bank account box
          SizedBox(height: height(context) * 0.024),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            width: width(context),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(
                color: AppColors.blackColor.withOpacity(0.2),
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bank Account',
                        style: poppinsLight.copyWith(
                          fontSize: 12.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        '2348 9874 532',
                        style: poppinsRegular.copyWith(
                          fontSize: 14.0,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 42.0,
                  width: 64.0,
                  child: Image.asset(AppImages.cardImage),
                ),
              ],
            ),
          ),

          /// amount fee box
          SizedBox(height: height(context) * 0.024),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            width: width(context),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(
                color: AppColors.blackColor.withOpacity(0.2),
                width: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: poppinsLight.copyWith(
                        fontSize: 12.0,
                        color: AppColors.greyColor,
                      ),
                    ),
                    Text(
                      'XAF 250',
                      style: poppinsMedium.copyWith(
                        fontSize: 16.0,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fee',
                      style: poppinsLight.copyWith(
                        fontSize: 12.0,
                        color: AppColors.greyColor,
                      ),
                    ),
                    Text(
                      'Free',
                      style: poppinsMedium.copyWith(
                        fontSize: 16.0,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// withdraw button
          SizedBox(height: height(context) * 0.036),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: height(context) * 0.12,
            ),
            child: CustomGradientButton(
              btnText: widget.isWithdraw == true ? 'Withdraw'.toUpperCase() : 'Deposit'.toUpperCase(),
              onTap: () {},
              borderRadius: 6.0,
              btnColorOne: widget.isWithdraw == true ? AppColors.redDarkColor : AppColors.violetColor,
              btnColorTwo: widget.isWithdraw == true ? AppColors.redDarkColor : AppColors.violetColor,
              btnColorThree: widget.isWithdraw == true ? AppColors.redDarkColor : AppColors.violetColor,
            ),
          ),

          SizedBox(height: height(context) * 0.06),
        ],
      ),
    );
  }
}
