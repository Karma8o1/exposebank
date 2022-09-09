import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expose_banq/models/userData/userDataModel.dart';
import 'package:get/state_manager.dart';

class UserDataController extends GetxController {
  UserData userData;
  UserDataController({required this.userData});
}
