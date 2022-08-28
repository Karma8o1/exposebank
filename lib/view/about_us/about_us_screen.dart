import 'package:flutter/material.dart';

import '../../const/exports.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        centerTitle: true,
        title: Text(
          'About Us',
          style: poppinsRegular.copyWith(
            fontSize: 20.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Live is better when there is the perfect measure of transparency, trust '
          'and security and banking is best with these. Expose is a digital banking '
          'storefront created for transparency, trust and security, period.'
          '\n\nWe’re building the world’s first digital bank groups, individuals and projects '
          'would rely on.'
          '\n\nWe believe that your bank should be as mobile and flexible as you. '
          'That’s why we’re offering a 100% digital banking experience that’s designed '
          'to be simple and transparent.'
          '\n\nExpose is the best bank around you right now'
          '\n\nOur smart technology is given us the power to offer our customers free, cost '
          'effective bank accounts and better protect their money, and make banking '
          'simple and trustworthy.'
          '\n\nWe are a bank as smart and mobile as you'
            '\n\nBanking in your pocket, wherever you are. Want to lock, or re-order your card? '
          'All it takes is a tap in the app. Need customer support? Get help using our live '
          'chat. Keen for an overdraft? No problem—simply apply within the app in seconds. '
          'No paperwork, no hidden fees and full transparency.'

          '\n\nBecause we have only one physical office and no branch we have been able to '
          'cut bank expenses to almost nothing compared to these banks you know, '
            'in essence we are able to offer limitless free services including free '
            'bank accounts, no monthly fees etc which these other banks cannot offer.'

          '\n\nWe have got the best first class technology, strongest and youngest team in the world,'
                  ' we are the future of banking you have been hoping for.',
                style: poppinsLight.copyWith(
                  fontSize: 14.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
