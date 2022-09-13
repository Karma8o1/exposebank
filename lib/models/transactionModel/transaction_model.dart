import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String fromAccount;
  //from user is the reference to the data of user send money
  String fromUser;
  String toAccount;
  //Amount of money sent
  int amount;
  //if the account is current.saving etc.
  String typeOfAccount;
  //deposit, withdraw, transfer, etc.
  String transactionType;
  Timestamp timeOfTransaction;
  TransactionModel({
    required this.fromAccount,
    required this.fromUser,
    required this.transactionType,
    required this.amount,
    required this.toAccount,
    required this.typeOfAccount,
    required this.timeOfTransaction,
  });
}
