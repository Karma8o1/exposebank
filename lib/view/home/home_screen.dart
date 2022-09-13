import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';
import 'package:expose_banq/view/approval_request_page/approval_request_screen.dart';
import 'package:expose_banq/view/home/components/open_account_button.dart';
import 'package:expose_banq/view/home/open_account_screen.dart';
import 'package:expose_banq/widgets/fade_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../deposit/desposit_screen.dart';
import '../payment_transfer/transfer_screen.dart';
import '../withdraw/withdraw_screen.dart';
import 'components/bank_card.dart';
import 'components/quick_service_box.dart';
import 'components/transaction_card_box.dart';
import 'open_joint_account.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> transTypeTexts = [
    'Deposit',
    'Withdrawal',
    'Transfer',
    'Deposit',
    'Withdrawal',
    'Transfer',
  ];

  List<Color> textColors = [
    AppColors.violetColor,
    AppColors.redDarkColor,
    AppColors.redDarkColor,
    AppColors.violetColor,
    AppColors.redDarkColor,
    AppColors.redDarkColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      /// appbar
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const Icon(
            Icons.menu,
            color: AppColors.whiteColor,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: AppNameWidget(),
        ),
        actions: [
          FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('userData')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!['profileImage'] == null) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      radius: 22.0,
                      backgroundColor: AppColors.redDarkColor,
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage(AppImages.userImage),
                      ),
                    ),
                  );
                }
                if (snapshot.hasData &&
                    snapshot.data!['profileImage'] != null) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      radius: 22.0,
                      backgroundColor: AppColors.redDarkColor,
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage:
                            NetworkImage(snapshot.data!['profileImage']),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  );
                }
              }),
        ],
      ),

      /// body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// hi first name texts
            FadeAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              delay: 1.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hi,',
                      style: poppinsSemiBold.copyWith(
                        fontSize: 20.0,
                        color: AppColors.blackColor,
                      ),
                    ),
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('userData')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!['firstName']);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            );
                          }
                        }),
                    const Spacer(),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('requests')
                            .where('recieverRef',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .where(
                              'isPermissionGranted',
                              isEqualTo: 'Awaited',
                            )
                            .snapshots(),
                        builder:
                            ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data!.docs.isNotEmpty) {
                            return IconButton(
                              onPressed: () {
                                Get.to(const ApprovalRequestScreen());
                              },
                              icon: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    color: AppColors.blackColor,
                                    size: 28.0,
                                  ),
                                  Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      height: 12.0,
                                      width: 12.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.redDarkColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          snapshot.data!.docs.length.toString(),
                                          style: poppinsLight.copyWith(
                                            fontSize: 8.0,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          if (snapshot.data!.docs.isEmpty) {
                            return IconButton(
                              onPressed: () {
                                Get.to(const ApprovalRequestScreen());
                              },
                              icon: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    color: AppColors.blackColor,
                                    size: 28.0,
                                  ),
                                  Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      height: 12.0,
                                      width: 12.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '',
                                          style: poppinsLight.copyWith(
                                            fontSize: 8.0,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return IconButton(
                              onPressed: () {
                                Get.to(const ApprovalRequestScreen());
                              },
                              icon: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    color: AppColors.blackColor,
                                    size: 28.0,
                                  ),
                                  Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      height: 12.0,
                                      width: 12.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '',
                                          style: poppinsLight.copyWith(
                                            fontSize: 8.0,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        })),
                  ],
                ),
              ),
            ),

            /// Bank Card
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('indiAccount')
                    .where(
                      'userRef',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                    )
                    .limit(1)
                    .snapshots(),
                builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    PrivateAccountModel privateAccount =
                        PrivateAccountModel.fromJSON(snapshot.data!.docs[0]);
                    return Column(
                      children: [
                        FadeAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          delay: 0.7,
                          child: BankCardWidget(
                            accountName: snapshot.data!.docs[0].id,
                            accountType: 'indiAccount',
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Container(
                          width: width(context),
                          decoration: const BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24.0),
                              topLeft: Radius.circular(24.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// Quick Service texts
                              SizedBox(height: height(context) * 0.024),
                              FadeAnimation(
                                curve: Curves.ease,
                                delay: 1.2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Quick Service',
                                    style: poppinsLight.copyWith(
                                      fontSize: 15.0,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ),
                              ),

                              /// quick services box
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FadeAnimation(
                                  curve: Curves.ease,
                                  delay: 1.2,
                                  child: SizedBox(
                                    width: width(context),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          QuickServiceBox(
                                            onTap: () {
                                              Get.to(const TransferScreen());
                                            },
                                            icon: CupertinoIcons
                                                .arrow_right_arrow_left,
                                            text: 'Transfer',
                                          ),
                                          SizedBox(
                                              width: height(context) * 0.032),
                                          QuickServiceBox(
                                            onTap: () {
                                              Get.to(const DepositScreen());
                                            },
                                            icon: CupertinoIcons.arrow_down,
                                            text: 'Deposit',
                                          ),
                                          SizedBox(
                                              width: height(context) * 0.032),
                                          QuickServiceBox(
                                            onTap: () {
                                              Get.to(const WithdrawScreen());
                                            },
                                            icon: CupertinoIcons.arrow_up,
                                            text: 'Withdraw',
                                            borderColor: AppColors.redDarkColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// click button to Open Bank Account
                              SizedBox(height: height(context) * 0.008),
                              FadeAnimation(
                                curve: Curves.ease,
                                delay: 1.2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Click Button Below To Open Bank Account',
                                    style: poppinsLight.copyWith(
                                      fontSize: 15.0,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: height(context) * 0.016),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OpenAccountButton(
                                      onTap: () {
                                        Get.to(const OpenAccountScreen());
                                      },
                                      icon: Icons.lock,
                                      text: 'Private Account',
                                    ),
                                    OpenAccountButton(
                                      onTap: () {
                                        Get.to(const OpenJointAccountScreen());
                                      },
                                      icon: Icons.lock,
                                      text: 'Joint Account',
                                    ),
                                  ],
                                ),
                              ),

                              /// Transaction history texts
                              SizedBox(height: height(context) * 0.016),
                              FadeAnimation(
                                curve: Curves.ease,
                                delay: 1.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Transaction History',
                                    style: poppinsLight.copyWith(
                                      fontSize: 15.0,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                curve: Curves.ease,
                                delay: 1.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'For more detailed version visit individual account page.',
                                    style: poppinsLight.copyWith(
                                      fontSize: 10.0,
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                ),
                              ),

                              /// list of transactions
                              const SizedBox(height: 10.0),
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('transactions')
                                      .where('userId',
                                          isEqualTo: FirebaseAuth
                                              .instance.currentUser!.uid)
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data!.docs.isNotEmpty) {
                                      return FadeAnimation(
                                        curve: Curves.ease,
                                        delay: 1.3,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: const EdgeInsets.only(
                                              bottom: 50.0),
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            return TransactionCardBox(
                                              transactionType:
                                                  snapshot.data!.docs[index]
                                                      ['transactionType'],
                                              moneyColor: snapshot
                                                              .data!.docs[index]
                                                          ['toAccount'] ==
                                                      privateAccount.accountName
                                                  ? Colors.green
                                                  : Colors.red,
                                              amount: snapshot
                                                  .data!.docs[index]['amount']
                                                  .toString(),
                                              fromAccount: snapshot.data!
                                                  .docs[index]['fromAccount'],
                                              toAccount: snapshot.data!
                                                  .docs[index]['toAccount'],
                                              transactionDate:
                                                  snapshot.data!.docs[index]
                                                      ['transactionDate'],
                                            );
                                          },
                                        ),
                                      );
                                    }
                                    if (snapshot.hasData &&
                                        snapshot.data!.docs.isEmpty) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.8,
                                          child: Center(
                                            child: Text(
                                              'No Transactions till now',
                                              style: poppinsRegular.copyWith(
                                                fontSize: 12.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ],
                    );
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
                })),
          ],
        ),
      ),
    );
  }
}
