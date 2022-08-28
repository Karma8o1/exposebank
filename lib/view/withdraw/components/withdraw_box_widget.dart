import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class WithdrawBoxWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? bankImagePath;
  final Color? bankBoxColor;
  final String? bankTypeText;
  final String? bankNumberText;
  final Widget? checkBox;
  final bool? isPng;

  const WithdrawBoxWidget({Key? key,
    required this.onTap,
    required this.bankBoxColor,
    required this.bankImagePath,
    required this.bankNumberText,
    required this.bankTypeText,
    this.isPng = false,
    this.checkBox,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          margin:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bankBoxColor,
                ),
                child: Center(
                  child: isPng == true ? Image.asset(bankImagePath!) :  SvgPicture.asset(bankImagePath!),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bankTypeText!,
                      style: poppinsRegular.copyWith(
                        fontSize: 14.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      bankNumberText!,
                      style: poppinsRegular.copyWith(
                        fontSize: 13.0,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              checkBox!,
            ],
          ),
        ),
      ),
    );
  }
}
