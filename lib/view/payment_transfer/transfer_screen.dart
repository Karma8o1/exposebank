import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/view/security/security_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/card_widget.dart';
import 'components/to_card_widget.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  List<String> nameTexts = [
    'Maria Callas',
    'Matt Hardy',
    'Andrea Smith',
    'Maria Callas',
    'Matt Hardy',
    'Andrea Smith',
  ];
  List<String> cardNumberTexts = [
    '5812 9023 8431 1323',
    '4120 8530 4021 8218',
    '5590 1245 4510 0317',
    '5812 9023 8431 1323',
    '4120 8530 4021 8218',
    '5590 1245 4510 0317',
  ];
  List<String> cardTypeImagePath = [
    AppIcons.masterCardIcon,
    AppIcons.visaIcon,
    AppIcons.masterCardIcon,
    AppIcons.visaIcon,
    AppIcons.masterCardIcon,
    AppIcons.visaIcon,
  ];

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
        centerTitle: false,
        titleSpacing: 8.0,
        title: const Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: AppNameWidget(),
        ),
      ),

      /// body
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// from the card texts
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                'Transfer to  my account',
                style: poppinsMedium.copyWith(
                  fontSize: 18.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'From the card',
                style: poppinsRegular.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            /// from the cards
            const SizedBox(height: 16.0),
            StreamBuilder(
              builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return SizedBox(
                    height: 100,
                    width: width(context),
                    // child: DropdownButton(items: snapshot.data.docs),
                  );
                }
                if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Accounts have been created yet',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),
                  );
                }
              }),
            ),

            /// to the card texts
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'To the card',
                style: poppinsRegular.copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            /// to the cards
            const SizedBox(height: 16.0),
            SizedBox(
              height: 100,
              width: width(context),
              child: CarouselSlider(
                items: const [
                  ToCardWidget(),
                  ToCardWidget(),
                  ToCardWidget(),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, slide) {},
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            const SizedBox(height: 50.0),
            Container(
              height: 50.0,
              width: width(context),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: AppColors.greyColor.withOpacity(0.5),
                  width: 0.5,
                ),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: poppinsMedium.copyWith(
                  fontSize: 17.0,
                  color: AppColors.whiteColor,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 24.0),
                  labelText: 'Amount',
                  labelStyle: poppinsRegular.copyWith(
                    fontSize: 15.0,
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                  hintText: 'XAF 20.00',
                  hintStyle: poppinsMedium.copyWith(
                    fontSize: 17.0,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),

            /// cards list
            SizedBox(height: height(context) * 0.2),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(SecurityScreen());
                },
                borderRadius: BorderRadius.circular(50.0),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48.0, vertical: 14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.btnOneColor,
                        AppColors.blackColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    'Transfer',
                    style: poppinsSemiBold.copyWith(
                      fontSize: 14.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),

            /* Expanded(
              child: Container(
                width: width(context),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  color: AppColors.blackLightColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width(context),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_up,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Maria',
                              style: poppinsSemiBold.copyWith(
                                fontSize: 18.0,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 8.0, top: 8.0),
                            height: 48.0,
                            width: 48.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: AppColors.blackGreyColor,
                            ),
                            child: Center(
                              child: SvgPicture.asset(AppIcons.searchIcon),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: nameTexts.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(bottom: 50.0),
                        itemBuilder: (context, index) {
                          return CardTypeWidget(
                            onTap: (){
                              Get.to(AmountScreen());
                            },
                            imagePath: AppImages.userImage,
                            nameText: nameTexts[index],
                            cardNumberText: cardNumberTexts[index],
                            cardTypePath: cardTypeImagePath[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
