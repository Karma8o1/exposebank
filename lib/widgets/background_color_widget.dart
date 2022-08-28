import 'package:flutter/material.dart';

import '../const/exports.dart';

class BackGroundColorWidget extends StatelessWidget {
  final Widget? child;
  const BackGroundColorWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context),
      width: width(context),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 0.9,
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
            AppColors.primaryOneColor,
            AppColors.blueDarkColor,
          ],
         /* begin: Alignment.topCenter,
          end: Alignment.bottomCenter,*/
        ),
      ),
      child: child,
    );
  }
}
