// lib/features/auth/presentation/login_screen.dart

import 'package:bpls_mobile/business_logic/provider/auth_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Scaffold(
        backgroundColor: AppTheme.scaffoldBg,
        // SingleChildScrollView prevents overflow when the keyboard is open
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh, // Uses ScreenUtil to take 100% of screen height
            width: 1.sw,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // --- National Logo ---
                Positioned(
                  top: 104.h,
                  child: Image.asset('assets/images/national_logo.png', width: 98.w, height: 100.h, fit: BoxFit.contain),
                ),

                // --- Project Title ---
                Positioned(
                  top: 231.h,
                  left: 99.w,
                  right: 99.w,
                  child: Text(
                    'ফসলের ক্ষতি ও অপচয় নিরূপণ জরিপ-২০২৬',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 35.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark, height: 1.79, letterSpacing: -0.04 * 35.sp),
                  ),
                ),

                // --- Login Card Container ---
                Positioned(
                  top: 404.h,
                  left: 56.w,
                  right: 56.w,
                  child: Container(
                    height: 710.h,
                    padding: EdgeInsets.symmetric(horizontal: 54.w),
                    decoration: BoxDecoration(
                      color: AppTheme.cardBg,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [BoxShadow(color: const Color(0x1A727D87), blurRadius: 34.r, offset: const Offset(0, 8))],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 48.h),
                        Text(
                          'লগ-ইন',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 56.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark, height: 1.1),
                        ),
                        SizedBox(height: 60.h),

                        // ID Section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ইমেইল দিন',
                            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        _buildTextField(controller: authProvider.emailTextController, hint: 'আপনার ইমেইল লিখুন', icon: Icons.email,currentFocus: emailFocusNode,nextFocus: passwordFocusNode),

                        SizedBox(height: 38.h),

                        // Password Section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'পাসওয়ার্ড দিন',
                            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        _buildTextField(
                          controller: authProvider.passwordTextController,
                          hint: 'আপনার পাসওয়ার্ড লিখুন',
                          icon: Icons.lock_outline,
                          isPassword: true,
                          onSubmitted: (_) => authProvider.login(),
                          obscureText: !authProvider.isPasswordVisible,
                          onToggle: authProvider.togglePasswordVisibility,
                          currentFocus: passwordFocusNode,
                        ),

                        SizedBox(height: 48.h),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 80.h,
                          child: ElevatedButton(
                                  onPressed: authProvider.login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.primaryPurple,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                  ),
                                  child: Text(
                                    'এগিয়ে যান',
                                    style: TextStyle(fontSize: 28.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                        ),

                        const Spacer(),

                        // Contact Text
                        Column(
                          children: [
                            Text(
                              'কোনো সমস্যা হচ্ছে?',
                              style: TextStyle(fontSize: 20.sp, color: AppTheme.textDark),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'যোগাযোগ করুন',
                                style: TextStyle(fontSize: 20.sp, color: AppTheme.textDark, decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),

                // --- Bottom Logo Section ---
                Positioned(
                  bottom: 60.h,
                  child: Column(
                    children: [
                      Image.asset('assets/images/bbs_logo.png', width: 87.w, height: 86.h, fit: BoxFit.contain),
                      SizedBox(height: 10.h),
                      Text(
                        'বাংলাদেশ পরিসংখ্যান ব্যুরো (বিবিএস)',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String hint, required IconData icon, bool isPassword = false, bool obscureText = false, VoidCallback? onToggle, ValueChanged<String>? onSubmitted,FocusNode? currentFocus, FocusNode? nextFocus}) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
        style: TextStyle(fontSize: 24.sp),
        onSubmitted: (String value) {
          if (nextFocus != null) {
            FocusScope.of(Get.context!).requestFocus(nextFocus);
          } else {
            FocusScope.of(Get.context!).unfocus();
          }
          if (onSubmitted != null) {
            onSubmitted(value);
          }

        },
        focusNode: currentFocus,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 22.sp, color: Colors.grey),
          prefixIcon: Icon(icon, color: AppTheme.textDark, size: 28.sp),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off, color: AppTheme.textDark.withOpacity(0.6), size: 24.sp),
                  onPressed: onToggle,
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}
