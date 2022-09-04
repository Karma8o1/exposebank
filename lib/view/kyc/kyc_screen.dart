// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/exports.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/controllers/StorageController/storageController.dart';
import 'package:expose_banq/controllers/authController.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

String? profileImage = '', cnicFront = '', cnicBack = '';
final storageRef = FirebaseStorage.instance.ref();
// final cnicStorageRef = FirebaseStorage.instanceFor(
//     bucket: "gs://expose-banq.appspot.com/cnicPictures");
// final profileStorageRef = FirebaseStorage.instanceFor(
//     bucket: 'gs://expose-banq.appspot.com/profilePictures');

class KYCScreen extends StatefulWidget {
  KYCScreen({
    Key? key,
    required this.email,
    required this.phoneNumber,
    required this.pin,
    required this.userName,
  }) : super(key: key);
  String email, phoneNumber, userName, pin;

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  static final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController martialStatusController = TextEditingController();
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
                  radius: 8.0,
                  controller: martialStatusController,
                  hintText: 'Martial Status',
                ),
              ),

              /// Mother last name field
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty.';
                    } else {
                      return null;
                    }
                  },
                  radius: 8.0,
                  controller: townController,
                  hintText: 'Town',
                ),
              ),

              /// passport size photo
              InkWell(
                onTap: () async {
                  final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpg']);
                  if (results == null) {
                    ElegantNotification.error(
                        description: const Text(
                            'You need to pick an image to continue'));
                    return;
                  }
                  final filePath = results.files.single.path;
                  final fileName = results.files.single.name;
                  setState(() async {
                    profileImage = await StorageController.uploadImage(
                        fileName: fileName,
                        filePath: filePath,
                        bucketAddress: 'profilePictures');
                  });
                  // showModalBottomSheet<void>(
                  //   context: context,
                  //   backgroundColor: Colors.transparent,
                  //   builder: (BuildContext context) {
                  //     return Container(
                  //       decoration: const BoxDecoration(
                  //           color: Colors.black87,
                  //           borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(5),
                  //               topRight: Radius.circular(5))),
                  //       height: 200,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: <Widget>[
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               InkWell(
                  //                 onTap: () {},
                  //                 child: SizedBox(
                  //                   height: 50,
                  //                   width: 50,
                  //                   child:
                  //                       Image.asset('assets/images/camera.png'),
                  //                 ),
                  //               ),
                  //               const Text(
                  //                 'CAMERA',
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               )
                  //             ],
                  //           ),
                  //           const VerticalDivider(
                  //             width: 100,
                  //           ),
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               InkWell(
                  //                 onTap: () async {
                  //                   final results = await FilePicker.platform
                  //                       .pickFiles(
                  //                           allowMultiple: false,
                  //                           type: FileType.custom,
                  //                           allowedExtensions: ['png', 'jpg']);
                  //                   if (results == null) {
                  //                     ElegantNotification.error(
                  //                         description: const Text(
                  //                             'You need to pick an image to continue'));
                  //                     return;
                  //                   }
                  //                   final filePath = results.files.single.path;
                  //                   final fileName = results.files.single.name;
                  //                   setState(() async {
                  //                     profileImage =
                  //                         await StorageController.uploadImage(
                  //                             fileName: fileName,
                  //                             filePath: filePath,
                  //                             bucketAddress: 'profilePictures');
                  //                   });
                  //                 },
                  //                 child: SizedBox(
                  //                   height: 50,
                  //                   width: 50,
                  //                   child: Image.asset(
                  //                       'assets/images/gallery.png'),
                  //                 ),
                  //               ),
                  //               const Text(
                  //                 'GALLERY',
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               )
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // );
                },
                child: profileImage == null
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8.0),
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
                            size: 100.0,
                          ),
                        ),
                      )
                    : Center(
                        child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 45,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                    'https://${profileImage as String}'))),
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
                onTap: () async {
                  final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpg']);
                  if (results == null) {
                    ElegantNotification.error(
                        description: const Text(
                            'You need to pick an image to continue'));
                    return;
                  }
                  final filePath = results.files.single.path;
                  final fileName = results.files.single.name;
                  setState(() async {
                    cnicFront = await StorageController.uploadImage(
                        fileName: fileName,
                        filePath: filePath,
                        bucketAddress: 'cnicPictures');
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8.0),
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
                onTap: () async {
                  final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpg']);
                  if (results == null) {
                    ElegantNotification.error(
                        description: const Text(
                            'You need to pick an image to continue'));
                    return;
                  }
                  final filePath = results.files.single.path;
                  final fileName = results.files.single.name;
                  setState(() async {
                    cnicBack = await StorageController.uploadImage(
                        fileName: fileName,
                        filePath: filePath,
                        bucketAddress: 'cnicPictures');
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8.0),
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
                    //registers user to firebase and stores the collected data.
                    if (_formKey.currentState!.validate()) {
                      showLoading(context);
                      AuthController.registerUser(
                        phoneNumber: widget.phoneNumber,
                        firstName: firstNameController.text.trim(),
                        email: widget.email,
                        username: widget.userName,
                        pinCode: widget.pin,
                        lastName: lastNameController.text,
                        dateOfBirth: dateOfBirthController.text,
                        placeOfBirth: placeOfBirthController.text,
                        sex: sexController.text,
                        nationality: nationalityController.text,
                        martialStatus: martialStatusController.text,
                        motherLastName: motherLastNameController.text,
                        nationCardNumber: nationCardNumberController.text,
                        nicOrPassportIssueDate:
                            nicOrPassportExpiryDateController.text,
                        nicOrPassportExpiryDate:
                            nicOrPassportExpiryDateController.text,
                        profession: professionController.text,
                        countryOfResidence: countryOfResidenceController.text,
                        regionOrProvince: regionOrProvinceController.text,
                        town: townController.text,
                        context: context,
                        cnicBack: cnicBack,
                        cnicFront: cnicFront,
                        profile: profileImage,
                      );
                    }
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
      ),
    );
  }
}
