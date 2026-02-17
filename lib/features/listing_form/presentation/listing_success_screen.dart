import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListingSuccessScreen extends StatelessWidget {
  const ListingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 848.w,
        height: 550.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF8EFFD),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1A727D87),
              offset: const Offset(0, 8),
              blurRadius: 34.r,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Round Icon with Checkmark
            Container(
              width: 140.r,
              height: 140.r,
              decoration: BoxDecoration(
                color: AppTheme.listingButtonColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.check, color: Colors.white, size: 88.sp),
              ),
            ),
            SizedBox(height: 36.h),

            // Success Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                "ফর্ম জমা সম্পন্ন হয়েছে",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Noto Sans Bengali',
                  fontWeight: FontWeight.w600,
                  fontSize: 40.sp,
                  color: const Color(0xFF07200A),
                  height: 1.1,
                ),
              ),
            ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
