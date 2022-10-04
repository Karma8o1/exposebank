import 'package:expose_banq/const/app_colors.dart';
import 'package:expose_banq/const/app_text_styles.dart';
import 'package:expose_banq/controllers/apiController/api_controller.dart';
import 'package:expose_banq/models/bill_model/bill_payment_model.dart';
import 'package:expose_banq/widgets/app_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: AppNameWidget(),
        ),
      ),
      body: Form(
          key: _formKey,
          child: FutureBuilder<List<BillPaymentModel>>(
            future: ApiController.getBillOptions(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.length > 0) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          trailing: Text(
                            snapshot.data![index].country,
                            style: poppinsMedium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          leading: Text(
                            snapshot.data![index].name,
                            style: poppinsMedium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      'Sorry for inconvenience. But this feature does not exist yet!',
                      style: poppinsMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  ),
                );
              }
            },
          )),
    );
  }
}
