import 'package:bpls_mobile/datasource/model/base/api_response.dart';
import 'package:bpls_mobile/datasource/model/user_model.dart';
import 'package:bpls_mobile/datasource/repository/auth_repo.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  UserModel userModel1 = UserModel();

  void getUserDataFromLocal() {
    userModel1 = UserModel.fromJson(storage.get(AppConstant.userInfoSharedData) ?? {});
  }

  String email = '';
  String password = '';

  bool isPasswordVisible = false;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool isLoading = false;

  Future<bool> login() async {
    if (emailTextController.text.isEmpty || passwordTextController.text.isEmpty) {
      showToastMessage('ইমেইল এবং পাসওয়ার্ড খালি থাকতে পারে না।', isError: true);
      return Future.value(false);
    }

    email = emailTextController.text;
    password = passwordTextController.text;
    isLoading = true;
    notifyListeners();
    FocusScope.of(Get.context!).unfocus();
    progressLoader('লগইন করা হচ্ছে...');
    ApiResponse apiResponse = await authRepo.login(email, password);
    Get.back();
    isLoading = false;
    if (apiResponse.response.statusCode == 200) {
      authRepo.saveUserToken(apiResponse.response.data['access_token']);
      userModel1 = UserModel.fromJson(apiResponse.response.data['user']);
      storage.put(AppConstant.userInfoSharedData, userModel1.toJson());
      notifyListeners();
      Get.offNamed(AppRoutes.dashboard);
      return Future.value(true);
    } else {
      // Show user-friendly Bangla error message instead of raw API response
      showToastMessage('লগইন ব্যর্থ হয়েছে। অনুগ্রহ করে ইমেইল এবং পাসওয়ার্ড যাচাই করুন।', isError: true);
    }
    notifyListeners();
    return Future.value(false);
  }
}
