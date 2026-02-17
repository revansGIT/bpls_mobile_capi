import 'dart:convert';

import 'package:bpls_mobile/datasource/model/base/api_response.dart';
import 'package:bpls_mobile/datasource/model/dashboard_count.dart';
import 'package:bpls_mobile/datasource/model/payload_model.dart';
import 'package:bpls_mobile/datasource/repository/auth_repo.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDataProvider with ChangeNotifier {
  final AuthRepo authRepo;
  final SharedPreferences prefs;

  SaveDataProvider({required this.authRepo, required this.prefs});

  DashboardCount? dashboardCount;

  void getDashboardCount() async {
    dashboardCount = DashboardCount(storage: prefs);
    dashboardCount!.loadCounts();
    ApiResponse response = await authRepo.countByType();
    if (response.response.statusCode == 200) {
      dashboardCount = DashboardCount.fromJson(response.response.data['data'], storage: prefs);
      dashboardCount!.loadCounts();
      notifyListeners();
    } else {
      dashboardCount = DashboardCount(storage: prefs);
      dashboardCount!.loadCounts();
      notifyListeners();
    }
  }

  List<PayloadModel> savedPayloadList = [];
  List<PayloadModel> savedPayloadListCompleteKhana = [];
  List<PayloadModel> savedPayloadListCompleteKhanaTemp = [];
  List<PayloadModel> savedPayloadListCompleteOrganization = [];
  List<PayloadModel> savedPayloadListCompleteOrganizationTemp = [];
  List<PayloadModel> savedPayloadListTemp = [];

  Future<void> initPrefs() async {
    initializeSavedPayloadList();
    getDashboardCount();
  }

  void initializeSavedPayloadList({bool isFirstTime = true}) {
    savedPayloadList = [];
    savedPayloadListTemp = [];
    savedPayloadListCompleteKhana = [];
    savedPayloadListCompleteKhanaTemp = [];
    savedPayloadListCompleteOrganization = [];
    savedPayloadListCompleteOrganizationTemp = [];

    // Load saved data
    // lastSaveNumber = prefs.getInt(AppConstant.lastSavedNumber) ?? 0;
    String? notCompleteJson = prefs.getString(AppConstant.savedPayloadList);
    if (notCompleteJson != null) {
      List<dynamic> savedListNotComplete = jsonDecode(notCompleteJson);
      for (var e in savedListNotComplete) {
        PayloadModel payloadModel = PayloadModel.fromJson(e);
        savedPayloadList.add(payloadModel);
        savedPayloadListTemp.add(payloadModel);
      }
    }
    List<PayloadModel> proodd = getProductList(true);
    if (proodd.isNotEmpty) {
      for (var e in proodd) {
        savedPayloadListCompleteKhana.add(e);
        savedPayloadListCompleteKhanaTemp.add(e);
      }
    }
    List<PayloadModel> prooddOrg = getProductList(false);
    if (prooddOrg.isNotEmpty) {
      for (var e in prooddOrg) {
        savedPayloadListCompleteOrganization.add(e);
        savedPayloadListCompleteOrganizationTemp.add(e);
      }
    }

    if (isFirstTime == false) {
      notifyListeners();
    }
  }

  List<PayloadModel> getProductList(bool isKhanaHousehold) {
    String? jsonString = prefs.getString(isKhanaHousehold ? AppConstant.savedPayloadListCompleteKhana : AppConstant.savedPayloadListCompleteOrganization);

    if (jsonString != null) {
      List<dynamic> rawList = jsonDecode(jsonString);
      return rawList.map((item) => PayloadModel.fromJson(item)).toList();
    }

    return []; // Return empty list if no data exists
  }

  void addSurveyData(PayloadModel payloadModel) {
    if (payloadModel.isDoneAll!) {
      if (providerSurvey.isFromTemporarySave == true) {
        savedPayloadList.removeAt(providerSurvey.index);
        prefs.setString(AppConstant.savedPayloadList, jsonEncode(savedPayloadList.map((e) => e.toJson()).toList()));
        if (payloadModel.module01Identification!.respondentType == 1) {
          savedPayloadListCompleteKhana.add(payloadModel);
          prefs.remove(AppConstant.savedPayloadListCompleteKhana);
          prefs.setString(AppConstant.savedPayloadListCompleteKhana, jsonEncode(savedPayloadListCompleteKhana.map((e) => e.toJson()).toList()));
        } else {
          savedPayloadListCompleteOrganization.add(payloadModel);
          prefs.remove(AppConstant.savedPayloadListCompleteOrganization);
          prefs.setString(AppConstant.savedPayloadListCompleteOrganization, jsonEncode(savedPayloadListCompleteOrganization.map((e) => e.toJson()).toList()));
        }
      } else {
        if (payloadModel.module01Identification!.respondentType == 1) {
          if (providerSurvey.isFromUpdate) {
            savedPayloadListCompleteKhana[providerSurvey.index] = payloadModel;
          } else {
            savedPayloadListCompleteKhana.add(payloadModel);
          }
          prefs.remove(AppConstant.savedPayloadListCompleteKhana);
          prefs.setString(AppConstant.savedPayloadListCompleteKhana, jsonEncode(savedPayloadListCompleteKhana.map((e) => e.toJson()).toList()));
        } else {
          if (providerSurvey.isFromUpdate) {
            savedPayloadListCompleteOrganization[providerSurvey.index] = payloadModel;
          } else {
            savedPayloadListCompleteOrganization.add(payloadModel);
          }
          prefs.remove(AppConstant.savedPayloadListCompleteOrganization);
          prefs.setString(AppConstant.savedPayloadListCompleteOrganization, jsonEncode(savedPayloadListCompleteOrganization.map((e) => e.toJson()).toList()));
        }
      }
    } else {
      if (providerSurvey.isFromUpdate) {
        savedPayloadList[providerSurvey.index] = payloadModel;
      } else {
        savedPayloadList.add(payloadModel);
      }
      prefs.setString(AppConstant.savedPayloadList, jsonEncode(savedPayloadList.map((e) => e.toJson()).toList()));
    }
    initializeSavedPayloadList(isFirstTime: false);
    dashboardCount?.loadCounts();
    notifyListeners();
  }

  bool isLoading = false;

  Future<void> clickSubmitForm(List<int> indices, bool isKhanaHouseHold) async {
    isLoading = true;
    notifyListeners();
    List<PayloadModel> toSubmit = [];
    if (isKhanaHouseHold) {
      toSubmit = indices.map((i) => savedPayloadListCompleteKhana[i]).toList();
    } else {
      toSubmit = indices.map((i) => savedPayloadListCompleteOrganization[i]).toList();
    }

    for (PayloadModel payload in toSubmit) {
      await submitForm(payload, isKhanaHouseHold);
    }
    getDashboardCount();
    initializeSavedPayloadList(isFirstTime: false);
    dashboardCount?.loadCounts();
    // showToastMessage('Form submitted successfully', isError: false);
    isLoading = false;
    notifyListeners();
  }

  Future<void> submitForm(PayloadModel payload, bool isKhana) async {
    progressLoader('Submitting Data');
    ApiResponse apiResponse = await authRepo.submitForm(payload);
    Get.back();
    if (apiResponse.response.statusCode == 200) {
      if (isKhana) {
        savedPayloadListCompleteKhana.remove(payload);
        prefs.setString(AppConstant.savedPayloadListCompleteKhana, jsonEncode(savedPayloadListCompleteKhana.map((e) => e.toJson()).toList()));
      } else {
        savedPayloadListCompleteOrganization.remove(payload);
        prefs.setString(AppConstant.savedPayloadListCompleteOrganization, jsonEncode(savedPayloadListCompleteOrganization.map((e) => e.toJson()).toList()));
      }
      notifyListeners();
    } else {
      print('Submission failed: ${apiResponse.error}');
      // showToastMessage(apiResponse.error.toString(), isError: true);
    }
  }

  void searchData(String query, bool isKhanaHouseHold) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      if (isKhanaHouseHold) {
        savedPayloadListCompleteKhanaTemp = List<PayloadModel>.from(savedPayloadListCompleteKhana);
      } else {
        savedPayloadListCompleteOrganizationTemp = List<PayloadModel>.from(savedPayloadListCompleteOrganization);
      }

      notifyListeners();
      return;
    }

    final q = trimmed.toLowerCase();

    if (isKhanaHouseHold) {
      savedPayloadListCompleteKhanaTemp = savedPayloadListCompleteKhana.where((payload) {
        final name =
            (payload.module02GeneralInfo?.householdDetails?.khanaHeadName ??
                    payload.module02GeneralInfo?.institutionDetails?.ownerName ??
                    payload.module02GeneralInfo?.householdDetails?.fatherHusbandName ??
                    '')
                .toString()
                .toLowerCase();

        final phone =
            (payload.module02GeneralInfo?.householdDetails?.respondentMobile ??
                    payload.module02GeneralInfo?.householdDetails?.answerPersonPhoneNumber ??
                    payload.module02GeneralInfo?.institutionDetails?.organizationPhone ??
                    '')
                .toString()
                .toLowerCase();

        return name.contains(q) || phone.contains(q);
      }).toList();
    } else {
      savedPayloadListCompleteOrganizationTemp = savedPayloadListCompleteOrganization.where((payload) {
        final name =
            (payload.module02GeneralInfo?.institutionDetails?.ownerName ??
                    payload.module02GeneralInfo?.householdDetails?.khanaHeadName ??
                    payload.module02GeneralInfo?.householdDetails?.fatherHusbandName ??
                    '')
                .toString()
                .toLowerCase();

        final phone =
            (payload.module02GeneralInfo?.institutionDetails?.organizationPhone ??
                    payload.module02GeneralInfo?.householdDetails?.respondentMobile ??
                    payload.module02GeneralInfo?.householdDetails?.answerPersonPhoneNumber ??
                    '')
                .toString()
                .toLowerCase();

        return name.contains(q) || phone.contains(q);
      }).toList();
    }

    notifyListeners();
  }

  void deletePayload(PayloadModel item, bool isComplete) {
    if (!isComplete) {
      savedPayloadList.remove(item);
      savedPayloadListTemp.remove(item);
      prefs.setString(AppConstant.savedPayloadList, jsonEncode(savedPayloadList.map((e) => e.toJson()).toList()));
      initializeSavedPayloadList(isFirstTime: false);
      dashboardCount?.loadCounts();
      showToastMessage('Data deleted successfully', isError: false);
      Get.back();
      notifyListeners();
      return;
    }
    if (item.module01Identification!.respondentType == 1) {
      savedPayloadListCompleteKhana.remove(item);
      savedPayloadListCompleteKhanaTemp.remove(item);
      prefs.setString(AppConstant.savedPayloadListCompleteKhana, jsonEncode(savedPayloadListCompleteKhana.map((e) => e.toJson()).toList()));
    } else {
      savedPayloadListCompleteOrganization.remove(item);
      savedPayloadListCompleteOrganizationTemp.remove(item);
      prefs.setString(AppConstant.savedPayloadListCompleteOrganization, jsonEncode(savedPayloadListCompleteOrganization.map((e) => e.toJson()).toList()));
    }
    initializeSavedPayloadList(isFirstTime: false);
    dashboardCount?.loadCounts();
    showToastMessage('Data deleted successfully', isError: false);
    Get.back();
    notifyListeners();
  }

  void resetSharedData() {
    savedPayloadList = [];
    savedPayloadListTemp = [];
    savedPayloadListCompleteKhana = [];
    savedPayloadListCompleteKhanaTemp = [];
    savedPayloadListCompleteOrganization = [];
    savedPayloadListCompleteOrganizationTemp = [];
    prefs.remove(AppConstant.savedPayloadList);
    prefs.remove(AppConstant.savedPayloadListCompleteKhana);
    prefs.remove(AppConstant.savedPayloadListCompleteOrganization);
    dashboardCount?.loadCounts();
    // notifyListeners();
  }
}
