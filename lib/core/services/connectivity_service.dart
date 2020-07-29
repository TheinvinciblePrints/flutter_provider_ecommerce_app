import 'dart:async';

import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> _connectionStatusController =
      StreamController<ConnectivityStatus>();

  Stream<ConnectivityStatus> get connection =>
      _connectionStatusController.stream;

  ConnectivityService() {
    // Subscribe to the connectivity Changed Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return ConnectivityStatus.Online;
    } else {
      return ConnectivityStatus.Offline;
    }
  }

  void disposeStreams() {
    _connectionStatusController.close();
  }
}

enum ConnectivityStatus { Online, Offline }
