// lib/features/dashboard/controller/dashboard_controller.dart
import 'dart:io';
import 'package:bpls_mobile/services/connectivity_service.dart';
import 'package:bpls_mobile/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:bpls_mobile/routes/app_pages.dart';

class DashboardController extends GetxController {
  final ConnectivityService connectivityService = GetIt.instance<ConnectivityService>();
  final LocationService locationService = GetIt.instance<LocationService>();

  // User Profile Observables
  final userName = 'আরিফুল ইসলাম'.obs;
  final userEmail = 'arifulislam@gmail.com'.obs;
  final userPhone = '+880 1540-000000'.obs;
  final userMouza = 'কুড়িল, ঢাকা।'.obs;
  final userGeoCode = '12DHA06'.obs;
  final Rx<File?> profileImage = Rx<File?>(null);
  final isNetworkConnected = true.obs;

  // Location observables
  final Rx<Position?> currentLocation = Rx<Position?>(null);
  final isLocationPermissionGranted = false.obs;
  final isRequestingLocation = false.obs;

  void goBack() => Get.back();

  @override
  void onInit() {
    super.onInit();
    // Listen to connectivity changes
    connectivityService.addListener(_updateConnectivityStatus);
    isNetworkConnected.value = connectivityService.isConnected;

    // Initialize location
    _initializeLocation();

    // Start periodic location updates (every 10 minutes)
    locationService.startPeriodicLocationUpdates();
  }

  @override
  void onClose() {
    connectivityService.removeListener(_updateConnectivityStatus);
    locationService.stopPeriodicLocationUpdates();
    super.onClose();
  }

  void _updateConnectivityStatus() {
    isNetworkConnected.value = connectivityService.isConnected;
  }

  /// Initialize location on dashboard open
  Future<void> _initializeLocation() async {
    try {
      isRequestingLocation.value = true;

      // Initialize location service (checks if permission already granted)
      final position = await locationService.initializeLocation();

      if (position != null) {
        currentLocation.value = position;
        isLocationPermissionGranted.value = true;
        debugPrint('Location initialized: ${position.latitude}, ${position.longitude}');
      } else {
        isLocationPermissionGranted.value = false;

        // Check if we should show permission dialog
        final permission = await locationService.checkPermission();
        if (permission == LocationPermission.denied) {
          // Show dialog to request permission
          await _showLocationPermissionDialog();
        } else if (permission == LocationPermission.deniedForever) {
          // Show dialog to open settings
          _showOpenSettingsDialog();
        }
      }
    } catch (e) {
      debugPrint('Error initializing location: $e');
    } finally {
      isRequestingLocation.value = false;
    }
  }

  /// Show dialog to request location permission
  Future<void> _showLocationPermissionDialog() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('অবস্থান অনুমতি প্রয়োজন'),
        content: const Text(
          'এই অ্যাপটি আপনার অবস্থান অ্যাক্সেস করতে চায়। জরিপ ডেটা সংগ্রহের জন্য আপনার বর্তমান অবস্থান প্রয়োজন।',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('বাতিল করুন'),
          ),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            child: const Text('অনুমতি দিন'),
          ),
        ],
      ),
      barrierDismissible: false,
    );

    if (result == true) {
      await _requestLocationPermission();
    }
  }

  /// Request location permission
  Future<void> _requestLocationPermission() async {
    try {
      isRequestingLocation.value = true;

      final permission = await locationService.requestPermission();

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        // Permission granted, get location
        final position = await locationService.getCurrentLocation();
        if (position != null) {
          currentLocation.value = position;
          isLocationPermissionGranted.value = true;

          Get.snackbar(
            'সফল',
            'অবস্থান সফলভাবে পাওয়া গেছে',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
          );
        }
      } else if (permission == LocationPermission.deniedForever) {
        _showOpenSettingsDialog();
      } else {
        Get.snackbar(
          'অনুমতি প্রত্যাখ্যাত',
          'অবস্থান অনুমতি প্রত্যাখ্যান করা হয়েছে',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      debugPrint('Error requesting location permission: $e');
    } finally {
      isRequestingLocation.value = false;
    }
  }

  /// Show dialog to open app settings
  void _showOpenSettingsDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('অবস্থান অনুমতি প্রয়োজন'),
        content: const Text(
          'অবস্থান অনুমতি স্থায়ীভাবে প্রত্যাখ্যান করা হয়েছে। অ্যাপ সেটিংস থেকে অনুমতি প্রদান করুন।',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('বাতিল করুন'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              locationService.openAppSettings();
            },
            child: const Text('সেটিংস খুলুন'),
          ),
        ],
      ),
    );
  }

  /// Manually refresh location
  Future<void> refreshLocation() async {
    try {
      isRequestingLocation.value = true;

      final position = await locationService.getCurrentLocation();

      if (position != null) {
        currentLocation.value = position;
        isLocationPermissionGranted.value = true;

        Get.snackbar(
          'সফল',
          'অবস্থান আপডেট করা হয়েছে',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      } else {
        Get.snackbar(
          'ব্যর্থ',
          'অবস্থান পেতে ব্যর্থ হয়েছে',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      debugPrint('Error refreshing location: $e');
    } finally {
      isRequestingLocation.value = false;
    }
  }

  /// Get formatted location string
  String getLocationString() {
    if (currentLocation.value != null) {
      return 'অক্ষাংশ: ${currentLocation.value!.latitude.toStringAsFixed(6)}, দ্রাঘিমাংশ: ${currentLocation.value!.longitude.toStringAsFixed(6)}';
    }
    return 'অবস্থান উপলব্ধ নেই';
  }

  void goToTotalListing() => Get.toNamed(AppRoutes.totalListing);

  void goToProfile() => Get.toNamed(AppRoutes.profileSummary);

  void goToListingForm() {
    Get.toNamed(AppRoutes.listingFormStart);
  }

}

class DashboardItem {
  final String title;
  final String value;
  final IconData? icon;
  final VoidCallback? action; // Added callback for navigation

  DashboardItem({required this.title, required this.value, this.icon, this.action});
}

class SummaryItem {
  final String titleLeft, valueLeft, titleRight, valueRight;

  SummaryItem({required this.titleLeft, required this.valueLeft, required this.titleRight, required this.valueRight});
}
