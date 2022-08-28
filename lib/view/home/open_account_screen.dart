import 'package:flutter/material.dart';

import '../../const/exports.dart';

class OpenAccountScreen extends StatefulWidget {
  const OpenAccountScreen({Key? key}) : super(key: key);

  @override
  State<OpenAccountScreen> createState() => _OpenAccountScreenState();
}

class _OpenAccountScreenState extends State<OpenAccountScreen> {
  TextEditingController accountNameController = TextEditingController();

  String selectedValue = "Account Type...";
  String memberValue = "Please Select...";

  /// door rating dropdown items
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Account Type...", child: Text("Account Type...")),
      const DropdownMenuItem(value: "Couples (Lovebirds)", child: Text("Couples (Lovebirds)")),
      const DropdownMenuItem(value: "Unions/Syndicats/Associations", child: Text("Unions/Syndicats/Associations")),
      const DropdownMenuItem(value: "Project Execution", child: Text("Project Execution")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get memberItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Please Select...", child: Text("Please Select...")),
      const DropdownMenuItem(value: "Admin (Approve/Deny)", child: Text("Admin (Approve/Deny)")),
      const DropdownMenuItem(value: "Standard (view only)", child: Text("Standard (view only)")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: AppNameWidget(),
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
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'TIGHT SECURITY PRIVATE BANK ACCOUNT, FREE.',
                style: poppinsMedium.copyWith(
                  fontSize: 15.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Ain\'t Nobody Do Away With Your Hard Earning Money!\n This Is The Best Form '
              'Of Trust & Transparency',
              textAlign: TextAlign.center,
              style: poppinsRegular.copyWith(
                fontSize: 12.0,
                color: AppColors.greyColor,
                height: 1.5,
              ),
            ),

            /// account name field
            SizedBox(height: height(context) * 0.036),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: accountNameController,
                keyboardType: TextInputType.name,
                style: poppinsRegular.copyWith(
                  fontSize: 15.0,
                  color: AppColors.whiteColor,
                  height: 1.5,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: AppColors.blackColor,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: AppColors.blackColor,
                      width: 1.0,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.blackGreyColor,
                  labelText: 'Expose Account Name',
                  hintText: 'slimpepper22...',
                  contentPadding: const EdgeInsets.only(left: 16.0, top: 10.0),
                  labelStyle: poppinsRegular.copyWith(
                    fontSize: 13.0,
                    color: AppColors.whiteColor.withOpacity(0.7),
                    height: 1.5,
                  ),
                  hintStyle: poppinsRegular.copyWith(
                    fontSize: 15.0,
                    color: AppColors.whiteColor.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
              ),
            ),

            SizedBox(height: height(context) * 0.01),
            /*Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                padding: const EdgeInsets.only(bottom: 50.0),
                itemBuilder: (context, index){
                  return  Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                    width: width(context),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.blackGreyColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: AppColors.violetDarkColor,
                          child: CircleAvatar(
                            radius: 18.0,
                            backgroundImage: AssetImage(AppImages.userImage),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('San',
                                style: poppinsMedium.copyWith(
                                  fontSize: 16.0,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text('osangungaaje@gmail.com',
                                style: poppinsMedium.copyWith(
                                  fontSize: 14.0,
                                  color: AppColors.redDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('7/3/2022',
                          style: poppinsRegular.copyWith(
                            fontSize: 14.0,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),*/
            Expanded(child: SizedBox()),

            /// Open Bank Account Immediately button
            Container(
              height: 45.0,
              width: width(context),
              color: AppColors.violetDarkColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    color: AppColors.whiteColor,
                    size: 20.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    'Open Bank Account Immediately',
                    style: poppinsRegular.copyWith(
                      fontSize: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
