// ignore_for_file: must_be_immutable

import 'package:expose_banq/models/jointAccountModel/joint_account_model.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:flutter/material.dart';

import '../const/exports.dart';

class ConfirmBottomSheet extends StatefulWidget {
  ConfirmBottomSheet({
    Key? key,
    this.isWithdraw,
    required this.amount,
    required this.jointAccountModel,
    required this.privateAccount,
  }) : super(key: key);
  int amount;
  PrivateAccountModel? privateAccount;
  JointAccountModel? jointAccountModel;

  final bool? isWithdraw;

  @override
  State<ConfirmBottomSheet> createState() => _ConfirmBottomSheetState();
}

class _ConfirmBottomSheetState extends State<ConfirmBottomSheet> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController accountController = TextEditingController();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height(context) * 0.04),
            //account to send ammount to

            /// withdarw texts
            Text(
              widget.isWithdraw == true
                  ? 'Confirm Withdraw'
                  : 'Confirm Deposit',
              style: poppinsRegular.copyWith(
                fontSize: 14.0,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: height(context) * 0.016),

            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
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
              child: CustomTextField(
                controller: accountController,
                hintText: 'Mobile Money Account Number',
                validator: ((validator) {
                  if (validator!.isEmpty) {
                    return 'Please enter account number.';
                  }
                }),
              ),
            ),

            /// amount box
            SizedBox(height: height(context) * 0.006),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
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
                    'XAF ${widget.amount}',
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
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
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
                        'XAF ${widget.amount}',
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
                        'XAF ${(widget.amount / 100).toString()}',
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
                btnText: widget.isWithdraw == true
                    ? 'Withdraw'.toUpperCase()
                    : 'Deposit'.toUpperCase(),
                onTap: () {
                  // var payload = {
                  //   "account_bank": "FMM",
                  //   "account_number": accountController.text,
                  //   "amount": widget.amount,
                  //   "narration": "New franco transfer",
                  //   "currency": "XAF",
                  //   "reference": "new-franco-momo-test-transfer",
                  //   "beneficiary_name": "Flutterwave Developers"
                  // };
                },
                borderRadius: 6.0,
                btnColorOne: widget.isWithdraw == true
                    ? AppColors.redDarkColor
                    : AppColors.violetColor,
                btnColorTwo: widget.isWithdraw == true
                    ? AppColors.redDarkColor
                    : AppColors.violetColor,
                btnColorThree: widget.isWithdraw == true
                    ? AppColors.redDarkColor
                    : AppColors.violetColor,
              ),
            ),

            SizedBox(height: height(context) * 0.06),
          ],
        ),
      ),
    );
  }
}
