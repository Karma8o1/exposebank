import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/view/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BackGroundColorWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: height(context),
          width: width(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //// boardings contents
              Expanded(
                child: PageView(
                  children: [

                    /// first page
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// app logo
                        const SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(left: 24.0, top: 8.0),
                            child: AppNameWidget(),
                          ),
                        ),

                        /// card image
                        const SizedBox(height: 24.0),
                        Image.asset(AppImages.personImage),

                        /// texts
                        const SizedBox(height: 24.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              'Free Secured & \nTransparent Standard \nBank Account For \nCouples, '
                                  'Groups, & \nProjects! ',
                              style: poppinsRegular.copyWith(
                                fontSize: 24.0,
                                color: AppColors.whiteColor,
                                height: 1.6,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),

                    /// second page
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(left: 24.0, top: 8.0),
                            child: AppNameWidget(),
                          ),
                        ),
                        SizedBox(height: height(context) * 0.1),
                        Center(
                          child: Image.asset(AppImages.bankNameImage),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),

                        /// texts
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Text(
                            'ALL MONIES \nSECURELY \nHELD AT \nUBA!',
                            style: poppinsRegular.copyWith(
                              fontSize: 24.0,
                              color: AppColors.whiteColor,
                              height: 1.6,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                      ],
                    ),

                    /// third page
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(left: 24.0, top: 8.0),
                            child: AppNameWidget(),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        SizedBox(
                          width: width(context),
                          child: Image.asset(
                            AppImages.googleSupportImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        SizedBox(
                          width: width(context),
                          child: Image.asset(
                            AppImages.supportImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Expanded(child: SizedBox()),

                        /// texts
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Text(
                            'GOOGLE \nSUPPORTS \nTOUGHEST \nDIGITAL BANKING \nSECURITY IN THE \nWORLD!',
                            style: poppinsRegular.copyWith(
                              fontSize: 24.0,
                              color: AppColors.whiteColor,
                              height: 1.6,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                      ],
                    ),
                  ],
                ),
              ),

              /// buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CustomGradientButton(
                          btnText: 'Get Started',
                          onTap: () {
                            Get.to(SignupScreen());
                          },
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(18.0),
                        child: Ink(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            border: Border.all(
                              color: AppColors.whiteColor.withOpacity(0.5),
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppIcons.appleIcon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(18.0),
                        child: Ink(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            border: Border.all(
                              color: AppColors.whiteColor.withOpacity(0.5),
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppIcons.googleIcon),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// have not account? sign in texts
              Padding(
                padding: EdgeInsets.only(
                  top: height(context) * 0.02,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have an app account?',
                      style: poppinsLight.copyWith(
                        fontSize: 14.0,
                        color: AppColors.whiteColor.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Sign in',
                          style: poppinsRegular.copyWith(
                            fontSize: 14.0,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
