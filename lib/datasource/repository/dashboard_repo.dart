    import 'package:bpls_mobile/datasource/model/base/api_response.dart';
abstract class DashboardRepo {
  // --- Getter methods ---
// TODO: --- No getter methods found ---

  // --- Pure functions ---
  Future<ApiResponse> currentLocation(String currentLatitude, String currentLongitude);
  Future<ApiResponse> getRideList(int page, bool isComplete, bool isTodayData);
  Future<ApiResponse> runningRide();
  Future<ApiResponse> getSettings();
  Future<ApiResponse> rideEnd(int orderID);
  Future<ApiResponse> rideStart(int orderID);
  Future<ApiResponse> riderModeStatusChange(bool isOnline);
}
