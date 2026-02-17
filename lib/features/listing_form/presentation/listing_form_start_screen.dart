import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/listing_form_start_controller.dart';

class ListingFormStartScreen extends GetView<ListingFormStartController> {
  const ListingFormStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Padding(
                padding: EdgeInsets.only(top: 56.h, left: 56.w),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_circle_left_outlined, size: 48.sp, color: AppTheme.listingButtonColor),
                ),
              ),

              // Unit Selection Box
              Container(
                width: 848.w,
                margin: EdgeInsets.only(top: 60.h, left: 56.w),
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(color: const Color(0xFFF8EFFD), borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ইউনিটের ধরনঃ", style: AppTheme.listingLabelStyle.copyWith(fontSize: 28.sp)),
                    SizedBox(height: 8.h),
                    Text(
                      "নির্বাচন করুনঃ",
                      style: AppTheme.listingHintStyle.copyWith(color: const Color(0xFF1D1B20), fontSize: 20.sp),
                    ),
                    SizedBox(height: 32.h),

                    Row(
                      children: [
                        _buildTypeButton(
                          label: "খানা",
                          // Corrected: Now goes through validation logic
                          onTap: () => controller.selectUnit('household'),
                        ),
                        SizedBox(width: 32.w),
                        _buildTypeButton(label: "প্রতিষ্ঠান", onTap: () => controller.selectUnit('institution')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeButton({required String label, required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          height: 82.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppTheme.listingButtonColor, width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 22.sp, color: AppTheme.listingButtonColor),
          ),
        ),
      ),
    );
  }
}
