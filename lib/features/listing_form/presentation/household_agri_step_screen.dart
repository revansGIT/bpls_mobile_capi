// lib/features/listing_form/presentation/household_agri_step_screen.dart

import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/features/listing_form/controller/household_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HouseholdAgriStepScreen extends GetView<HouseholdFormController> {
  const HouseholdAgriStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 56.w),
                itemCount: controller.agriItems.length,
                itemBuilder: (context, index) => _buildAgriItemCard(index),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 56.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 56.h),
            child: IconButton(
              icon: Icon(Icons.arrow_circle_left_outlined, size: 48.sp, color: AppTheme.listingButtonColor),
              onPressed: () => Get.back(),
            ),
          ),
          SizedBox(height: 20.h),
          Text("উৎপাদন/মৎস্য চাষ/পশু-পাখি পালন", style: AppTheme.listingLabelStyle),
          SizedBox(height: 12.h),
          Text(
            "আপনি নিম্নোক্ত কোন ধরণের ও কি পরিমাণ ফসল উৎপাদন/মৎস্য চাষ/পশু-পাখি পালন করেন?\nবিগত ১ বছর?",
            style: AppTheme.listingHintStyle.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildAgriItemCard(int index) {
    return Obx(() {
      bool isSelected = controller.agriSelections[index]!.value;
      // Index 5(Mango), 10(Cow), 11(Poultry) are Integer only
      bool isIntegerOnly = (index == 5 || index == 10 || index == 11);

      return Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F2FA) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppTheme.listingButtonColor : AppTheme.listingBorderColor,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${index + 1}. ${controller.agriItems[index]}", 
                    style: TextStyle(
                      fontFamily: 'Noto Sans Bengali', 
                      fontSize: 18.sp, 
                      fontWeight: FontWeight.bold,
                      color: AppTheme.listingLabelColor
                    )
                  ),
                ),
                _radioOption("হ্যাঁ", true, index),
                _radioOption("না", false, index),
              ],
            ),
            if (isSelected) ...[
              SizedBox(height: 16.h),
              Text(
                controller.getAmountHint(index),
                style: TextStyle(
                  fontFamily: 'Noto Sans Bengali',
                  fontSize: 16.sp,
                  color: AppTheme.listingButtonColor,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.agriAmountControllers[index],
                keyboardType: TextInputType.numberWithOptions(decimal: !isIntegerOnly),
                inputFormatters: [
                  isIntegerOnly 
                    ? FilteringTextInputFormatter.digitsOnly 
                    : FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                ],
                style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 18.sp),
                decoration: InputDecoration(
                  hintText: isIntegerOnly ? "সংখ্যা লিখুন" : "শতক লিখুন",
                  hintStyle: AppTheme.listingHintStyle.copyWith(fontSize: 16.sp),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
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
            ]
          ],
        ),
      );
    });
  }

  Widget _radioOption(String label, bool value, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<bool>(
          value: value,
          groupValue: controller.agriSelections[index]!.value,
          onChanged: (val) => controller.toggleAgriSelection(index, val!),
          activeColor: AppTheme.listingButtonColor,
          visualDensity: VisualDensity.compact,
        ),
        Text(label, style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 17.sp, color: AppTheme.listingLabelColor)),
        SizedBox(width: 8.w),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 56.w),
      decoration: BoxDecoration(
        color: Colors.white, 
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -4))]
      ),
      child: Center(
        child: SizedBox(
          width: 627.w,
          height: 82.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.listingButtonColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
            onPressed: () => controller.submitHouseholdForm(),
            child: Text("লিস্টিং সম্পন্ন করুন", style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 22.sp, color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}