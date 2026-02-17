// lib/features/listing_form/controller/household_form_controller.dart

import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class HouseholdFormController extends GetxController {
  final listingNo = '১০২'.obs;
  final headOfHousehold = TextEditingController();
  final fatherOrHusbandName = TextEditingController();
  final totalMembers = TextEditingController();
  final dailyCookingFor = TextEditingController();
  final mobileNumber = TextEditingController();
  final address = TextEditingController();

  // 1 = সাধারণ খানা, 2 = অন্যান্য খানা (মেস)
  final selectedHouseholdType = 1.obs;

  final List<String> agriItems = [
    "আমন ধান", 
    "বোরো ধান", 
    "আউস ধান", 
    "মসুর ডাল", 
    "পেঁয়াজ", 
    "আম", 
    "আলু", 
    "সরিষা", 
    "কার্প জাতীয় মাছ (রুই,কাতল, মৃগেল,কালাবাউশ,অন্যান্য কার্প)", 
    "চিংড়ি", 
    "গরু", 
    "মুরগী (পোল্ট্রি,ব্রয়লারসহ সব ধরণের)"
  ];

  final agriSelections = <int, RxBool>{}.obs;
  final agriAmountControllers = <int, TextEditingController>{};

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < agriItems.length; i++) {
      agriSelections[i] = false.obs;
      agriAmountControllers[i] = TextEditingController();
    }
  }

  void setHouseholdType(int value) {
    selectedHouseholdType.value = value;
  }

  String getAmountHint(int index) {
    switch (index) {
      case 0: case 1: case 2: case 3: case 4: case 6: case 7:
        return "আবাদকৃত জমির পরিমাণ (শতক)";
      case 5:
        return "গাছের সংখ্যা";
      case 8: case 9:
        return "অধীন জমির/ঘেড়ের পরিমাণ (শতক)";
      case 10:
        return "গরুর সংখ্যা";
      case 11:
        return "মুরগীর সংখ্যা";
      default:
        return "পরিমাণ প্রদান করুন";
    }
  }

  bool _isValidBengaliMobile(String input) {
    return RegExp(r'^01[3-9]\d{8}$').hasMatch(input);
  }

  void saveHouseholdGeneralInfo() {
    if (headOfHousehold.text.trim().isEmpty || 
        mobileNumber.text.trim().isEmpty || 
        totalMembers.text.trim().isEmpty) {
      _showErrorSnackBar("সবগুলো প্রয়োজনীয় ঘর পূরণ করুন");
      return;
    }

    if (!_isValidBengaliMobile(mobileNumber.text.trim())) {
      _showErrorSnackBar("সঠিক মোবাইল নম্বর প্রদান করুন (১১ ডিজিট)");
      return;
    }

    if (int.tryParse(totalMembers.text.trim()) == null) {
      _showErrorSnackBar("সদস্য সংখ্যা অবশ্যই সঠিক নম্বর হতে হবে");
      return;
    }

    Get.toNamed(AppRoutes.householdAgriStep); 
  }

  void toggleAgriSelection(int index, bool value) {
    agriSelections[index]!.value = value;
    if (!value) agriAmountControllers[index]!.clear();
  }

  void submitHouseholdForm() {
    List<Map<String, dynamic>> collectedAgri = [];

    for (int i = 0; i < agriItems.length; i++) {
      if (agriSelections[i]!.value) {
        String val = agriAmountControllers[i]!.text.trim();
        
        if (val.isEmpty) {
          _showErrorSnackBar("${agriItems[i]}-এর পরিমাণ প্রদান করুন");
          return;
        }

        // Strict Validation: Integer for trees/animals, Double for land
        bool isCountType = (i == 5 || i == 10 || i == 11);
        if (isCountType) {
          if (int.tryParse(val) == null) {
            _showErrorSnackBar("${agriItems[i]}-এর জন্য সঠিক সংখ্যা লিখুন");
            return;
          }
        } else {
          if (double.tryParse(val) == null) {
            _showErrorSnackBar("${agriItems[i]}-এর জন্য সঠিক শতক লিখুন");
            return;
          }
        }

        collectedAgri.add({
          "item": agriItems[i],
          "amount": val,
          "type": getAmountHint(i)
        });
      }
    }

    // final newEntry = ListingEntryModel(
    //   id: '',
    //   unitType: 'খানা',
    //   listingNo: listingNo.value,
    //   generalInfo: {
    //     "household_type": selectedHouseholdType.value == 1 ? "সাধারণ" : "মেস/অন্যান্য",
    //     "head_name": headOfHousehold.text,
    //     "father_husband": fatherOrHusbandName.text,
    //     "members": totalMembers.text,
    //     "cooking_for": dailyCookingFor.text,
    //     "mobile": mobileNumber.text,
    //     "address": address.text,
    //   },
    //   agriData: collectedAgri,
    // );

    // LocalDatabase.addEntry(newEntry); // Assuming this is defined
    Get.offNamed(AppRoutes.listingConfirmation, arguments: {'type': 'household'});
  }

  void _showErrorSnackBar(String message) {
    Get.snackbar(
      "ভুল", 
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade800,
      colorText: Colors.white,
      margin: EdgeInsets.all(20.r),
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void onClose() {
    headOfHousehold.dispose();
    fatherOrHusbandName.dispose();
    totalMembers.dispose();
    dailyCookingFor.dispose();
    mobileNumber.dispose();
    address.dispose();
    agriAmountControllers.forEach((k, v) => v.dispose());
    super.onClose();
  }
}