// lib/features/listing_form/presentation/institution_form_step1.dart

import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/features/listing_form/controller/institution_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InstitutionFormStep1 extends GetView<InstitutionFormController> {
  const InstitutionFormStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 56.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Go Back Button
              Padding(
                padding: EdgeInsets.only(top: 56.h),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.arrow_circle_left_outlined, 
                    size: 48.sp, 
                    color: AppTheme.listingButtonColor,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
              
              SizedBox(height: 20.h),
              
              Text(
                "অংশ: ২ লিস্টিং ফরম (প্রতিষ্ঠান)",
                style: AppTheme.listingLabelStyle,
              ),
              
              SizedBox(height: 40.h),
              
              // Fields Section
              _buildReadOnlyField("১. লিস্টিং নম্বরঃ", "১০৩"), 
              _buildInputField("২. প্রতিষ্ঠানের নামঃ", controller.institutionName, hint: "প্রতিষ্ঠানের নাম লিখুন"),
              _buildInputField("৩. প্রতিষ্ঠান প্রধানের নামঃ", controller.headOfInstitution, hint: "প্রধানের নাম লিখুন"),
              _buildInputField("৪. প্রতিষ্ঠানের জনবলের সংখ্যাঃ", controller.totalManpower, isNumber: true, hint: "সংখ্যা লিখুন"),
              _buildInputField("৫. মোবাইল নম্বরঃ", controller.mobileNumber, isNumber: true, hint: "০১XXXXXXXXX"),
              _buildInputField("৬. ঠিকানা (বাড়ির নাম, হোল্ডিং, রোড)ঃ", controller.address, maxLines: 2, hint: "বিস্তারিত ঠিকানা লিখুন"),
              
              SizedBox(height: 40.h),
              
              _buildNextButton(),
              
              SizedBox(height: 56.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTheme.listingLabelStyle.copyWith(fontSize: 20.sp)),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F0F4),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppTheme.listingBorderColor),
            ),
            child: Text(
              value, 
              style: TextStyle(
                fontFamily: 'Noto Sans Bengali', 
                fontSize: 18.sp, 
                color: AppTheme.listingLabelColor.withOpacity(0.7)
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController ctr, {bool isNumber = false, int maxLines = 1, String? hint}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTheme.listingLabelStyle.copyWith(fontSize: 20.sp)),
          SizedBox(height: 8.h),
          TextField(
            controller: ctr,
            maxLines: maxLines,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            inputFormatters: isNumber 
                ? [FilteringTextInputFormatter.digitsOnly] // Force numeric keyboard + block text
                : [],
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 18.sp),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTheme.listingHintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppTheme.listingBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppTheme.listingBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppTheme.listingButtonColor, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Center(
      child: SizedBox(
        width: 627.w,
        height: 82.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.listingButtonColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
          onPressed: () => controller.saveInstitutionGeneralInfo(),
          child: Text(
            "পরবর্তী ধাপ", 
            style: TextStyle(
              fontFamily: 'Noto Sans Bengali', 
              fontSize: 22.sp, 
              color: Colors.white,
              fontWeight: FontWeight.w600,
            )
          ),
        ),
      ),
    );
  }
}