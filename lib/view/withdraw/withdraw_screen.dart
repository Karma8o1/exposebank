import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../../widgets/confirm_bottom_sheet.dart';
import 'components/withdraw_box_widget.dart';

late List value;

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  bool isPersonal = true;
  bool isGroup = false;
  bool isSaving = false;
  String? selectedValue;
  var choosenUser;
  String toAccount = 'indiAccount';
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

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
              /// withdraw texts
              const SizedBox(height: 24.0),
              Text(
                'Withdraw',
                style: poppinsMedium.copyWith(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 60,
                  width: width(context),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              "Select Sender's Account Type",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: ['indiAccount', 'jointAccount']
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item == 'indiAccount'
                                          ? 'Private Account'
                                          : 'Joint Account',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: toAccount,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = null;
                          toAccount = value as String;
                          print(value);
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                ),
              ),

              /// from the cards
              const SizedBox(height: 16.0),
              toAccount == 'indiAccount'
                  ? StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('indiAccount')
                          .where(
                            'userRef',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                          )
                          .snapshots(),
                      builder:
                          ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          value = snapshot.data!.docs;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              height: 60,
                              width: width(context),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Account',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: value
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item.id,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item['accountName'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  item['balance'].toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                      print(value);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: 160,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
                          );
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              'No Accounts have been created yet',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                            ),
                          );
                        }
                      }),
                    )
                  : StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('jointAccount')
                          .where(
                        'partners',
                        arrayContainsAny: [
                          FirebaseAuth.instance.currentUser!.uid
                        ],
                      ).snapshots(),
                      builder:
                          ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          value = snapshot.data!.docs;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              height: 60,
                              width: width(context),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Account',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: value
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item.id,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item['accountName'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  item['balance'].toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                      print(value);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: 160,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              'No Accounts have been created yet',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                            ),
                          );
                        }
                      }),
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
                  controller: amountController,
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
              SizedBox(
                height: height(context) * 0.27,
              ),

              /// bank accounts
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Transfer to account',
                        style: poppinsRegular.copyWith(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
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
                    ConfirmBottomSheet(
                      isWithdraw: true,
                      amount: int.parse(amountController.text),
                      jointAccountModel: null,
                      privateAccount: null,
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
                    ConfirmBottomSheet(
                      isWithdraw: true,
                      amount: int.parse(amountController.text),
                      jointAccountModel: null,
                      privateAccount: null,
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
            ],
          ),
        ),
      ),
    );
  }
}
