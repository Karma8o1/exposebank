import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showLoading(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
            child: const AlertDialog(
              backgroundColor: Colors.transparent,
              content: SpinKitWave(color: Colors.white),
            ),
            onWillPop: () async {
              return false;
            });
      });
}
