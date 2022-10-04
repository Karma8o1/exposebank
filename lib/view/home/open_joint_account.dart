import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:expose_banq/const/loading.dart';
import 'package:expose_banq/controllers/userDataController/userDataController.dart';
import 'package:expose_banq/models/userData/userDataModel.dart';
import 'package:expose_banq/view/drawer/drawer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../const/exports.dart';

bool isNameTaken = false;
late final fcm;

class OpenJointAccountScreen extends StatefulWidget {
  const OpenJointAccountScreen({Key? key}) : super(key: key);

  @override
  State<OpenJointAccountScreen> createState() => _OpenJointAccountScreenState();
}

class _OpenJointAccountScreenState extends State<OpenJointAccountScreen> {
  // FirebaseMessaging
  //     .instance
  //     .getToken();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      fcm = await FirebaseMessaging.instance.getToken();
    });
  }

  TextEditingController accountNameController = TextEditingController();
  TextEditingController partnerController = TextEditingController();
  String selectedValue = "Account Type...";
  String memberValue = "Please Select...";
  UserData? choosenUser;
  late String currentUsername;

  /// door rating dropdown items
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Account Type...", child: Text("Account Type...")),
      const DropdownMenuItem(
          value: "Couples (Lovebirds)", child: Text("Couples (Lovebirds)")),
      const DropdownMenuItem(
          value: "Unions/Syndicats/Associations",
          child: Text("Unions/Syndicats/Associations")),
      const DropdownMenuItem(
          value: "Project Execution", child: Text("Project Execution")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get memberItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Please Select...", child: Text("Please Select...")),
      const DropdownMenuItem(
          value: "Admin (Approve/Deny)", child: Text("Admin (Approve/Deny)")),
      const DropdownMenuItem(
          value: "Standard (view only)", child: Text("Standard (view only)")),
    ];
    return menuItems;
  }

  static final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: height(context),
          width: width(context),
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'jointsecurity'.tr,
                        style: poppinsMedium.copyWith(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'hardmoney'.tr,
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
                        onEditingComplete: (() {
                          FirebaseFirestore.instance
                              .collection('jointAccount')
                              .doc(accountNameController.text)
                              .get()
                              .then((value) {
                            if (value.exists) {
                              ElegantNotification.error(
                                      title: Text('Account Name Taken'),
                                      description: Text(
                                          'Account with name already exists.'))
                                  .show(context);
                            }
                          });
                          FirebaseFirestore.instance
                              .collection('privateAccount')
                              .doc(accountNameController.text)
                              .get()
                              .then((value) {
                            if (value.exists) {
                              ElegantNotification.error(
                                      title: Text('Account Name Taken'),
                                      description: Text(
                                          'Account with name already exists.'))
                                  .show(context);
                            }
                          });
                        }),
                        onFieldSubmitted: ((value) {
                          FirebaseFirestore.instance
                              .collection('jointAccount')
                              .doc(value)
                              .get()
                              .then((value) {
                            if (value.exists) {
                              ElegantNotification.error(
                                      title: Text('Account Name Taken'),
                                      description: Text(
                                          'Account with name already exists.'))
                                  .show(context);
                            }
                          });
                          FirebaseFirestore.instance
                              .collection('privateAccount')
                              .doc(value)
                              .get()
                              .then((value) {
                            if (value.exists) {
                              ElegantNotification.error(
                                      title: Text('Account Name Taken'),
                                      description: Text(
                                          'Account with name already exists.'))
                                  .show(context);
                            }
                          });
                        }),
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
                          contentPadding:
                              const EdgeInsets.only(left: 16.0, top: 10.0),
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

                    /// account type dropdown
                    SizedBox(height: height(context) * 0.045),
                    Container(
                      height: height(context) * 0.065,
                      width: width(context),
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: AppColors.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: DropdownButton(
                                value: selectedValue,
                                items: dropdownItems,
                                hint: Text(
                                  'Account Type...',
                                  style: poppinsRegular.copyWith(
                                    fontSize: 16.0,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                style: poppinsRegular.copyWith(
                                  fontSize: 16.0,
                                  color: AppColors.blackColor,
                                ),
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: AppColors.blackColor,
                                ),
                                isExpanded: true,
                                onChanged: (String? value) {
                                  setState(
                                    () {
                                      selectedValue = value!;
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12.0),
                          ],
                        ),
                      ),
                    ),

                    /// Select member right
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Select Member\'s Right',
                            style: poppinsRegular.copyWith(
                              fontSize: 16.0,
                              color: AppColors.greyColor,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.greyColor,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: DropdownButton(
                                      value: memberValue,
                                      items: memberItems,
                                      hint: Text(
                                        'Please Select...',
                                        style: poppinsRegular.copyWith(
                                          fontSize: 13.0,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      style: poppinsRegular.copyWith(
                                        fontSize: 13.0,
                                        color: AppColors.blackColor,
                                      ),
                                      underline: const SizedBox(),
                                      icon: const Icon(
                                        Icons.arrow_drop_down_sharp,
                                        color: AppColors.blackColor,
                                      ),
                                      isExpanded: true,
                                      onChanged: (String? value) {
                                        setState(
                                          () {
                                            memberValue = value!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// search event here field
                    SizedBox(height: height(context) * 0.036),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        controller: partnerController,
                        keyboardType: TextInputType.name,
                        style: poppinsRegular.copyWith(
                          fontSize: 15.0,
                          color: AppColors.blackColor,
                          height: 1.5,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.violetDarkColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.violetDarkColor,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_search_rounded,
                            color: AppColors.greyColor,
                            size: 20.0,
                          ),
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          labelText: 'Search Partners for request',
                          hintText:
                              'Search Partner\'s Expose username (Usernames are case sensetive)',
                          hintStyle: poppinsRegular.copyWith(
                            fontSize: 15.0,
                            color: AppColors.greyColor,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('userData')
                            .where('userName',
                                isEqualTo: partnerController.text.trim())
                            .limit(1)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data!.docs.isNotEmpty) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                UserData userData = UserData.fromJson(
                                    snapshot.data!.docs[index]);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      choosenUser = userData;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 16.0, right: 16.0, top: 10.0),
                                    width: width(context),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: AppColors.blackGreyColor,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: choosenUser != null &&
                                                  choosenUser!.firstName ==
                                                      userData.firstName
                                              ? true
                                              : false,
                                          onChanged: null,
                                        ),
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor:
                                              AppColors.violetDarkColor,
                                          child: CircleAvatar(
                                            radius: 18.0,
                                            backgroundImage:
                                                NetworkImage(userData.profile),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                userData.username,
                                                style: poppinsMedium.copyWith(
                                                  fontSize: 16.0,
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                              const SizedBox(height: 5.0),
                                              Text(
                                                userData.email,
                                                style: poppinsMedium.copyWith(
                                                  fontSize: 14.0,
                                                  color: AppColors.redDarkColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: Text(
                                  'No account with this name or number exists'),
                            );
                          }
                          if (snapshot.hasError) {
                            print('Error while search: ${snapshot.error}');
                            return Center(
                              child: Text('Error Occured!'),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1,
                              ),
                            );
                          }
                        }),

                    /// Open Bank Account Immediately button
                    SizedBox(height: height(context) * 0.06),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 45.0,
                  width: width(context),
                  color: AppColors.violetDarkColor,
                  child: GetBuilder<UserDataController>(
                    builder: ((_) {
                      currentUsername = _.userData.username;

                      return InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            FirebaseFirestore.instance
                                .collection('jointAccount')
                                .doc(accountNameController.text)
                                .get()
                                .then(((value) {
                              if (value.exists) {
                                ElegantNotification.error(
                                    description: Text(
                                        'Account name already taken. Please select another account name.'));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          width: width(context),
                                          height: 300,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Requested User:',
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Requesting Date:',
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Account Type:',
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Request Status:',
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        choosenUser!.username,
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        DateFormat('dd/MM/yyyy')
                                                            .format(
                                                                DateTime.now()),
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        selectedValue,
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Awaited',
                                                        style: poppinsLight
                                                            .copyWith(
                                                          fontSize: 14.0,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 16.0,
                                                    right: 16.0,
                                                    top: 10.0),
                                                width: 250,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 10.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color:
                                                      AppColors.blackGreyColor,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20.0,
                                                      backgroundColor: AppColors
                                                          .violetDarkColor,
                                                      child: CircleAvatar(
                                                        radius: 18.0,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                choosenUser!
                                                                    .profile),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            choosenUser!
                                                                .username,
                                                            style: poppinsMedium
                                                                .copyWith(
                                                              fontSize: 16.0,
                                                              color: AppColors
                                                                  .whiteColor,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 5.0),
                                                          Text(
                                                            choosenUser!.email,
                                                            style: poppinsMedium
                                                                .copyWith(
                                                              fontSize: 14.0,
                                                              color: AppColors
                                                                  .redDarkColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                height: 10,
                                              ),
                                              Center(
                                                child: InkWell(
                                                  onTap: () async {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            'jointAccount')
                                                        .doc(
                                                            accountNameController
                                                                .text)
                                                        .get()
                                                        .then((value) {
                                                      if (value.exists) {
                                                        ElegantNotification.error(
                                                                title: Text(
                                                                    'Account Name Taken'),
                                                                description: Text(
                                                                    'Account with name already exists.'))
                                                            .show(context);
                                                      } else {
                                                        showLoading(context);
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'requests')
                                                            .doc(
                                                                accountNameController
                                                                    .text)
                                                            .set({
                                                          'requestFrom':
                                                              currentUsername,
                                                          'requestDate':
                                                              Timestamp.fromDate(
                                                                  DateTime
                                                                      .now()),
                                                          'senderRef':
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid,
                                                          'accountName':
                                                              accountNameController
                                                                  .text,
                                                          'permissionsGranted':
                                                              memberValue,
                                                          'accountType':
                                                              selectedValue,
                                                          'isPermissionGranted':
                                                              'Awaited',
                                                          'recieverRef':
                                                              choosenUser!.id,
                                                        }).then((value) {
                                                          FirebaseFunctions
                                                              .instance
                                                              .httpsCallable(
                                                                  'sendJointAccountRequest')
                                                              .call({
                                                            'senderToken': fcm,
                                                            'recieverToken':
                                                                choosenUser!
                                                                    .notificationToken,
                                                            'recieverTitle':
                                                                'You have recieved a joint account request.',
                                                            'recieverBody':
                                                                '${_.userData.firstName} wants to open a joint account and has provided you with ${memberValue}',
                                                            'senderTitle':
                                                                'Request sent to ${choosenUser!.firstName}',
                                                            'senderBody':
                                                                'Your request to open joint account has been sent to user',
                                                          }).then((value) {
                                                            print('success');
                                                            Get.back();
                                                          }).onError((error,
                                                                  stackTrace) {
                                                            Get.back();
                                                            print(error);
                                                          });
                                                          Get.back();
                                                        }).onError((error,
                                                                stackTrace) {
                                                          Get.back();
                                                        });
                                                      }
                                                    });
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                  child: Ink(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 48.0,
                                                        vertical: 14.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      gradient:
                                                          const LinearGradient(
                                                        colors: [
                                                          AppColors.btnOneColor,
                                                          AppColors.blackColor,
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Send Request!',
                                                      style: poppinsSemiBold
                                                          .copyWith(
                                                        fontSize: 14.0,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }));
                          }
                        },
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
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
