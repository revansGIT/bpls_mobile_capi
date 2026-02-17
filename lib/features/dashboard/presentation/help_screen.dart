// lib/features/dashboard/presentation/help_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FB), 
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                crossAxisCount: 2,
                mainAxisSpacing: 24.h,
                crossAxisSpacing: 24.w,
                childAspectRatio: 1.5, 
                children: [
                  _buildHelpCard(
                    "ডাটা ব্যালেন্স", 
                    "Data অবশিষ্ট রয়েছে ১১.২৭ GB এবং মেয়াদ শেষ হবে ০১/০১/২০৩৭, ০৬:০০:০০ তারিখে।"
                  ),
                  _buildHelpCard("ইন্টারনেট স্পিড", "১.২ K/s"),
                  _buildHelpCard("সুপারভাইসর নাম", "হাছিব রহমান"),
                  _buildHelpCard("সুপারভাইসর ফোন নম্বর", "+৮৮০ ১৭৫০-০০০০০০"),
                  _buildHelpCard("হোয়াইটসএপ নম্বর", "+৮৮০ ১৫৪০-০০০০০০"),
                  _buildHelpCard("কল সেন্টার নম্বর", "৭৮৬"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 40.w, top: 40.h, bottom: 20.h),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          Icons.arrow_circle_left_outlined,
          size: 48.sp,
          color: const Color(0xFF1B6B61), 
        ),
        onPressed: () => Get.back(), // Returns to dashboard
      ),
    );
  }

  Widget _buildHelpCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE9F2), 
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E1A63), // Heading color
              fontFamily: 'Noto Sans Bengali',
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xFF1D1B20), // Updated value text color
                fontFamily: 'Noto Sans Bengali',
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}