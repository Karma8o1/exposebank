import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/const/lottie_anim.dart';
import 'package:expose_banq/widgets/number_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  final Uri params = Uri(
    scheme: 'mailto',
    path: 'client@exposebanq.cloud',
    query: 'subject=App Feedback&body=Welcome to Expose Banq', //add subject and body here
  );

  _launchWebsite() async {
    const url = "http://www.exposebanq.cloud/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail() async {
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        title: Text(
          'Contact Us',
          style: poppinsRegular.copyWith(
            fontSize: 18.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),

      /// body
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// App name widget
            SizedBox(height: height(context) * 0.03),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppNameWidget(),
              ],
            ),

            /// animation
            SizedBox(height: height(context) * 0.02),
            Lottie.asset(LottieAnim.contactUsAnimation),

            SizedBox(height: height(context) * 0.03),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
                width: width(context),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Call or WhatsApp',
                        style: poppinsMedium.copyWith(
                          fontSize: 22.0,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const NumberWidget(),
                      const NumberWidget(),
                      const NumberWidget(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            _launchEmail();
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text('client@exposebanq.cloud',
                                style: poppinsRegular.copyWith(
                                  fontSize: 15.0,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            _launchWebsite();
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text('http://www.exposebanq.cloud/',
                                style: poppinsRegular.copyWith(
                                  fontSize: 15.0,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      /*Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'In publishing and graphic design, Lorem ipsum is a placeholder '
                          'text commonly used to demonstrate the visual form of a document '
                          'is available.',
                          textAlign: TextAlign.center,
                          style: poppinsLight.copyWith(
                            fontSize: 12.0,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),*/
                    ],
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
