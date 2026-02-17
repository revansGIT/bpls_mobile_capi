// lib/features/listing_form/controller/listing_form_start_controller.dart

import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:get/get.dart';

class ListingFormStartController extends GetxController {
  final selectedUnitType = ''.obs;

  // Add a clear method to reset state for a new form
  void clearForm() {
    selectedUnitType.value = '';
  }

  void selectUnit(String type) {


    selectedUnitType.value = type;
    if (type == 'household') {
      Get.toNamed(AppRoutes.householdFormStep1);
    } else {
      Get.toNamed(AppRoutes.institutionFormStep1);
    }
  }


}