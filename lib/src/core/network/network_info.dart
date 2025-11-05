import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
  Future<ConnectivityResult> get connectivityResult;
  Future<bool> hasInternetAccess();
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  final InternetConnectionChecker _internetChecker;
  final StreamController<bool> _connectivityController;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  NetworkInfoImpl({
    Connectivity? connectivity,
    InternetConnectionChecker? internetChecker,
  }) : _connectivity = connectivity ?? Connectivity(),
       _internetChecker =
           internetChecker ?? InternetConnectionChecker.createInstance(),
       _connectivityController = StreamController<bool>.broadcast() {
    _init();
  }

  void _init() {
    // Listen to connectivity changes
    _subscription = _connectivity.onConnectivityChanged.listen((results) async {
      // Take the first result if available, otherwise use ConnectivityResult.none
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;
      final hasInternet = await _checkInternetAccess(result);
      _connectivityController.add(hasInternet);
    });

    // Configure internet checker
    // _internetChecker.checkTimeout = const Duration(seconds: 10);
    // _internetChecker.checkInterval = const Duration(seconds: 10);
  }

  @override
  Future<bool> get isConnected async {
    final result = await connectivityResult;
    return _checkInternetAccess(result);
  }

  @override
  Stream<bool> get onConnectivityChanged => _connectivityController.stream;

  @override
  Future<ConnectivityResult> get connectivityResult async {
    final results = await _connectivity.checkConnectivity();
    return results.isNotEmpty ? results.first : ConnectivityResult.none;
  }

  @override
  Future<bool> hasInternetAccess() async {
    return await _internetChecker.hasConnection;
  }

  Future<bool> _checkInternetAccess(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      return false;
    }

    return await hasInternetAccess();
  }

  void dispose() {
    _subscription?.cancel();
    _connectivityController.close();
  }
}
