import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class CardTypeWidget extends StatelessWidget {
  final String? imagePath;
  final String? nameText;
  final String? cardNumberText;
  final String? cardTypePath;
  final VoidCallback? onTap;

  const CardTypeWidget({Key? key,
    required this.imagePath,
    required this.nameText,
    required this.cardNumberText,
    required this.cardTypePath,
    required this.onTap,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath!),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nameText!,
                      style: poppinsSemiBold.copyWith(
                        fontSize: 16.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          cardNumberText!,
                          style: poppinsLight.copyWith(
                            fontSize: 14.0,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        SvgPicture.asset(cardTypePath!),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.more_vert_outlined,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
