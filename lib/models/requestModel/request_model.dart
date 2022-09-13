import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class RequestModel {
  String accountName,
      senderRef,
      recieverRef,
      requestDate,
      accountType,
      id,
      isPermissionGranted;
  RequestModel({
    required this.accountName,
    required this.accountType,
    required this.recieverRef,
    required this.requestDate,
    required this.senderRef,
    required this.id,
    required this.isPermissionGranted,
  });

  static RequestModel fromSnapshot(DocumentSnapshot snapshot) {
    RequestModel request = RequestModel(
      accountName: snapshot['accountName'],
      accountType: snapshot['accountType'],
      recieverRef: snapshot['recieverRef'],
      requestDate:
          DateFormat('MM/yy').format(DateTime.fromMillisecondsSinceEpoch(
        snapshot['requestDate'].millisecondsSinceEpoch,
      )),
      senderRef: snapshot['senderRef'],
      id: snapshot.id,
      isPermissionGranted: snapshot['isPermissionGranted'],
    );
    return request;
  }
}
