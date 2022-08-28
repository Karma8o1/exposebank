import 'package:expose_banq/view/activity_detail/activity_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/exports.dart';

class TransactionCardBox extends StatelessWidget {
 final String? transactionType;
 final Color? moneyColor;
 final VoidCallback? onTap;

 const TransactionCardBox({Key? key,
   required this.transactionType,
   required this.moneyColor,
   this.onTap,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(const ActivityDetailScreen());
      },
      child: Container(
        width: width(context),
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.blackGreyColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.food_bank, color: AppColors.greyColor, size: 32.0,),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Go For Rewards',
                        style: poppinsRegular.copyWith(
                          fontSize: 20.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text('XAF 50.00',
                        style: poppinsRegular.copyWith(
                          fontSize: 14.0,
                          color: moneyColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(transactionType!,
                        style: poppinsRegular.copyWith(
                          fontSize: 14.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text('29/6/2022',
                        style: poppinsRegular.copyWith(
                          fontSize: 12.0,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
