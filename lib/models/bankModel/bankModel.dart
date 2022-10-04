class BankModel {
  String code, name;
  int id;
  BankModel({required this.code, required this.id, required this.name});
  static BankModel fromJson(Map<String, dynamic> json) {
    BankModel bank =
        BankModel(code: json['code'], id: json['id'], name: json['name']);
    return bank;
  }
}
