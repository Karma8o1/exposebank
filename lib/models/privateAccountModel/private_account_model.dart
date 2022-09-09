import 'package:cloud_firestore/cloud_firestore.dart';

class PrivateAccountModel {
  String accountNumber;
  //uid contains ref to the user it belongs to
  String uid;
  //if the account is individual/bonus etc.
  String accountName;
  String typeOfAccount;
  int balance;
  bool isSuspended;
  bool isBlocked;
  bool isCardIssued;
  bool isVerified;
  Timestamp creationDate;
  PrivateAccountModel({
    required this.accountNumber,
    required this.typeOfAccount,
    required this.accountName,
    required this.uid,
    required this.balance,
    required this.isBlocked,
    required this.isSuspended,
    required this.isCardIssued,
    required this.isVerified,
    required this.creationDate,
  });
  static PrivateAccountModel fromJSON(DocumentSnapshot snapshot) {
    PrivateAccountModel privateAccount = PrivateAccountModel(
      accountNumber: snapshot['accountNumber'],
      typeOfAccount: snapshot['typeOfAccount'],
      accountName: snapshot['accountName'],
      uid: snapshot.id,
      balance: snapshot['balance'],
      isBlocked: snapshot['isBlocked'],
      isSuspended: snapshot['isSuspended'],
      isCardIssued: snapshot['isCardIssued'],
      isVerified: snapshot['isVerified'],
      creationDate: snapshot['creationDate'],
    );
    return privateAccount;
  }
}
