import 'dart:convert';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardCount {
  DashboardCount({this.totalKhanaHousehold = 0, this.totalOrganization = 0, this.totalSubmissions = 0, required this.storage});

  DashboardCount.fromJson(dynamic json, {required SharedPreferences storage})
    : this(totalKhanaHousehold: json['total_khana_household'] ?? 0, totalOrganization: json['total_organization'] ?? 0, totalSubmissions: json['total_submissions'] ?? 0, storage: storage);

  num? totalKhanaHousehold = 0;
  num? totalOrganization = 0;
  num? totalSubmissions = 0;

  final SharedPreferences storage;

  int totalTemporaySave = 0;
  int totalKhanaSave = 0;
  int totalOrgniztionSave = 0;

  void loadCounts() {
    String? tempData = storage.getString(AppConstant.savedPayloadList);
    totalTemporaySave = tempData != null ? (jsonDecode(tempData) as List).length : 0;
    String? khanaData = storage.getString(AppConstant.savedPayloadListCompleteKhana);
    totalKhanaSave = khanaData != null ? (jsonDecode(khanaData) as List).length : 0;
    String? orgData = storage.getString(AppConstant.savedPayloadListCompleteOrganization);
    totalOrgniztionSave = orgData != null ? (jsonDecode(orgData) as List).length : 0;
  }

  int get khanaAndOrganizationSave => totalKhanaSave + totalOrgniztionSave;

  int get totalCount => (totalKhanaHousehold?.toInt() ?? 0) + (totalOrganization?.toInt() ?? 0) + (totalTemporaySave) + (totalKhanaSave) + (totalOrgniztionSave);
}
