// lib/features/dashboard/presentation/profile_summary_screen.dart

import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bpls_mobile/features/dashboard/controller/dashboard_controller.dart';

class ProfileSummaryScreen extends GetView<DashboardController> {
  const ProfileSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Back Button
            Padding(
              padding: EdgeInsets.only(top: 56.h, left: 56.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_circle_left_outlined, 
                    size: 48.sp, 
                    color: AppTheme.listingButtonColor
                  ),
                  onPressed: () => controller.goBack(),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 166.w, vertical: 20.h),
                child: Column(
                  children: [
                    // --- Profile Detail Box ---
                    _buildProfileHeader(),
                    
                    SizedBox(height: 56.h),

                    // --- List of Detail Boxes ---
                    // ...controller.summaryData.map((item) => _buildDetailCard(item)),
                    
                    SizedBox(height: 100.h), // Bottom padding for scroll
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: 628.w,
      // Removed fixed height to allow for text scaling safety
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Pic
          Obx(() => Container(
            width: 188.w,
            height: 183.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.grey[300],
              image: controller.profileImage.value != null
                  ? DecorationImage(
                      image: FileImage(controller.profileImage.value!), 
                      fit: BoxFit.cover
                    )
                  : null,
            ),
            child: controller.profileImage.value == null 
                ? Icon(Icons.person, size: 80.sp, color: Colors.white) 
                : null,
          )),
          SizedBox(width: 36.w),
          // User Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _headerText('নামঃ ', controller.userName.value),
                _headerText('ই-মেইলঃ ', controller.userEmail.value),
                _headerText('ফোন / মোবাইলঃ ', controller.userPhone.value),
                _headerText('মৌজাঃ ', controller.userMouza.value),
                _headerText('GEO কোডঃ ', controller.userGeoCode.value),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerText(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: 'Noto Sans Bengali',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D1B20),
          ),
          children: [
            TextSpan(
              text: label, 
              style: TextStyle(color: AppTheme.listingButtonColor)
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

Widget _buildDetailCard(SummaryItem item) {
    return Container(
      width: 628.w,
      // Correct way to set minimum height in a Container
      constraints: BoxConstraints(
        minHeight: 100.h,
      ),
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A727D87), 
            offset: const Offset(0, 2), 
            blurRadius: 8.r
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.titleLeft, style: _cardTitleStyle()),
                Text(item.valueLeft, style: _cardValueStyle()),
              ],
            ),
          ),
          // Right Side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.titleRight, style: _cardTitleStyle()),
                Text(item.valueRight, style: _cardValueStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _cardTitleStyle() => TextStyle(
        fontFamily: 'Noto Sans Bengali',
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: AppTheme.listingButtonColor,
        height: 1.5,
      );

  TextStyle _cardValueStyle() => TextStyle(
        fontFamily: 'Noto Sans Bengali',
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1D1B20),
        height: 1.5,
      );
}