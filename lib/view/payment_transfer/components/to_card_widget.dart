import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../const/exports.dart';

class ToCardWidget extends StatelessWidget {
  const ToCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [
            AppColors.yellowLightColor,
            AppColors.parrotColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          transform: GradientRotation(math.e),
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
              Text('Main card',
                style: poppinsSemiBold.copyWith(
                  fontSize: 20.0,
                  color: AppColors.blackColor,
                ),
              ),
              Text('XAF 7,907.10',
                style: poppinsSemiBold.copyWith(
                  fontSize: 20.0,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('5167 1280 3300 1299',
                style: poppinsRegular.copyWith(
                  fontSize: 16.0,
                  color: AppColors.blackColor,
                ),
              ),
              SvgPicture.asset(AppIcons.masterCardIcon),
            ],
          ),
        ],
      ),
    );
  }
}
