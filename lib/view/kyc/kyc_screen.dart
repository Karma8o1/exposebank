import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/view/security/create_pin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KYCScreen extends StatefulWidget {
  KYCScreen(
      {Key? key,
      required this.email,
      required this.phoneNumber,
      required this.pin,
      required this.userName})
      : super(key: key);
  String email, phoneNumber, userName, pin;

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController martialStatusController = TextEditingController();
  TextEditingController fatherFirstNameController = TextEditingController();
  TextEditingController fatherLastNameController = TextEditingController();
  TextEditingController motherFirstNameController = TextEditingController();
  TextEditingController motherLastNameController = TextEditingController();
  TextEditingController nationCardNumberController = TextEditingController();
  TextEditingController nicOrPassportIssueDateController =
      TextEditingController();
  TextEditingController nicOrPassportExpiryDateController =
      TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController countryOfResidenceController = TextEditingController();
  TextEditingController regionOrProvinceController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController quarterController = TextEditingController();
  TextEditingController houseNameController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.profile_circled,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),

      /// body
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),

            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'KYC Form',
                style: poppinsLight.copyWith(
                  fontSize: 14.0,
                  color: AppColors.whiteColor.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Tell Us About You',
                style: poppinsMedium.copyWith(
                  fontSize: 22.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'After you fill this form you will automatically  have your '
                'private bank account and you will never need to fill any '
                'form agian inorder to open a new bank account. ',
                style: poppinsLight.copyWith(
                  fontSize: 12.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            /// First name field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: firstNameController,
                hintText: 'First Name',
                keyboardType: TextInputType.name,
              ),
            ),

            /// last name field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: lastNameController,
                hintText: 'Last Name',
                keyboardType: TextInputType.name,
              ),
            ),

            /// Date of birth field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: dateOfBirthController,
                hintText: 'Date Of Birth',
                keyboardType: TextInputType.datetime,
              ),
            ),

            /// Place of birth field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: placeOfBirthController,
                hintText: 'Place Of Birth',
              ),
            ),

            /// Sex field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: sexController,
                hintText: 'Sex',
              ),
            ),

            /// Nationality field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: nationalityController,
                hintText: 'Nationality',
              ),
            ),

            /// Marital status field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: martialStatusController,
                hintText: 'Martial Status',
              ),
            ),

            /// Father’s first name field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: fatherFirstNameController,
                hintText: 'Father’s first name',
                keyboardType: TextInputType.name,
              ),
            ),

            /// Father’s last name field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: fatherLastNameController,
                hintText: 'Father’s last name',
                keyboardType: TextInputType.name,
              ),
            ),

            /// Mother first name field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: motherFirstNameController,
                hintText: 'Mother’s first name',
                keyboardType: TextInputType.name,
              ),
            ),

            /// Mother last name field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: motherLastNameController,
                hintText: 'Mother’s last name',
              ),
            ),

            /// National identity card number or Passport number or birth certificate number
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: nationCardNumberController,
                hintText:
                    'National identity card number or Passport number or birth certificate number',
                keyboardType: TextInputType.number,
              ),
            ),

            /// NIC or passport issue date field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: nicOrPassportIssueDateController,
                hintText: 'NIC or passport issue date',
                keyboardType: TextInputType.datetime,
              ),
            ),

            /// NIC or passport expiry date field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: nicOrPassportExpiryDateController,
                hintText: 'NIC or passport expiry date',
                keyboardType: TextInputType.datetime,
              ),
            ),

            /// Profession field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: professionController,
                hintText: 'Profession',
              ),
            ),

            /// Tax Number field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: taxNumberController,
                hintText: 'Tax Number',
                keyboardType: TextInputType.number,
              ),
            ),

            /// Country of residence field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: countryOfResidenceController,
                hintText: 'Country of residence',
              ),
            ),

            /// Region or province field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: regionOrProvinceController,
                hintText: 'Region or province',
              ),
            ),

            /// Town field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: townController,
                hintText: 'Town',
              ),
            ),

            /// Quarter field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: quarterController,
                hintText: 'Quarter',
              ),
            ),

            /// House name field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: houseNameController,
                hintText: 'House name',
              ),
            ),

            /// House number field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: CustomTextField(
                validator: (value) {},
                radius: 8.0,
                controller: houseNumberController,
                hintText: 'House number',
                keyboardType: TextInputType.number,
              ),
            ),

            /// passport size photo
            InkWell(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                height: height(context) * 0.2,
                width: width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.whiteColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.blackColor,
                    size: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
              child: Text(
                'Snap passport size photo here (selfie). Let us see your both ears,'
                ' chin, forehead, eyes clearly. No smiles. Look direct to the camera.',
                style: poppinsLight.copyWith(
                  fontSize: 11.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            /// national id card front photo
            InkWell(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                height: height(context) * 0.2,
                width: width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.whiteColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.blackColor,
                    size: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
              child: Text(
                'Upload National identity card number (front) or Passport number or birth certificate',
                style: poppinsLight.copyWith(
                  fontSize: 11.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            /// national id card back photo
            InkWell(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                height: height(context) * 0.2,
                width: width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.whiteColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.blackColor,
                    size: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
              child: Text(
                'Upload National identity card number (back)',
                style: poppinsLight.copyWith(
                  fontSize: 11.0,
                  color: AppColors.greyColor,
                ),
              ),
            ),

            /// submit button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height(context) * 0.13,
                vertical: 16.0,
              ),
              child: CustomGradientButton(
                btnText: 'Submit',
                onTap: () {
                  Get.to(const CreatePinScreen());
                },
                btnColorOne: AppColors.violetColor,
                btnColorTwo: AppColors.violetColor,
                btnColorThree: AppColors.violetColor,
                borderRadius: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
