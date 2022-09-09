import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String phoneNumber,
      firstName,
      lastName,
      email,
      username,
      pinCode,
      dateOfBirth,
      placeOfBirth,
      sex,
      nationality,
      martialStatus,
      motherLastName,
      nationCardNumber,
      nicOrPassportIssueDate,
      nicOrPassportExpiryDate,
      profession,
      countryOfResidence,
      regionOrProvince,
      town,
      profile;
  UserData({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.pinCode,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.sex,
    required this.nationality,
    required this.martialStatus,
    required this.motherLastName,
    required this.nationCardNumber,
    required this.nicOrPassportIssueDate,
    required this.nicOrPassportExpiryDate,
    required this.profession,
    required this.countryOfResidence,
    required this.regionOrProvince,
    required this.town,
    required this.profile,
  });
  @override
  List<Object?> get props => [
        phoneNumber,
        firstName,
        lastName,
        email,
        username,
        pinCode,
        dateOfBirth,
        placeOfBirth,
        sex,
        nationality,
        martialStatus,
        motherLastName,
        nationCardNumber,
        nicOrPassportIssueDate,
        nicOrPassportExpiryDate,
        profession,
        countryOfResidence,
        regionOrProvince,
        town,
        profile,
      ];
  static UserData fromJson(DocumentSnapshot snapshot) {
    UserData userData = UserData(
      phoneNumber: snapshot['phoneNumber'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      email: snapshot['emailAddress'],
      username: snapshot['userName'],
      pinCode: snapshot['pinCode'],
      dateOfBirth: snapshot['dateOfBirth'],
      placeOfBirth: snapshot['placeOfBirth'],
      sex: snapshot['sex'],
      nationality: snapshot['nationality'],
      martialStatus: snapshot['martialStatus'],
      motherLastName: snapshot['motherLastName'],
      nationCardNumber: snapshot['nationCardNumber'],
      nicOrPassportIssueDate: snapshot['nicOrPassportIssueDate'],
      nicOrPassportExpiryDate: snapshot['nicOrPassportExpiryDate'],
      profession: snapshot['profession'],
      countryOfResidence: snapshot['countryOfResidence'],
      regionOrProvince: snapshot['regionOrProvince'],
      town: snapshot['townController'],
      profile: snapshot['profileImage'],
    );
    return userData;
  }
}