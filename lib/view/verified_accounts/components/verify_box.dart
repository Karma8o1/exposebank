import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class VerifyBox extends StatelessWidget {
  final bool? isVerify;
  final String? userImagePath;
  final String? userNameText;
  final String? paymentValueText;
  final VoidCallback? onTap;

  const VerifyBox({
    Key? key,
    required this.onTap,
    required this.isVerify,
    this.userImagePath = AppImages.userImage,
    required this.userNameText,
    required this.paymentValueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width(context),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        margin: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImagePath!),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userNameText!,
                    style: poppinsMedium.copyWith(
                      fontSize: 16.0,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              paymentValueText!,
              style: poppinsMedium.copyWith(
                fontSize: 16.0,
                color: isVerify == true
                    ? AppColors.parrotDarkColor
                    : AppColors.redDarkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
