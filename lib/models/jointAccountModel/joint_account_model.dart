import 'package:cloud_firestore/cloud_firestore.dart';

class JointAccountModel {
  String accountName;
  int balance;
  String id;
  bool isSuspended;

  //if the account is current.saving etc.
  String typeOfAccount;
  //uid of the partners private data
  List partners;

  bool isCardIssued;
  JointAccountModel({
    required this.accountName,
    required this.typeOfAccount,
    required this.id,
    required this.balance,
    required this.isSuspended,
    required this.partners,
    required this.isCardIssued,
  });
  static JointAccountModel fromSnapshot(DocumentSnapshot snapshot) {
    JointAccountModel jointAccount = JointAccountModel(
      id: snapshot.id,
      accountName: snapshot['accountName'],
      typeOfAccount: snapshot['typeOfAccount'],
      balance: snapshot['balance'],
      isSuspended: snapshot['isSuspended'],
      partners: snapshot['partners'],
      isCardIssued: snapshot['isCardIssued'],
    );
    return jointAccount;
  }
}
