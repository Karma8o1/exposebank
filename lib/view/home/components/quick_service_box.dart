import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class QuickServiceBox extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String? text;
  final Color? borderColor;

  const QuickServiceBox({Key? key,
    required this.onTap,
    this.borderColor = AppColors.violetColor,
    required this.icon,
    required this.text,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Ink(
            width: width(context),
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.blackColor,
              border: Border.all(
                color: borderColor!,
                width: 1.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(
                  icon,
                  color: AppColors.whiteColor,
                ),
                const SizedBox(height: 10.0),
                Text(text!,
                  style: poppinsLight.copyWith(
                    fontSize: 14.0,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
