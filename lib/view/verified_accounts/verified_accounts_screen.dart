import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/controllers/userDataController/userDataController.dart';
import 'package:expose_banq/models/jointAccountModel/joint_account_model.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../drawer/drawer_screen.dart';
import 'components/verify_box.dart';

class VerifiedAccountsScreen extends StatefulWidget {
  const VerifiedAccountsScreen({Key? key}) : super(key: key);

  @override
  State<VerifiedAccountsScreen> createState() => _VerifiedAccountsScreenState();
}

class _VerifiedAccountsScreenState extends State<VerifiedAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        centerTitle: false,
        titleSpacing: 8.0,
        /*title: Text(
          'List Of All Verifications',
          style: poppinsRegular.copyWith(
            fontSize: 20.0,
            color: AppColors.whiteColor,
          ),
        ),*/
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: GetBuilder<UserDataController>(
        builder: ((_) {
          return SizedBox(
            height: height(context),
            width: width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 36.0),
                Center(
                  child: Text(
                    'Private Bank Accounts List',
                    style: poppinsRegular.copyWith(
                      fontSize: 20.0,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('indiAccount')
                        .where(
                          'userRef',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                        )
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, int index) {
                                  return VerifyBox(
                                    userImagePath: _.userData.profile,
                                    isVerify: snapshot.data!.docs[index]
                                        ['isVerified'],
                                    userNameText: snapshot.data!.docs[index].id,
                                    paymentValueText: snapshot
                                        .data!.docs[index]['balance']
                                        .toString(),
                                    onTap: () {
                                      Get.offAll(DrawerOneScreen(
                                        accountName:
                                            snapshot.data!.docs[index].id,
                                        accountType: 'indiAccount',
                                      ));
                                    },
                                  );
                                }));
                      }
                      if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Accounts Exist',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            strokeWidth: 1,
                          ),
                        );
                      }
                    }),
                const SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Joint Bank Accounts List',
                    style: poppinsRegular.copyWith(
                      fontSize: 20.0,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('jointAccount')
                        .where(
                      'partners',
                      arrayContainsAny: [
                        FirebaseAuth.instance.currentUser!.uid
                      ],
                    ).snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, int index) {
                                  return VerifyBox(
                                    userImagePath: _.userData.profile,
                                    isVerify: true,
                                    userNameText: snapshot.data!.docs[index].id,
                                    paymentValueText: snapshot
                                        .data!.docs[index]['balance']
                                        .toString(),
                                    onTap: () {
                                      Get.offAll(DrawerOneScreen(
                                        accountName:
                                            snapshot.data!.docs[index].id,
                                        accountType: 'jointAccount',
                                      ));
                                    },
                                  );
                                }));
                      }
                      if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Accounts Exist',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            strokeWidth: 1,
                          ),
                        );
                      }
                    }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
