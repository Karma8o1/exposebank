import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/models/requestModel/request_model.dart';
import 'package:expose_banq/view/payment_transfer/approval_request_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../payment_transfer/approval_request_verify.dart';
import '../verified_accounts/components/verify_box.dart';

class ApprovalRequestScreen extends StatefulWidget {
  const ApprovalRequestScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalRequestScreen> createState() => _ApprovalRequestScreenState();
}

class _ApprovalRequestScreenState extends State<ApprovalRequestScreen> {
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
        centerTitle: true,
        titleSpacing: 8.0,
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'List Of All Verifications',
                style: poppinsRegular.copyWith(
                  fontSize: 18.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('requests')
                    .where('recieverRef',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, int index) {
                            return VerifyBox(
                              isVerify: true,
                              accountNumber: snapshot.data!.docs[index]
                                  ['accountName'],
                              paymentValueText: snapshot.data!.docs[index]
                                  ['isPermissionGranted'],
                              onTap: () {
                                if (snapshot.data!.docs[index]
                                        ['isPermissionGranted'] ==
                                    'Awaited') {
                                  Get.to(ApprovalRequestVerificationScreen(
                                    request: RequestModel.fromSnapshot(
                                        snapshot.data!.docs[index]),
                                  ));
                                } else {
                                  ElegantNotification.info(
                                      title: Text(
                                          'Request ${snapshot.data!.docs[index]['isPermissionGranted']}'),
                                      description: Text(
                                          'The request has already been: ${snapshot.data!.docs[index]['isPermissionGranted']}'));
                                }
                              },
                              accountName: '',
                              bankName: '',
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'No requests yet!',
                        style: poppinsLight.copyWith(fontSize: 14),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
