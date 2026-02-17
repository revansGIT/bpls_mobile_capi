// lib/features/listing_form/controller/institution_form_controller.dart

import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InstitutionFormController extends GetxController {
  final institutionName = TextEditingController();
  final headOfInstitution = TextEditingController();
  final totalManpower = TextEditingController();
  final mobileNumber = TextEditingController();
  final address = TextEditingController();

  final selectedInstitutionId = Rxn<int>();

  final List<String> institutionTypes = [
    "প্রাতিষ্ঠানিক খানা (এতিমখানা, হল, হাসপাতাল ইত্যাদি)", // 1
    "রেস্তোরা/রেস্টুরেন্ট", // 2
    "হোটেল/ফাস্টফুড", // 3
    "কমিউনিটি সেন্টার", // 4
    "সুপারশপ", // 5
    "স্থানীয় খুচরা দোকান", // 6
    "প্রাতিষ্ঠানিক কৃষি খামার", // 7
    "মধ্যস্বত্ব/ব্যাপারি", // 8
    "পাইকারি/আড়তদার", // 9
    "মিলার", // 10
    "প্রসেসিং ইউনিট", // 11
    "সংরক্ষণাগার/কোল্ড স্টোরেজ" // 12
  ];

  // Specific Labels for Types 1-4
  final List<String> type1Labels = ["এতিমখানা", "হল", "মেস", "হোস্টেল", "জেলখানা", "হাসপাতাল"];
  final List<String> type2Labels = ["রেস্তোরা (দৈনিক)", "রেস্টুরেন্ট (দৈনিক)"];
  final List<String> type3Labels = ["হোটেল (দৈনিক)", "ফাস্টফুড (দৈনিক)"];
  final List<String> type4Labels = ["কমিউনিটি সেন্টার (সাপ্তাহিক)"];

  final List<String> retailItems = ["ফল ও সবজি", "মাছ ও মাংশ", "খাদ্য শস্য", "দুদ্ধ্যজাত পণ্য", "বেকারি পণ্য", "প্রসেসড দ্রব্য"];
  
  final List<String> commonAgriItems = [
    "আমন ধান", "বোরো ধান", "আউস ধান", "মসুর ডাল", "পেঁয়াজ", "আম", "আলু", "সরিষা", "কার্প জাতীয় মাছ", "চিংড়ি", 
    "গরু (মাংস) (কমপক্ষে ০১ টি গরু থাকতে হবে)", 
    "পোল্ট্রি/মুরগী (কমপক্ষে ৫ টি মুরগী থাকতে হবে)"
  ];

  final selections = <int, RxBool>{}.obs;
  final input1Controllers = <int, TextEditingController>{};
  final input2Controllers = <int, TextEditingController>{};

  @override
  void onInit() {
    super.onInit();
    _initStorage();
  }

  void _initStorage() {
    for (int i = 0; i < 40; i++) {
      selections[i] = false.obs;
      input1Controllers[i] = TextEditingController();
      input2Controllers[i] = TextEditingController();
    }
  }

  void onInstitutionTypeChanged(int? id) {
    selectedInstitutionId.value = id;
    // Reset all states when type changes
    selections.forEach((k, v) => v.value = false);
    for (var controller in input1Controllers.values) {
      controller.clear();
    }
    for (var controller in input2Controllers.values) {
      controller.clear();
    }
  }

  // Validation Logic for Poultry (Index 11) and Cattle (Index 10)
  String? validateAgriInput(int index, String value) {
    if (value.isEmpty) return null;
    
    // Only validate numbers for specific agricultural indices
    if (selectedInstitutionId.value == 7) {
       int? count = int.tryParse(value);
       if (count == null) return "বৈধ সংখ্যা দিন";

       if (index == 10 && count < 1) return "কমপক্ষে ০১ টি গরু থাকতে হবে"; // সিরিয়াল ১১
       if (index == 11 && count < 5) return "কমপক্ষে ০৫ টি মুরগী থাকতে হবে"; // সিরিয়াল ১২
    }
    return null;
  }

  // 1. Improved SnackBar Helper
  void _showError(String message) {
    Get.snackbar(
      "ভুল", 
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade800,
      colorText: Colors.white,
      borderRadius: 8.r,
      margin: EdgeInsets.all(20.r),
    );
  }

  // 2. Validate Step 1 (General Info)
  void saveInstitutionGeneralInfo() {
    String name = institutionName.text.trim();
    String phone = mobileNumber.text.trim();
    String manpower = totalManpower.text.trim();

    if (name.isEmpty) {
      _showError("প্রতিষ্ঠানের নাম প্রদান করুন");
      return;
    }
    
    if (phone.isNotEmpty && !RegExp(r'^01[3-9]\d{8}$').hasMatch(phone)) {
      _showError("সঠিক মোবাইল নম্বর প্রদান করুন (১১ ডিজিট)");
      return;
    }

    if (manpower.isNotEmpty && int.tryParse(manpower) == null) {
      _showError("জনবল সংখ্যায় লিখুন");
      return;
    }

    Get.toNamed(AppRoutes.institutionDetailStep);
  }

  // 3. Final Submission Validation
  void submitInstitutionForm() {
    if (selectedInstitutionId.value == null) {
      _showError("প্রতিষ্ঠানের ধরণ নির্বাচন করুন");
      return;
    }

    int id = selectedInstitutionId.value!;
    List<String> items = _getCurrentItems(id);
    bool anySelected = false;

    for (int i = 0; i < items.length; i++) {
      if (selections[i]?.value ?? false) {
        anySelected = true;
        String val1 = input1Controllers[i]!.text.trim();
        
        // Mandatory quantity check
        if (val1.isEmpty) {
          _showError("${items[i]} এর পরিমাণ প্রদান করুন");
          return;
        }

        // Cattle/Poultry logic
        String? agriError = validateAgriInput(i, val1);
        if (agriError != null) {
          _showError("${items[i]}: $agriError");
          return;
        }
      }
    }

    if (!anySelected) {
      _showError("অন্তত একটি পণ্য বা খাত নির্বাচন করুন");
      return;
    }

    // Use offNamed to clear form from stack after success
    Get.offNamed(AppRoutes.listingConfirmation, arguments: {'type': 'institution'});
  }

  List<String> _getCurrentItems(int id) {
    if (id == 1) return type1Labels;
    if (id == 2) return type2Labels;
    if (id == 3) return type3Labels;
    if (id == 4) return type4Labels;
    if (id == 5 || id == 6) return retailItems;

    // For Miller (Type 10), only return the first 4 items as per requirement
    if (id == 10) {
      return commonAgriItems.sublist(0, 4); 
    }
    
    return commonAgriItems;
  }
}