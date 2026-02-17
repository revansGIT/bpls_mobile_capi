// lib/features/listing_form/presentation/institution_detail_step_screen.dart

import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/features/listing_form/controller/institution_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InstitutionDetailStepScreen extends GetView<InstitutionFormController> {
  const InstitutionDetailStepScreen({super.key});

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
              _buildHeader(),
              SizedBox(height: 40.h),

              Text(
                "প্রতিষ্ঠানের ধরণ নির্বাচন করুন",
                style: AppTheme.listingLabelStyle,
              ),
              SizedBox(height: 12.h),

              Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppTheme.listingBorderColor),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      hint: Text(
                        "ধরণ নির্বাচন করুন",
                        style: AppTheme.listingHintStyle,
                      ),
                      value: controller.selectedInstitutionId.value,
                      items: List.generate(controller.institutionTypes.length, (
                        index,
                      ) {
                        return DropdownMenuItem(
                          value: index + 1,
                          child: Text(
                            "${index + 1}. ${controller.institutionTypes[index]}",
                            style: TextStyle(
                              fontFamily: 'Noto Sans Bengali',
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      }),
                      onChanged: (val) =>
                          controller.onInstitutionTypeChanged(val),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),
              Obx(() => _buildDynamicFields()),
              SizedBox(height: 60.h),

              _buildSubmitButton(),
              SizedBox(height: 56.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDynamicFields() {
    int id = controller.selectedInstitutionId.value ?? 0;
    if (id == 0) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Text(
            "দয়া করে প্রতিষ্ঠানের ধরণ নির্বাচন করুন",
            style: AppTheme.listingHintStyle,
          ),
        ),
      );
    }

    if (id <= 6) {
      List<String> items = [];
      String label = "";
      if (id == 1) {
        items = controller.type1Labels;
        label = "প্রতিদিন কতোজনের জন্য রান্না হয়?";
      } else if (id == 2) {
        items = controller.type2Labels;
        label = "গড় কাস্টমার সংখ্যা (দৈনিক)ঃ";
      } else if (id == 3) {
        items = controller.type3Labels;
        label = "গড় কাস্টমার সংখ্যা (দৈনিক)ঃ";
      } else if (id == 4) {
        items = controller.type4Labels;
        label = "গড় কাস্টমার সংখ্যা (সাপ্তাহিক)ঃ";
      } else {
        items = controller.retailItems;
        label = "(দৈনিক) বিক্রির পরিমান (কেজি)";
      }

      return _buildComplexTable(items, label);
    } else {
      // Logic for Type 7 and others (Agri/Livestock/Fish)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "পণ্য ও পরিমাণের তালিকাঃ",
            style: AppTheme.listingLabelStyle.copyWith(fontSize: 22.sp),
          ),
          SizedBox(height: 16.h),
          ...List.generate(controller.commonAgriItems.length, (index) {
            return Obx(() {
              bool isYes = controller.selections[index]!.value;

              // 1. Label Logic for Type 7 (Institutional Agri Farm)
              String inputLabel = "আবাদকৃত জমির পরিমাণ (শতক)";
              if (id == 7) {
                if (index == 5) {
                  inputLabel = "গাছের সংখ্যা"; // সিরিয়াল ৬: আম
                } else if (index == 8)
                  inputLabel = "অধীন জমির পরিমাণ"; // সিরিয়াল ৯: কার্প মাছ
                else if (index == 9)
                  inputLabel = "অধীন জমির/ঘেরের পরিমাণ"; // সিরিয়াল ১০: চিংড়ি
                else if (index == 10)
                  inputLabel = "গরুর সংখ্যা"; // সিরিয়াল ১১: গরু
                else if (index == 11)
                  inputLabel = "মুরগীর সংখ্যা"; // সিরিয়াল ১২: মুরগী
              }
              // 2. Label Logic for Type 10 (Miller)
              else if (id == 10) {
                inputLabel = "মিলিং করা ফসলের পরিমাণ";
              }
              // 3. Default Labels for other types
              else {
                if (id == 8 || id == 9) inputLabel = "ক্রয়ের পরিমাণ";
                if (id == 12) inputLabel = "সংরক্ষণ পরিমাণ";
                if (id == 11) inputLabel = "প্রসেস পরিমাণ";
              }

              String? label2;
              if (id == 8 || id == 9) label2 = "বিক্রয়ের পরিমাণ";
              if (id == 11) label2 = "প্রস্তুতকৃত খাবারের নাম";

              return Card(
                elevation: 0,
                margin: EdgeInsets.only(bottom: 16.h),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: isYes
                        ? AppTheme.listingButtonColor
                        : AppTheme.listingBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${index + 1}. ${controller.commonAgriItems[index]}",
                              style: TextStyle(
                                fontFamily: 'Noto Sans Bengali',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              _radioOption("হ্যাঁ", true, index),
                              _radioOption("না", false, index),
                            ],
                          ),
                        ],
                      ),
                      if (isYes) ...[
                        const Divider(),
                        _buildTableInput(
                          inputLabel,
                          controller.input1Controllers[index]!,
                          // Ensure numeric keyboard for quantities, text for food names
                          isNumber: (id == 11 && label2 != null) ? false : true,
                          errorText: controller.validateAgriInput(
                            index,
                            controller.input1Controllers[index]!.text,
                          ),
                        ),
                        if (label2 != null) ...[
                          SizedBox(height: 16.h),
                          _buildTableInput(
                            label2,
                            controller.input2Controllers[index]!,
                            isNumber: id != 11,
                          ),
                        ],
                      ],
                    ],
                  ),
                ),
              );
            });
          }),
        ],
      );
    }
  }

  Widget _buildComplexTable(List<String> items, String firstLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "পণ্য ও পরিমাণের তালিকাঃ",
          style: AppTheme.listingLabelStyle.copyWith(fontSize: 22.sp),
        ),
        SizedBox(height: 16.h),
        ...List.generate(items.length, (index) {
          return Obx(() {
            bool isSelected = controller.selections[index]!.value;
            return Card(
              elevation: 0,
              margin: EdgeInsets.only(bottom: 16.h),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected
                      ? AppTheme.listingButtonColor
                      : AppTheme.listingBorderColor,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${index + 1}. ${items[index]}",
                            style: TextStyle(
                              fontFamily: 'Noto Sans Bengali',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Checkbox(
                          activeColor: AppTheme.listingButtonColor,
                          value: isSelected,
                          onChanged: (val) =>
                              controller.selections[index]!.value = val!,
                        ),
                      ],
                    ),
                    if (isSelected) ...[
                      const Divider(),
                      _buildTableInput(
                        firstLabel,
                        controller.input1Controllers[index]!,
                      ),
                    ],
                  ],
                ),
              ),
            );
          });
        }),
      ],
    );
  }

  Widget _radioOption(String label, bool value, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<bool>(
          value: value,
          activeColor: AppTheme.listingButtonColor,
          groupValue: controller.selections[index]!.value,
          onChanged: (val) => controller.selections[index]!.value = val!,
        ),
        Text(
          label,
          style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 16.sp),
        ),
      ],
    );
  }

  Widget _buildTableInput(
    String label,
    TextEditingController ctr, {
    bool isNumber = true,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.listingLabelStyle.copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: ctr,
          onChanged: (_) => controller.update(),
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          style: TextStyle(fontSize: 18.sp),
          decoration: InputDecoration(
            hintText: "এখানে উত্তর লিখুন",
            hintStyle: AppTheme.listingHintStyle,
            errorText: errorText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppTheme.listingBorderColor),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Text("বিস্তারিত তথ্য", style: AppTheme.listingLabelStyle),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: SizedBox(
        width: 627.w,
        height: 82.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.listingButtonColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: () => controller.submitInstitutionForm(),
          child: Text(
            "সংরক্ষণ করুন",
            style: TextStyle(
              fontFamily: 'Noto Sans Bengali',
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
