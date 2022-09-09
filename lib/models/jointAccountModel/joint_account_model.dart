class JointAccountModel {
  String accountNumber;
  String accountName;
  int balance;
  bool isSuspended;

  //if the account is current.saving etc.
  String typeOfAccount;
  bool isBanned;
  //uid of the partners private data
  List<String> partners;

  bool isCardIssued;
  JointAccountModel({
    required this.accountNumber,
    required this.accountName,
    required this.typeOfAccount,
    required this.balance,
    required this.isBanned,
    required this.isSuspended,
    required this.partners,
    required this.isCardIssued,
  });
}
