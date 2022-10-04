import 'dart:convert';

import 'package:expose_banq/const/header.dart';
import 'package:expose_banq/models/bankModel/bankModel.dart';
import 'package:expose_banq/models/bill_model/bill_payment_model.dart';
import 'package:http/http.dart';

class ApiController {
  static Future<List<BankModel>> getBanks() async {
    String url = 'https://api.flutterwave.com/v3/banks/CM';

    Response response = await get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final List banks = jsonDecode(response.body)['data'];
      return banks.map(((e) => BankModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<List<BillPaymentModel>> getBillOptions() async {
    String url = 'https://api.flutterwave.com/v3/bill-categories';
    print('Called all bill categories');
    Response response = await get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final List billOptions = jsonDecode(response.body)['data'];

      return billOptions
          // .where((element) => element['country'] == 'CM')
          .map(((e) => BillPaymentModel.fromJson(e)))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
