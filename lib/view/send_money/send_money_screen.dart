import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expose_banq/widgets/card_data_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/exports.dart';
import '../payment_transfer/components/card_widget.dart';
import '../security/security_screen.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  TextEditingController accountNumber = TextEditingController();
  TextEditingController enterAmountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late final Iterable<String>? autofillHints = [
    '4545 2673 1232 1232',
    '4545 2673 1232 1232',
    '4545 2673 1232 1232',
    '4545 2673 1232 1232',
    '4545 2673 1232 1232',
    '4545 2673 1232 1232',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
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

      /// body
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// total balance texts
            SizedBox(height: height(context) * 0.016),
            Center(
              child: Text(
                'Send Money To Another Exposer',
                style: poppinsLight.copyWith(
                  fontSize: 14.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Send From this my bank account',
                style: poppinsRegular.copyWith(
                  fontSize: 15.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            /// from the cards
            const SizedBox(height: 16.0),
            SizedBox(
              height: 100,
              width: width(context),
              child: CarouselSlider(
                  items: const [
                    FromCardWidget(),
                    FromCardWidget(),
                    FromCardWidget(),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, slide) {},
                    scrollDirection: Axis.horizontal,
                  )),
            ),

            const SizedBox(height: 24.0),
            CardDataField(
              titleText: 'Enter Amount:',
              keyboardType: TextInputType.number,
              hintText: 'XAF 2,150.00',
              controller: enterAmountController,
            ),

            /// To Texts
            SizedBox(height: height(context) * 0.016),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'To',
                style: poppinsSemiBold.copyWith(
                  fontSize: 16.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            /// account number
            SizedBox(height: height(context) * 0.03),
            CardDataField(
              titleText: 'Account Number:',
              keyboardType: TextInputType.number,
              hintText: '2255 4595 9874 4423',
              controller: accountNumber,
            ),

            /// OR Texts
            SizedBox(height: height(context) * 0.01),
            Center(
              child: Text(
                'OR',
                style: poppinsSemiBold.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            /// Search receiver below
            SizedBox(height: height(context) * 0.016),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Search receiver below',
                style: poppinsRegular.copyWith(
                  fontSize: 13.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            /// search field
            SizedBox(height: height(context) * 0.024),
            Container(
              height: 70.0,
              width: width(context),
              padding: const EdgeInsets.only(top: 8.0),
              decoration: const BoxDecoration(
                color: AppColors.blackGreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Row(
                children: [
                  AnimatedIconButton(
                    onPressed: () => print('all icons pressed'),
                    size: 24.0,
                    icons: [
                      AnimatedIconItem(
                        icon: const Icon(
                          Icons.keyboard_arrow_up_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => print('add pressed'),
                      ),
                      const AnimatedIconItem(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: poppinsRegular.copyWith(
                        fontSize: 14.0,
                        color: AppColors.whiteColor,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(left: 0.0, top: 16.0),
                        hintText: 'Enter Bank or Account Name',
                        hintStyle: poppinsRegular.copyWith(
                          fontSize: 14.0,
                          color: AppColors.greyColor,
                        ),
                        suffixIcon: Container(
                          height: 40.0,
                          width: 50.0,
                          margin: const EdgeInsets.only(right: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.blackLightColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.search,
                              color: AppColors.whiteColor,
                              size: 32.0,
                            ),
                          ),
                        ),
                      ),
                      autofillHints: autofillHints,
                    ),
                  ),
                ],
              ),
            ),

            /// send money button
            SizedBox(height: height(context) * 0.04),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(const SecurityScreen());
                },
                borderRadius: BorderRadius.circular(40.0),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryOneColor,
                        AppColors.secondaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    'Send Money',
                    style: poppinsSemiBold.copyWith(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
