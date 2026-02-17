// lib/services/location_service.dart
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class LocationService extends ChangeNotifier {
  final SharedPreferences _prefs;

  // Keys for SharedPreferences
  static const String _keyLatitude = 'user_latitude';
  static const String _keyLongitude = 'user_longitude';
  static const String _keyLastCheckedTime = 'location_last_checked';
  static const String _keyPermissionGranted = 'location_permission_granted';

  // Location check interval (10 minutes)
  static const Duration _locationCheckInterval = Duration(minutes: 10);

  Position? _currentPosition;
  bool _permissionGranted = false;
  DateTime? _lastCheckedTime;
  Timer? _periodicTimer;

  Position? get currentPosition => _currentPosition;
  bool get permissionGranted => _permissionGranted;
  DateTime? get lastCheckedTime => _lastCheckedTime;

  LocationService(this._prefs) {
    _loadSavedData();
  }

  /// Load saved location data from SharedPreferences
  void _loadSavedData() {
    final lat = _prefs.getDouble(_keyLatitude);
    final lon = _prefs.getDouble(_keyLongitude);
    final lastChecked = _prefs.getString(_keyLastCheckedTime);
    _permissionGranted = _prefs.getBool(_keyPermissionGranted) ?? false;

    if (lat != null && lon != null) {
      _currentPosition = Position(
        latitude: lat,
        longitude: lon,
        timestamp: lastChecked != null ? DateTime.parse(lastChecked) : DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      );
    }

    if (lastChecked != null) {
      _lastCheckedTime = DateTime.parse(lastChecked);
    }
  }

  /// Save location data to SharedPreferences
  Future<void> _saveLocationData(Position position) async {
    await _prefs.setDouble(_keyLatitude, position.latitude);
    await _prefs.setDouble(_keyLongitude, position.longitude);
    await _prefs.setString(_keyLastCheckedTime, DateTime.now().toIso8601String());
    _lastCheckedTime = DateTime.now();
    notifyListeners();
  }

  /// Save permission status
  Future<void> _savePermissionStatus(bool granted) async {
    await _prefs.setBool(_keyPermissionGranted, granted);
    _permissionGranted = granted;
    notifyListeners();
  }

  /// Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Check current location permission status
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  /// Request location permission
  Future<LocationPermission> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Update permission status
    final granted = permission == LocationPermission.always ||
                    permission == LocationPermission.whileInUse;
    await _savePermissionStatus(granted);

    return permission;
  }

  /// Get current location
  Future<Position?> getCurrentLocation() async {
    try {
      // Check if location service is enabled
      bool serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      // Check permission
      LocationPermission permission = await checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        // Permission denied forever, cannot request again
        await _savePermissionStatus(false);
        return null;
      }

      if (permission == LocationPermission.denied) {
        await _savePermissionStatus(false);
        return null;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

      _currentPosition = position;
      await _saveLocationData(position);
      await _savePermissionStatus(true);

      return position;
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }

  /// Check if we should update location (based on 10-minute interval)
  bool shouldUpdateLocation() {
    if (_lastCheckedTime == null) return true;

    final now = DateTime.now();
    final difference = now.difference(_lastCheckedTime!);

    return difference >= _locationCheckInterval;
  }

  /// Initialize location service and get location if needed
  Future<Position?> initializeLocation() async {
    // Load saved data first
    _loadSavedData();

    // If permission was previously granted and we have data
    if (_permissionGranted && _currentPosition != null) {
      // Check if 10 minutes have passed
      if (shouldUpdateLocation()) {
        return await getCurrentLocation();
      }
      return _currentPosition;
    }

    // No permission or no data, request permission and get location
    return await getCurrentLocation();
  }

  /// Start periodic location updates (every 10 minutes)
  void startPeriodicLocationUpdates() {
    _periodicTimer?.cancel();

    _periodicTimer = Timer.periodic(_locationCheckInterval, (timer) async {
      if (_permissionGranted) {
        await getCurrentLocation();
      }
    });
  }

  /// Stop periodic location updates
  void stopPeriodicLocationUpdates() {
    _periodicTimer?.cancel();
    _periodicTimer = null;
  }

  /// Open app settings for user to manually grant permission
  Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }

  /// Open location settings
  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  /// Get saved latitude
  double? get savedLatitude => _prefs.getDouble(_keyLatitude);

  /// Get saved longitude
  double? get savedLongitude => _prefs.getDouble(_keyLongitude);

  /// Clear all saved location data
  Future<void> clearLocationData() async {
    await _prefs.remove(_keyLatitude);
    await _prefs.remove(_keyLongitude);
    await _prefs.remove(_keyLastCheckedTime);
    await _prefs.remove(_keyPermissionGranted);

    _currentPosition = null;
    _permissionGranted = false;
    _lastCheckedTime = null;

    notifyListeners();
  }

  @override
  void dispose() {
    stopPeriodicLocationUpdates();
    super.dispose();
  }
}

