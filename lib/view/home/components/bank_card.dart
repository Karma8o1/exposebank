// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/models/jointAccountModel/joint_account_model.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../const/exports.dart';

class BankCardWidget extends StatelessWidget {
  BankCardWidget({
    Key? key,
    required this.accountName,
    required this.accountType,
  }) : super(key: key);
  String? accountType, accountName;
  @override
  Widget build(BuildContext context) {
    if (accountName != null && accountType != null) {
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
            ///
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection(accountType as String)
                    .doc(accountName as String)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!['accountName'],
                          style: poppinsLight.copyWith(
                            fontSize: 12.0,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Container(
                          width: 50,
                          child: Text(
                            snapshot.data!['typeOfAccount'],
                            style: poppinsLight.copyWith(
                              fontSize: 12.0,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    );
                  }
                }),

            /// balance texts
            SizedBox(height: height(context) * 0.05),
            Text(
              'Balance',
              style: poppinsMedium.copyWith(
                fontSize: 15.0,
                color: AppColors.whiteColor,
              ),
            ),
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection(accountType as String)
                    .doc(accountName)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.exists) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// amount texts
                        SizedBox(height: height(context) * 0.016),
                        Text(
                          'XAF ${NumberFormat.simpleCurrency().format(snapshot.data!['balance']).replaceAll("\$", '')}',
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
                              DateFormat('MM/yy')
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                snapshot.data!['creationDate']
                                    .millisecondsSinceEpoch,
                              )),
                              style: poppinsLight.copyWith(
                                fontSize: 14.0,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  if (!snapshot.data!.exists) {
                    return Center(
                      child: Text(
                        'No account data exists',
                        style: poppinsLight.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    );
                  }
                }),
          ],
        ),
      );
    } else {
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
                Text(
                  'No account yet!',
                  style: poppinsLight.copyWith(
                    fontSize: 12.0,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  'create new account',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// amount texts
                SizedBox(height: height(context) * 0.016),
                Text(
                  'XAF ${NumberFormat.simpleCurrency().format(0).replaceAll("\$", '')}',
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
                      DateFormat('MM/yy').format(DateTime.now()),
                      style: poppinsLight.copyWith(
                        fontSize: 14.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
