import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bpls_mobile/datasource/model/settings_model.dart';

abstract class DashboardProvider with ChangeNotifier {
  // --- Getter methods ---
  bool get acceptRideRequest;
  bool get bottomLoading;
  BehaviorSubject<int> get currentIndex;
  bool get hasNextData;
  bool get isLoadingRunningRide;
  bool get isComplete;
  bool get isLoading;
  String get latt;
  String get lonn;
  int get page;
  PageController get pageController;
  bool get paymentStatus;
  int get rideStage;
  SettingsModel get settingsModel;

  // --- Pure functions ---
  void cancelRide();
  dynamic changeAcceptRideRequest(bool status);
  dynamic changeRideStatus(bool status);
  void changeStatus(bool isOnline);
  dynamic clearRequestRideModel();
  void declineSocket();
  void endRide();
  void runningRide();
  Future<void> getLocation(var providerLocationHelper);
  Future<void> getRideList({bool isFirstTime = false, bool isTodayData = false});
  Future<void> getSettings();
  void rideRequestAccept();
  void setCurrentIndex(int index);
  void changeRideStatusFully(int stage);
  void startRide(bool status);
  void startRideFromSocket(bool status);
  Future<bool>  changeDestination(Map<String, dynamic> data);
  dynamic updateCurrentLocation(var providerLocationHelper);

}
