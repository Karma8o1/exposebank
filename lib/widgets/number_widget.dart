import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/exports.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {

  _launchWhatsapp() async {
    const url = "https://api.whatsapp.com/send/?phone=(+237 693374327)'";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          _launchWhatsapp();
        },
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text('+237 693374327',
              style: poppinsRegular.copyWith(
                fontSize: 15.0,
                color: AppColors.greyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
