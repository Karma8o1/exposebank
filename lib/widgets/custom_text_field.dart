import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/exports.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final TextEditingController? controller;
  final double? radius;
  final List<TextInputFormatter>? inputFormatter;

  CustomTextField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.radius = 20.0,
    this.inputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: width(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: AppColors.whiteColor,
      ),
      child: TextFormField(
        style: manropeRegular.copyWith(
          fontSize: 18.0,
          color: AppColors.fieldTextColor.withOpacity(0.5),
        ),
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 24.0),
          hintText: hintText,
          hintStyle: manropeLight.copyWith(
            fontSize: 14.0,
            color: AppColors.fieldTextColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
