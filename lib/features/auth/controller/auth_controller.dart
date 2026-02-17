// lib/features/auth/controller/auth_controller.dart

import 'package:bpls_mobile/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpls_mobile/routes/app_pages.dart';

class AuthController extends GetxController {
  final isPasswordVisible = false.obs;
  
  final idTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  
void login() {
    // 1. Get the DashboardController to check for profile image
    final dashboardController = Get.find<DashboardController>();

    // Figma: Navigate after 300ms
    Future.delayed(const Duration(milliseconds: 300), () {
      if (dashboardController.profileImage.value == null) {
        // Condition: No profile pic -> Go to Pic Selection Screen
        Get.offNamed(AppRoutes.dashboard);
      } else {
        // Condition: Has pic -> Go to Dashboard
        Get.offNamed(AppRoutes.dashboard);
      }
    });
  }

  @override
  void onClose() {
    idTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }
}