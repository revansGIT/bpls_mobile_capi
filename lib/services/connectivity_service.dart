import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  bool _isInitialized = false;

  List<ConnectivityResult> get connectionStatus => _connectionStatus;
  bool get isInitialized => _isInitialized;

  bool get isConnected {
    // If not yet initialized, assume connected (avoid false negatives during startup)
    if (!_isInitialized) {
      return true;
    }
    return _connectionStatus.isNotEmpty && !_connectionStatus.contains(ConnectivityResult.none);
  }

  ConnectivityService() {
    _initConnectivity();
    _connectivity.onConnectivityChanged.listen((result) {
      _connectionStatus = result;
      _isInitialized = true;
      notifyListeners();
    });
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      if (kDebugMode) {
        print('Couldn\'t check connectivity status: $e');
      }
      // On error during init, assume connected
      _isInitialized = true;
      return;
    }

    _connectionStatus = result;
    _isInitialized = true;
    notifyListeners();
  }

  Future<bool> checkConnection() async {
    final result = await _connectivity.checkConnectivity();
    _connectionStatus = result;
    _isInitialized = true;
    notifyListeners();
    return result.isNotEmpty && !result.contains(ConnectivityResult.none);
  }
}

