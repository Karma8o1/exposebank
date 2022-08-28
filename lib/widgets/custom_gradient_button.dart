import 'package:flutter/material.dart';

import '../const/exports.dart';

class CustomGradientButton extends StatelessWidget {
  final String? btnText;
  final Color? btnColorOne;
  final Color? btnColorTwo;
  final Color? btnColorThree;
  final Color? btnTextColor;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final double? width;
  final EdgeInsets? margin;
  final Widget? btnRow;
  final double? borderRadius;
  final double? btnHeight;

  const CustomGradientButton({Key? key,
    required this.btnText,
    this.btnColorOne = AppColors.gradientOneColor,
    this.btnColorTwo = AppColors.gradientTwoColor,
    this.btnColorThree = AppColors.gradientThreeColor,
    this.btnTextColor = Colors.white,
    this.padding,
    required this.onTap,
    this.width,
    this.margin,
    this.btnRow,
    this.borderRadius = 18.0,
    this.btnHeight = 50.0,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        gradient: LinearGradient(
          colors: [
            btnColorOne!,
            btnColorTwo!,
            btnColorThree!,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(width ?? MediaQuery.of(context).size.width, btnHeight!),),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
        ),
        child: btnRow ?? Center(
          child: Text(
            btnText!,
            style: poppinsRegular.copyWith(
              fontSize: 16.0,
              color: btnTextColor,
            )
          ),
        ),
      ),
    );
  }
}