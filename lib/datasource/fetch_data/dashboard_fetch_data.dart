import 'package:bpls_mobile/datasource/data_source_helper.dart';
import 'package:bpls_mobile/datasource/model/base/api_response.dart';
import 'package:bpls_mobile/datasource/remote/dio/dio_client.dart';
import 'package:bpls_mobile/datasource/repository/dashboard_repo.dart';
import 'package:bpls_mobile/utils/app_constant.dart';

class DashboardRepoFetchData implements DashboardRepo {
  final DioClient dioClient;

  DashboardRepoFetchData({required this.dioClient});

  @override
  Future<ApiResponse> getSettings() async {
    return handleApiCall(() => dioClient.get(AppConstant.settings));
  }

  @override
  Future<ApiResponse> riderModeStatusChange(bool isOnline) async {
    return handleApiCall(() => dioClient.post(isOnline ? AppConstant.online : AppConstant.offline));
  }

  @override
  Future<ApiResponse> currentLocation(String currentLatitude, String currentLongitude) async {
    return handleApiCall(() => dioClient.post(AppConstant.currentLocation, data: {"current_latitude": currentLatitude, "current_longitude": currentLongitude}));
  }

  @override
  Future<ApiResponse> getRideList(int page, bool isComplete, bool isTodayData) async {
    return handleApiCall(() => dioClient.get(isTodayData ? AppConstant.rideListToday(page) : AppConstant.rideList(page, isComplete)));
  }
  @override
  Future<ApiResponse> runningRide() async {
    return handleApiCall(() => dioClient.get(AppConstant.runningRide));
  }

  @override
  Future<ApiResponse> rideStart(int orderID) async {
    return handleApiCall(() => dioClient.post(AppConstant.rideStart(orderID)));
  }

  @override
  Future<ApiResponse> rideEnd(int orderID) async {
    return handleApiCall(() => dioClient.post(AppConstant.rideEnd(orderID)));
  }

}
