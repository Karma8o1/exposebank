import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showLoading(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              content: SpinKitCubeGrid(color: Colors.blueGrey[600]),
            ),
            onWillPop: () async {
              return false;
            });
      });
}
