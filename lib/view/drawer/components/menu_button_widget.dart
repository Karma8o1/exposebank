import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class MenuButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? iconPath;
  final String? text;
  final Color? textColor;
  final Color? iconColor;
  final double? textSize;

  const MenuButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.iconPath,
    this.textSize = 14.0,
    this.textColor = AppColors.whiteColor,
    this.iconColor = AppColors.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width(context) * 0.6,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor.withOpacity(0.15),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath!,
                  height: 16.0,
                  width: 16.0,
                  fit: BoxFit.scaleDown,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(width: height(context) * 0.018),
            Text(
              text!,
              style: poppinsRegular.copyWith(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
