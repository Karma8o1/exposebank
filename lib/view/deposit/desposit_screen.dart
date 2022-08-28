import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/widgets/confirm_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../withdraw/components/withdraw_box_widget.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {

  bool isPersonal = true;
  bool isGroup = false;
  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Desposit texts
              const SizedBox(height: 24.0),
              Text(
                'Desposit',
                style: poppinsMedium.copyWith(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),

              /// payment texts
              SizedBox(height: height(context) * 0.07),

              Container(
                height: 50.0,
                width: width(context),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.5),
                    width: 0.5,
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: poppinsMedium.copyWith(
                    fontSize: 17.0,
                    color: AppColors.whiteColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 24.0),
                    labelText: 'Amount',
                    labelStyle: poppinsRegular.copyWith(
                      fontSize: 15.0,
                      color: AppColors.greyColor.withOpacity(0.5),
                    ),
                    hintText: 'XAF 20.00',
                    hintStyle: poppinsMedium.copyWith(
                      fontSize: 17.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),

              /// space
              SizedBox(height: height(context) * 0.27,),

              /// bank accounts
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Deposit into Bank Account',
                        style: poppinsRegular.copyWith(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Add',
                        style: poppinsRegular.copyWith(
                          fontSize: 13.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// personal bank account
              WithdrawBoxWidget(
                onTap: () {

                  setState(() {
                    isPersonal = true;
                    isGroup = false;
                    isSaving = false;
                  });

                  Get.bottomSheet(
                    const ConfirmBottomSheet(
                      isWithdraw: false,
                    ),
                    backgroundColor: AppColors.whiteColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28.0),
                        topLeft: Radius.circular(28.0),
                      ),
                    ),

                    enableDrag: true,
                    enterBottomSheetDuration: const Duration(milliseconds: 400),
                    exitBottomSheetDuration: const Duration(milliseconds: 400),
                  );
                },
                bankBoxColor: AppColors.personalColor,
                bankImagePath: AppImages.personalAccountImage,
                bankNumberText: '**** *** 2878',
                bankTypeText: 'Personal Account',
                checkBox: isPersonal == true
                    ? Container(
                  height: 22.0,
                  width: 22.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.checkedColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 14.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                )
                    : Container(
                  height: 22.0,
                  width: 22.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                    border: Border.all(
                      width: 2.0,
                      color: AppColors.borderColor,
                    ),
                  ),
                ),
              ),

              /// group bank account
              WithdrawBoxWidget(
                onTap: () {
                  setState(() {
                    isPersonal = false;
                    isGroup = true;
                    isSaving = false;
                  });

                  Get.bottomSheet(
                    const ConfirmBottomSheet(
                      isWithdraw: false,
                    ),
                    backgroundColor: AppColors.whiteColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28.0),
                        topLeft: Radius.circular(28.0),
                      ),
                    ),

                    enableDrag: true,
                    enterBottomSheetDuration: const Duration(milliseconds: 400),
                    exitBottomSheetDuration: const Duration(milliseconds: 400),
                  );
                },
                bankBoxColor: AppColors.groupColor,
                bankImagePath: AppImages.groupAccountImage,
                bankNumberText: '**** *** 3720',
                bankTypeText: 'Group Account',
                checkBox: isGroup == true
                    ? Container(
                  height: 22.0,
                  width: 22.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.checkedColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 14.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                )
                    : Container(
                  height: 22.0,
                  width: 22.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                    border: Border.all(
                      width: 2.0,
                      color: AppColors.borderColor,
                    ),
                  ),
                ),
              ),

              /// saving bank account
              WithdrawBoxWidget(
                onTap: () {

                  Get.bottomSheet(
                    const ConfirmBottomSheet(
                      isWithdraw: false,
                    ),
                    backgroundColor: AppColors.whiteColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28.0),
                        topLeft: Radius.circular(28.0),
                      ),
                    ),

                    enableDrag: true,
                    enterBottomSheetDuration: const Duration(milliseconds: 400),
                    exitBottomSheetDuration: const Duration(milliseconds: 400),
                  );
                  setState(() {
                    isPersonal = false;
                    isGroup = false;
                    isSaving = true;
                  });
                },
                isPng: true,
                bankBoxColor: AppColors.savingColor,
                bankImagePath: AppImages.savingAccountImage,
                bankNumberText: '**** *** 3980',
                bankTypeText: 'Saving Account',
                checkBox: isSaving == true
                    ? Container(
                  height: 22.0,
                  width: 22.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.checkedColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 14.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                )
                    : Container(
                  height: 22.0,
                  width: 22.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                    border: Border.all(
                      width: 2.0,
                      color: AppColors.borderColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
