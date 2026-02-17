import 'dart:async';

import 'package:bpls_mobile/business_logic/provider/dashboard_provider.dart';
import 'package:bpls_mobile/datasource/model/settings_model.dart';
import 'package:bpls_mobile/datasource/model/user_model.dart';
import 'package:bpls_mobile/datasource/repository/dashboard_repo.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBusinessLogic extends DashboardProvider {
  final DashboardRepo repository;

  DashboardBusinessLogic({required this.repository});

  final BehaviorSubject<int> _currentIndex = BehaviorSubject<int>.seeded(0);

  @override
  BehaviorSubject<int> get currentIndex => _currentIndex;

  @override
  void setCurrentIndex(int index) {
    _currentIndex.add(index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients) {
        pageController.jumpToPage(index);
      }
    });

    notifyListeners();
  }

  @override
  PageController pageController = PageController(initialPage: 0);

  @override
  SettingsModel settingsModel = SettingsModel();

  @override
  Future<void> getSettings() async {
    final response = await repository.getSettings();
    if (response.response.statusCode == 200) {
      settingsModel = SettingsModel.fromJson(response.response.data['data']);
      storage.put(AppConstant.settingsSharedData, settingsModel.toJson());
    } else {
      Fluttertoast.showToast(msg: response.error.toString());
    }
    notifyListeners();
  }

  @override
  void changeStatus(bool isOnline) async {
    final response = await repository.riderModeStatusChange(isOnline);
    if (response.response.statusCode == 201) {
      storage.put(AppConstant.riderActiveStatusSharedData, isOnline ? true : false);
    } else {
      Fluttertoast.showToast(msg: response.error.toString());
    }
    notifyListeners();
  }

  @override
  String latt = "";
  @override
  String lonn = "";

  @override
  Future<void> getLocation(var providerLocationHelper) async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();
      latt = "${position.latitude}";
      lonn = "${position.longitude}";
      updateCurrentLocation(providerLocationHelper);
      notifyListeners();
    } catch (e) {
    }
  }

  @override
  updateCurrentLocation(var providerLocationHelper) async {
    final response = await repository.currentLocation(latt, lonn);

    if (response.response.statusCode == 201) {
      print("Location Update Response: ${response.response.data}");

      UserModel userModel = UserModel.fromJson(response.response.data['data']);

      // var longitude = userModel.currentLongitude;
      // var latitude = userModel.currentLatitude;
      // storage.put(AppConstant.currentLongitudeSharedData, userModel.currentLongitude);
      // storage.put(AppConstant.currentLatitudeSharedData, userModel.currentLatitude);
      storage.put(AppConstant.userInfoSharedData, userModel.toJson());

      if (_currentIndex.value == 1) {
        providerLocationHelper.updateMyPosition(double.parse(latt), double.parse(lonn));
      }
      print("Location updated successfully");
    } else {
      print("Failed to update location");
    }
    notifyListeners();
  }

  @override
  int page = 1;
  @override
  bool hasNextData = true;
  @override
  bool bottomLoading = false;
  @override
  bool isLoading = false;
  @override
  bool isComplete = true;

  @override
  changeRideStatus(bool status) {
    isComplete = status;
    getRideList(isFirstTime: true);
    notifyListeners();
  }

  @override
  // TODO: implement acceptRideRequest
  bool get acceptRideRequest => throw UnimplementedError();

  @override
  void cancelRide() {
    // TODO: implement cancelRide
  }

  @override
  changeAcceptRideRequest(bool status) {
    // TODO: implement changeAcceptRideRequest
    throw UnimplementedError();
  }

  @override
  Future<bool> changeDestination(Map<String, dynamic> data) {
    // TODO: implement changeDestination
    throw UnimplementedError();
  }

  @override
  void changeRideStatusFully(int stage) {
    // TODO: implement changeRideStatusFully
  }

  @override
  clearRequestRideModel() {
    // TODO: implement clearRequestRideModel
    throw UnimplementedError();
  }

  @override
  void declineSocket() {
    // TODO: implement declineSocket
  }

  @override
  void endRide() {
    // TODO: implement endRide
  }

  @override
  Future<void> getRideList({bool isFirstTime = false, bool isTodayData = false}) {
    // TODO: implement getRideList
    throw UnimplementedError();
  }

  @override
  // TODO: implement isLoadingRunningRide
  bool get isLoadingRunningRide => throw UnimplementedError();

  @override
  // TODO: implement paymentStatus
  bool get paymentStatus => throw UnimplementedError();

  @override
  void rideRequestAccept() {
    // TODO: implement rideRequestAccept
  }

  @override
  // TODO: implement rideStage
  int get rideStage => throw UnimplementedError();

  @override
  void runningRide() {
    // TODO: implement runningRide
  }

  @override
  void startRide(bool status) {
    // TODO: implement startRide
  }

  @override
  void startRideFromSocket(bool status) {
    // TODO: implement startRideFromSocket
  }



}
