import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../const/exports.dart';

class BankCardWidget extends StatelessWidget {
  const BankCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: const LinearGradient(
          colors: [
            AppColors.redDarkColor,
            //AppColors.redDarkColor,
            AppColors.blackColor,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// bank username and account name texts
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('userData')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!['userName']);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      );
                    }
                  }),
              Text(
                'Account name',
                style: poppinsLight.copyWith(
                  fontSize: 12.0,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),

          /// balance texts
          SizedBox(height: height(context) * 0.05),
          Text(
            'Balance',
            style: poppinsMedium.copyWith(
              fontSize: 15.0,
              color: AppColors.whiteColor,
            ),
          ),

          /// amount texts
          SizedBox(height: height(context) * 0.016),
          Text(
            'XAF 7,630,255',
            style: poppinsMedium.copyWith(
              fontSize: 30.0,
              color: AppColors.whiteColor,
            ),
          ),

          /// date and valid texts
          SizedBox(height: height(context) * 0.024),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12022 0149',
                style: poppinsLight.copyWith(
                  fontSize: 14.0,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                '05/25',
                style: poppinsLight.copyWith(
                  fontSize: 14.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
