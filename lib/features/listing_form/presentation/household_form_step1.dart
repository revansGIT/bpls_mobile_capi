// lib/features/listing_form/presentation/household_form_step1.dart

import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/features/listing_form/controller/household_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HouseholdFormStep1 extends GetView<HouseholdFormController> {
  const HouseholdFormStep1({super.key});

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
                "অংশ: ১ লিস্টিং ফরম (খানা)",
                style: AppTheme.listingLabelStyle,
              ),

              SizedBox(height: 40.h),

              // 1. লিস্টিং খানা নম্বর (Read Only)
              Obx(() => _buildReadOnlyField(
                    "১. লিস্টিং খানা নম্বরঃ",
                    controller.listingNo.value,
                  )),

              // 2. এটি কোন ধরণের খানা (New Radio Group)
              _buildHouseholdTypeRadio(),

              // 3. খানাপ্রধানের নাম
              _buildInputField(
                "৩. খানাপ্রধানের নামঃ",
                controller.headOfHousehold,
                hint: "নাম লিখুন",
              ),

              // 4. খানাপ্রধানের পিতা/স্বামীর নাম
              _buildInputField(
                "৪. খানাপ্রধানের পিতা/স্বামীর নামঃ",
                controller.fatherOrHusbandName,
                hint: "পিতা/স্বামীর নাম লিখুন",
              ),

              // 5. খানার সদস্য সংখ্যা
              _buildInputField(
                "৫. খানার সদস্য সংখ্যা",
                controller.totalMembers,
                isNumber: true,
                hint: "সংখ্যা লিখুন",
              ),

              // 6. প্রতিদিন কতোজনের জন্য রান্না হয়
              _buildInputField(
                "৬. প্রতিদিন কতোজনের জন্য রান্না হয় (অপচয় এর নমুনা) ঃ",
                controller.dailyCookingFor,
                isNumber: true,
                hint: "সংখ্যা লিখুন",
              ),

              // 7. মোবাইল নম্বর
              _buildInputField(
                "৭. মোবাইল নম্বরঃ",
                controller.mobileNumber,
                isNumber: true,
                hint: "০১XXXXXXXXX",
              ),

              // 8. ঠিকানা
              _buildInputField(
                "৮. ঠিকানা (বাড়ির নাম, হোল্ডিং, রোড) ঃ",
                controller.address,
                maxLines: 3,
                hint: "বিস্তারিত ঠিকানা লিখুন",
              ),

              SizedBox(height: 40.h),

              _buildNextButton(),

              SizedBox(height: 56.h),
            ],
          ),
        ),
      ),
    );
  }

  /// New Radio Group for Household Type
  Widget _buildHouseholdTypeRadio() {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "২. এটি কোন ধরণের খানাঃ",
            style: AppTheme.listingLabelStyle.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 12.h),
          Obx(() => Row(
                children: [
                  _customRadioButton(1, "সাধারণ খানা"),
                  SizedBox(width: 48.w),
                  _customRadioButton(2, "অন্যান্য খানা (মেস)"),
                ],
              )),
        ],
      ),
    );
  }

  /// Custom Styled Radio Button matching AppTheme
  Widget _customRadioButton(int value, String label) {
    bool isSelected = controller.selectedHouseholdType.value == value;

    return GestureDetector(
      onTap: () => controller.setHouseholdType(value),
      child: Row(
        children: [
          Container(
            height: 28.r,
            width: 28.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.listingButtonColor,
                width: 2.w,
              ),
            ),
            child: Center(
              child: isSelected
                  ? Container(
                      height: 14.r,
                      width: 14.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.listingButtonColor,
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Noto Sans Bengali',
              fontSize: 18.sp,
              color: const Color(0xFF1D1B20),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: AppTheme.listingLabelStyle.copyWith(fontSize: 20.sp)),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F0F4),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppTheme.listingBorderColor),
            ),
            child: Text(value,
                style: TextStyle(
                  fontFamily: 'Noto Sans Bengali',
                  fontSize: 18.sp,
                  color: AppTheme.listingLabelColor.withOpacity(0.7),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController ctr,
      {bool isNumber = false, int maxLines = 1, String? hint}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: AppTheme.listingLabelStyle.copyWith(fontSize: 20.sp)),
          SizedBox(height: 8.h),
          TextField(
            controller: ctr,
            maxLines: maxLines,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            inputFormatters: isNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 18.sp),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTheme.listingHintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: AppTheme.listingBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: AppTheme.listingBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                    color: AppTheme.listingButtonColor, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
          ),
          onPressed: () => controller.saveHouseholdGeneralInfo(),
          child: Text("পরবর্তী ধাপ",
              style: TextStyle(
                fontFamily: 'Noto Sans Bengali',
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
        ),
      ),
    );
  }
}