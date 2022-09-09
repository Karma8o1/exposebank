import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/models/privateAccountModel/private_account_model.dart';

class TransactionController {
  Future<void> makeTransactionFromPrivateAccount(String fromUid,
      String fromAccountNumber, String toUid, String toAccountNumber) async {
    FirebaseFirestore.instance.collection('collectionPath');
  }

  Future<void> requestJointAccount({
    required String currentUser,
    required String requestUser,
    required String accountName,
  }) async {}
  Future<PrivateAccountModel> searchUser(
      {required String accountNumber}) async {
    return FirebaseFirestore.instance
        .collection('indiAccount')
        .where('phoneNumber', isEqualTo: accountNumber)
        .limit(1)
        .get()
        .then((value) {
      return PrivateAccountModel.fromJSON(value as DocumentSnapshot);
    });
  }
}
