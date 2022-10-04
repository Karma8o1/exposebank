class BillPaymentModel {
  String name;
  String country;
  BillPaymentModel({required this.name, required this.country});
  // String id,
  //     biller_code,
  //     name,
  //     default_commission,
  //     country,
  //     biller_name,
  //     item_code,
  //     short_name,
  //     fee,
  //     label_name;
  // bool is_airtime;
  // int amount;
  // BillPaymentModel(
  //     {required this.amount,
  //     required this.biller_code,
  //     required this.biller_name,
  //     required this.country,
  //     required this.default_commission,
  //     required this.fee,
  //     required this.id,
  //     required this.is_airtime,
  //     required this.item_code,
  //     required this.label_name,
  //     required this.name,
  //     required this.short_name});
  static BillPaymentModel fromJson(Map<String, dynamic> json) {
    BillPaymentModel billPaymentOptions = BillPaymentModel(
      name: json['biller_name'],

      // amount: json['amount'],
      // biller_code: json['biller_code'],
      // biller_name: json['biller_name'],
      country: json['country'],
      // default_commission: json['default_commission'],
      // fee: json['fee'],
      // id: json['id'],
      // is_airtime: json['is_airtime'],
      // item_code: json['item_code'],
      // label_name: json['label_name'],
      // name: json['name'],
      // short_name: json['short_name'],
    );
    return billPaymentOptions;
  }
}
