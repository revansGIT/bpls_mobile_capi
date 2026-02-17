// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class LocationService {
//   final Location _location = Location();
//
//   // Check the current permission status
//   Future<PermissionStatus> getPermissionStatus() async {
//     return await _location.hasPermission();
//   }
//
//   // Request permission if it's denied or not granted
//   Future<PermissionStatus> requestPermission() async {
//     PermissionStatus permissionStatus = await _location.requestPermission();
//     return permissionStatus;
//   }
//
//   // Check if location service is enabled
//   Future<bool> checkLocationService() async {
//     bool isServiceEnabled = await _location.serviceEnabled();
//     if (!isServiceEnabled) {
//       // Request to enable location service if it's disabled
//       isServiceEnabled = await _location.requestService();
//     }
//     return isServiceEnabled;
//   }
//
//   // Periodic check to monitor permission status
//   Future<void> monitorPermissionStatus(Function(PermissionStatus) onPermissionChanged) async {
//     PermissionStatus currentStatus = await getPermissionStatus();
//     onPermissionChanged(currentStatus);
//   }
//
//   // Periodic check to monitor service status
//   Future<void> monitorServiceStatus(Function(bool) onServiceChanged) async {
//     bool isServiceEnabled = await checkLocationService();
//     onServiceChanged(isServiceEnabled);
//   }
// }
