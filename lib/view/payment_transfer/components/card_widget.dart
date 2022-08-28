import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../const/exports.dart';

class FromCardWidget extends StatelessWidget {
  const FromCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [
            AppColors.orangeColor,
            AppColors.cardBackColor,
            AppColors.cardBackColor,
            AppColors.orangeColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(math.pi/5),
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
              Text('USA weekend',
                style: poppinsSemiBold.copyWith(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),
              Text('XAF 3,150.70',
                style: poppinsSemiBold.copyWith(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('7228 9021 3300 1502',
                style: poppinsRegular.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
              SvgPicture.asset(AppImages.visaTextImage),
            ],
          ),
        ],
      ),
    );
  }
}
