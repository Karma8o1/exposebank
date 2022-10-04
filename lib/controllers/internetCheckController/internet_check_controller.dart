import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  static final networkConnectivity = Connectivity();
  static final controller = StreamController.broadcast();
  Stream get myStream => controller.stream;
  // 1.
  static void initialise() async {
    ConnectivityResult result = await networkConnectivity.checkConnectivity();
    checkStatus(result);
    networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      checkStatus(result);
    });
  }

// 2.
  static void checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}
