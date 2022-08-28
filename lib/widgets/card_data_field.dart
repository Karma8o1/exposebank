import 'package:flutter/material.dart';

import '../const/exports.dart';

class CardDataField extends StatelessWidget {
  final String? titleText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;

  const CardDataField({Key? key,
    required this.titleText,
    required this.keyboardType,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            titleText!,
            style: poppinsRegular.copyWith(
              fontSize: 13.0,
              color: AppColors.greyColor,
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: height(context) * 0.22,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.1),
                  blurRadius: 15.0,
                  offset: const Offset(0.0, 7.5),
                ),
              ],
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText!,
              style: poppinsRegular.copyWith(
                fontSize: 13.0,
                color: AppColors.blueBlackColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(bottom: 4.0, left: 16.0,),
                hintText: hintText,
                hintStyle: poppinsRegular.copyWith(
                  fontSize: 13.0,
                  color: AppColors.blueBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
