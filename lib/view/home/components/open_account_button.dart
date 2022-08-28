import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class OpenAccountButton extends StatefulWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String? text;

  const OpenAccountButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  State<OpenAccountButton> createState() => _OpenAccountButtonState();
}

class _OpenAccountButtonState extends State<OpenAccountButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(50.0),
          child: Ink(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: AppColors.blackGreyColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 14.0,
                  color: AppColors.whiteColor,
                ),
                const SizedBox(width: 8.0),
                Text(
                  widget.text!,
                  style: poppinsRegular.copyWith(
                    fontSize: 13.0,
                    color: AppColors.whiteColor,
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
