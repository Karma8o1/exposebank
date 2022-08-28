import 'package:flutter/material.dart';

import '../const/exports.dart';

class AppNameWidget extends StatelessWidget {
  final double? exposeTextSize;
  final double? banqTextSize;
  const AppNameWidget({
    Key? key,
    this.exposeTextSize = 24.0,
    this.banqTextSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Expose ',
          style: poppinsRegular.copyWith(
            fontSize: exposeTextSize,
            color: AppColors.yellowDarkColor,
          ),
        ),
        Text(
          'BanQ',
          style: poppinsRegular.copyWith(
            fontSize: banqTextSize,
            color: AppColors.redDarkColor,
          ),
        ),
      ],
    );
  }
}
