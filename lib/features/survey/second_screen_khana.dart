import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:bpls_mobile/widget/radio_widget.dart';
import 'package:bpls_mobile/widget/searchable_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SecondScreenKhana extends StatefulWidget {
  const SecondScreenKhana({super.key});

  @override
  State<SecondScreenKhana> createState() => _SecondScreenKhanaState();
}

class _SecondScreenKhanaState extends State<SecondScreenKhana> {
  int rebuildTrigger = 0;
  ScrollController scrollController = ScrollController();
  List<GlobalKey> fieldKeys = List.generate(5, (_) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context);

    return Scaffold(
      appBar: AppBar(leading: backButton, title: Text(surveyProvider.unitSelect == 1 ? "খানা" : "প্রতিষ্ঠান")),
      body: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 24.h),
        children: [
          buildReadOnlyField("১. খানা নম্বরঃ", surveyProvider.getSLNumber(providerSaveData.dashboardCount!.totalCount+1)),
          Container(
            key: fieldKeys[0],
            child: BuildInputFieldWidget(
              "২. খানা প্রধানের নামঃ *",

              surveyProvider.khanaHeadNameController,
              hint: "খানা প্রধানের নাম লিখুন",
              currentFocus: surveyProvider.khanaHeadNameFocusNode,
              nextFocus: surveyProvider.khanaHeadFatherFocusNode,
              isMandatory: true,
              mandatoryMessage: "খানা প্রধানের নাম প্রয়োজন",
            ),
          ),
          Container(
            key: fieldKeys[1],
            child: BuildInputFieldWidget(
              "৩. খানা প্রধানের পিতা/স্বামীর নামঃ *",
              surveyProvider.khanaHeadFatherController,
              hint: "পিতা/স্বামীর নাম লিখুন",
              currentFocus: surveyProvider.khanaHeadFatherFocusNode,
              nextFocus: surveyProvider.khanaHeadHoldingFocusNode,
              isMandatory: true,
              mandatoryMessage: "খানা প্রধানের পিতা/স্বামীর নাম প্রয়োজন",
            ),
          ),
          Container(
            key: fieldKeys[2],
            child: BuildInputFieldWidget(
              "৪. খানার ঠিকানা হোল্ডিং নম্বরসহঃ *",
              surveyProvider.khanaHeadHoldingNumber,
              hint: "হোল্ডিং নম্বরসহ ঠিকানা লিখুন",
              isNumber: false,
              currentFocus: surveyProvider.khanaHeadHoldingFocusNode,
              nextFocus: surveyProvider.khanaHeadMobileFocusNode,
              isMandatory: true,
              mandatoryMessage: "খানার ঠিকানা প্রয়োজন",
            ),
          ),
          Container(
            key: fieldKeys[3],
            child: BuildInputFieldWidget(
              "৫. খানায় যোগাযোগের মোবাইল নম্বরঃ *",
              surveyProvider.khanaHeadMobileNumber,
              hint: "01xxxxxxxxx",
              isNumber: true,
              maxLength: 11,
              currentFocus: surveyProvider.khanaHeadMobileFocusNode,
              isMandatory: true,
              mandatoryMessage: "মোবাইল নম্বর প্রয়োজন",
            ),
          ),
          labelText('৬. খানার সাধারণ তথ্যঃ', isMandatory: true),
          SizedBox(height: 24.h),
          Container(
            key: fieldKeys[4],
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F0F4),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppTheme.listingBorderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelText('৬.১ খানার বাসগৃহের ধরনঃ', isMandatory: true),
                spaceHeight5,
                DynamicRadioList(
                  items: houseTypeList,
                  value: surveyProvider.selectedHouseType,
                  runSpacing: -20.h,
                  onValueChanged: (value) {
                    hideKeyboard();
                    if (value != null) {
                      surveyProvider.changeBasicInformationType(1, val: value);
                    }
                  },
                  labelBuilder: (item) => item.description,
                  othersController: surveyProvider.otherHouseTypeController,
                  onOthersTextChanged: (String value) {
                    surveyProvider.changeOtherTypeSection2(0, value);
                  },
                  othersTextValue: surveyProvider.otherHouseType,
                ),
                spaceHeight10,
                labelText('৬.২ রান্নাঘর/পাকঘরের অবস্থা:', isMandatory: true),
                spaceHeight5,
                DynamicRadioList(
                  items: kitchenTypeList,
                  value: surveyProvider.selectedKitchenType,
                  runSpacing: -20.h,
                  onValueChanged: (value) {
                    hideKeyboard();
                    if (value != null) {
                      surveyProvider.changeBasicInformationType(2, val: value);
                    }
                  },
                  labelBuilder: (item) => item.description,
                  isOthersItem: (item) => item.id == '96',
                  othersHint: 'অন্যান্য রান্নাঘর/পাকঘরের অবস্থা লিখুন',
                  othersController: surveyProvider.otherKitchenTypeController,
                  onOthersTextChanged: (String value) {
                    surveyProvider.changeOtherTypeSection2(1, value);
                  },
                  othersTextValue: surveyProvider.otherKitchenType,
                ),
                spaceHeight10,
                labelText('৬.৩ রান্নার জ্বালানির প্রধান উৎস:', isMandatory: true),
                spaceHeight5,
                DynamicRadioList(
                  items: cookingFuelList,
                  value: surveyProvider.selectedKookingFuelType,
                  runSpacing: -20.h,
                  onValueChanged: (value) {
                    if (value != null) {
                      hideKeyboard();
                      surveyProvider.changeBasicInformationType(3, val: value);
                    }
                  },
                  labelBuilder: (item) => item.description,
                  isOthersItem: (item) => item.id == '96',
                  othersHint: 'অন্যান্য রান্নার জ্বালানির প্রধান উৎস লিখুন',
                  othersController: surveyProvider.otherKookingFuelTypeController,
                  onOthersTextChanged: (String value) {
                    surveyProvider.changeOtherTypeSection2(2, value);
                  },
                  othersTextValue: surveyProvider.otherKookingFuelType,
                ),
                spaceHeight10,
                labelText('৬.৪ খানায় বিদ্যুৎ সুবিধার প্রধান উৎস:', isMandatory: true),
                spaceHeight5,
                DynamicRadioList(
                  items: electricitySourceList,
                  value: surveyProvider.selectedElectricitySourceType,
                  runSpacing: -20.h,
                  onValueChanged: (value) {
                    hideKeyboard();
                    if (value != null) {
                      surveyProvider.changeBasicInformationType(4, val: value);
                    }
                  },
                  labelBuilder: (item) => item.description,
                  isOthersItem: (item) => item.id == '96',
                  othersHint: 'অন্যান্য বিদ্যুৎ সুবিধার প্রধান উৎস লিখুন',
                  othersController: surveyProvider.otherElectricitySourceTypeController,
                  onOthersTextChanged: (String value) {
                    surveyProvider.changeOtherTypeSection2(3, value);
                  },
                  othersTextValue: surveyProvider.otherElectricitySourceType,
                ),
                spaceHeight10,
                labelText('৬.৫ খাবার পানির প্রধান উৎস:', isMandatory: true),
                spaceHeight5,
                DynamicRadioList(
                  items: drinkingWaterSourceList,
                  value: surveyProvider.selectedDrinkingWaterType,
                  runSpacing: -20.h,
                  onValueChanged: (value) {
                    hideKeyboard();
                    if (value != null) {
                      surveyProvider.changeBasicInformationType(5, val: value);
                    }
                  },
                  labelBuilder: (item) => item.description,
                  isOthersItem: (item) => item.id == '96',
                  othersHint: 'অন্যান্য খাবার পানির প্রধান উৎস লিখুন',
                  othersController: surveyProvider.otherDrinkingWaterTypeController,
                  onOthersTextChanged: (String value) {
                    surveyProvider.changeOtherTypeSection2(4, value);
                  },
                  othersTextValue: surveyProvider.otherDrinkingWaterType,
                ),
                spaceHeight10,
                labelText('৬.৬ টয়লেট সুবিধা:', isMandatory: true),
                spaceHeight5,
                DynamicRadioList(
                  items: toiletFacilityList,
                  value: surveyProvider.selectedToiletType,
                  runSpacing: -20.h,
                  onValueChanged: (value) {
                    hideKeyboard();
                    if (value != null) {
                      surveyProvider.changeBasicInformationType(6, val: value);
                    }
                  },
                  labelBuilder: (item) => item.description,
                  isOthersItem: (item) => item.id == '96',
                  othersController: surveyProvider.otherToiletTypeController,
                  othersHint: 'অন্যান্য টয়লেট সুবিধা লিখুন',
                  onOthersTextChanged: (String value) {
                    surveyProvider.changeOtherTypeSection2(5, value);
                  },
                  othersTextValue: surveyProvider.otherToiletType,
                ),
              ],
            ),
          ),
          spaceHeight20,
          surveyProvider.selectedConductTypes.isEmpty
              ? spaceZero
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNextButton(
                    () {
                  surveyProvider.saveTempData();
                  surveyProvider.saveFormData(
                    providerSaveData,
                        (bool status) async {
                      if (status == true) {
                        showToastMessage('আংশিক সংরক্ষণ সম্পন্ন হয়েছে');
                        Get.offAllNamed(AppRoutes.dashboard);
                      }
                    },
                    false,
                  );
                },
                title: 'আংশিক সংরক্ষণ করুন',
                btnColor: Colors.red,
              ),
              buildNextButton(() {
                if (validate()) {
                  Get.toNamed(AppRoutes.secondScreenKhanaPartTwo);
                }
              }),
            ],
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  bool validate() {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    if (surveyProvider.khanaHeadNameController.text.trim().isEmpty) {
      _showErrorAndScroll('খানা প্রধানের নাম প্রয়োজন', 0, surveyProvider.khanaHeadNameFocusNode);
      return false;
    }
    if (surveyProvider.khanaHeadFatherController.text.trim().isEmpty) {
      _showErrorAndScroll('খানা প্রধানের পিতা/স্বামীর নাম প্রয়োজন', 1, surveyProvider.khanaHeadFatherFocusNode);
      return false;
    }
    if (surveyProvider.khanaHeadHoldingNumber.text.trim().isEmpty) {
      _showErrorAndScroll('খানার ঠিকানা প্রয়োজন', 2, surveyProvider.khanaHeadHoldingFocusNode);
      return false;
    }
    String mobile = surveyProvider.khanaHeadMobileNumber.text.trim();
    if (mobile.isEmpty || mobile.length != 11 || !mobile.startsWith('01')) {
      _showErrorAndScroll('সঠিক মোবাইল নম্বর প্রয়োজন (01 দিয়ে শুরু 11 ডিজিট)', 3, surveyProvider.khanaHeadMobileFocusNode);
      return false;
    }
    if (surveyProvider.selectedHouseType == null) {
      _showErrorAndScroll('খানার বাসগৃহের ধরন নির্বাচন করুন', 4, null);
      return false;
    }
    if (surveyProvider.selectedKitchenType == null) {
      _showErrorAndScroll('রান্নাঘর/পাকঘরের অবস্থা নির্বাচন করুন', 4, null);
      return false;
    }
    if (surveyProvider.selectedKitchenType!.id == '96' && surveyProvider.otherKitchenType.trim().isEmpty) {
      _showErrorAndScroll('রান্নাঘরের অবস্থা অন্যান্য বিবরণ প্রয়োজন', 4, null);
      return false;
    }
    if (surveyProvider.selectedKookingFuelType == null) {
      _showErrorAndScroll('রান্নার জ্বালানির প্রধান উৎস নির্বাচন করুন', 4, null);
      return false;
    }
    if (surveyProvider.selectedKookingFuelType!.id == '96' && surveyProvider.otherKookingFuelType.trim().isEmpty) {
      _showErrorAndScroll('রান্নার জ্বালানি অন্যান্য বিবরণ প্রয়োজন', 4, null);
      return false;
    }
    if (surveyProvider.selectedElectricitySourceType == null) {
      _showErrorAndScroll('বিদ্যুৎ সুবিধার প্রধান উৎস নির্বাচন করুন', 4, null);
      return false;
    }
    if (surveyProvider.selectedElectricitySourceType!.id == '96' && surveyProvider.otherElectricitySourceType.trim().isEmpty) {
      _showErrorAndScroll('বিদ্যুৎ সুবিধা অন্যান্য বিবরণ প্রয়োজন', 4, null);
      return false;
    }
    if (surveyProvider.selectedDrinkingWaterType == null) {
      _showErrorAndScroll('খাবার পানির প্রধান উৎস নির্বাচন করুন', 4, null);
      return false;
    }
    if (surveyProvider.selectedDrinkingWaterType!.id == '96' && surveyProvider.otherDrinkingWaterType.trim().isEmpty) {
      _showErrorAndScroll('খাবার পানি অন্যান্য বিবরণ প্রয়োজন', 4, null);
      return false;
    }
    if (surveyProvider.selectedToiletType == null) {
      _showErrorAndScroll('টয়লেট সুবিধা নির্বাচন করুন', 4, null);
      return false;
    }
    if (surveyProvider.selectedToiletType!.id == '96' && surveyProvider.otherToiletType.trim().isEmpty) {
      _showErrorAndScroll('টয়লেট সুবিধা অন্যান্য বিবরণ প্রয়োজন', 4, null);
      return false;
    }
    return true;
  }

  void _showErrorAndScroll(String message, int index, FocusNode? focusNode) {
    // Approximate scroll offsets based on estimated heights
    Get.snackbar('ত্রুটি', message, backgroundColor: Colors.red, colorText: Colors.white);
    double offset = 0;
    if (index == 0) {
      offset = 50;
    } else if (index == 1)
      offset = 150;
    else if (index == 2)
      offset = 250;
    else if (index == 3)
      offset = 350;
    else if (index == 4)
      offset = 450;
    scrollController.animateTo(offset, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    focusNode?.requestFocus();

    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text('Error'),
    //     content: Text(message),
    //     actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK'))],
    //   ),
    // );
  }

  SearchablePicker<OtherStaticModel> generalInformationPicker(
      SurveyProvider surveyProvider,
      OtherStaticModel? selectedValue,
      List<OtherStaticModel> itemList,
      int type,
      String label,
      String hint, {
        bool isEditTextEnable = true,
        String searchQuery = '96',
        double inlineMaxHeight = 230,
      }) {
    return SearchablePicker<OtherStaticModel>(
      label: label,
      items: itemList,
      value: selectedValue,
      hint: hint,
      inlineMaxHeight: inlineMaxHeight,
      searchable: false,
      leftPadding: 0,
      rightPadding: 0,
      fontSize: 20.sp,
      itemAsString: (s) => s.description,
      onClear: () {
        surveyProvider.changeBasicInformationType(type, val: null);
      },
      onChanged: (OtherStaticModel? v) {
        surveyProvider.changeBasicInformationType(type, val: v!);
      },
      onCustomTextChanged: (String v) {
        final customItem = OtherStaticModel(id: searchQuery, description: v);
        surveyProvider.changeBasicInformationType(type, val: customItem);
      },
      shouldShowCustomField: isEditTextEnable == false ? null : (item) => item.id == searchQuery,
    );
  }

  SearchablePicker<OtherStaticModel> generalInformationPicker2(
      SurveyProvider surveyProvider,
      OtherStaticModel? selectedValue,
      List<OtherStaticModel> itemList,
      String label,
      ValueChanged<OtherStaticModel?> onChanged,
      String hint, {
        bool isEditTextEnable = true,
        String searchQuery = '96',
        double inlineMaxHeight = 230,
        double topPadding = 0,
      }) {
    return SearchablePicker<OtherStaticModel>(
      label: label,
      items: itemList,
      value: selectedValue,
      hint: hint,
      inlineMaxHeight: inlineMaxHeight,
      searchable: false,
      leftPadding: 0,
      rightPadding: 0,
      topPadding: topPadding,
      fontSize: 12,
      itemAsString: (s) => s.description,
      onChanged: onChanged,
      onCustomTextChanged: (String v) {
        final customItem = OtherStaticModel(id: searchQuery, description: v);
        onChanged(customItem);
      },
      shouldShowCustomField: isEditTextEnable == false ? null : (item) => item.id == searchQuery,
    );
  }

  Widget generator(int index, SurveyProvider surveyProvider) {
    final member = surveyProvider.khanaMemberList[index];
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppTheme.listingBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'খানা সদস্যের লাইন নং ${index + 1}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, backgroundColor: Colors.yellow.withValues(alpha: 0.2)),
          ),
          SizedBox(height: 20.h),
          BuildInputFieldWidget(
            "সদস্যদের নাম",
            member.nameController,
            key: ValueKey('member_name_$index'),
            nextFocus: member.ageFocusNode,
            currentFocus: member.nameFocusNode,
            onChanged: (v) {
              member.memberName = v;
              surveyProvider.updateKhanaMember(index, member);
              surveyProvider.updatedData();
            },
            isShowColumnData: false,
            hint: "সদস্যের নাম লিখুন",
            leftExpandedValue: 2,
            rightExpandedValue: 3,
          ),

          BuildInputFieldWidget(
            "বয়স (পূর্ণ বছরে)",
            member.ageController,
            currentFocus: member.ageFocusNode,
            nextFocus: null,
            onChanged: (v) {
              member.memberAge = v;
              surveyProvider.updateKhanaMember(index, member);
              surveyProvider.updatedData();
            },
            isShowColumnData: false,
            hint: "বয়স লিখুন",
            isNumber: true,
            maximumAge: 120,
            leftExpandedValue: 2,
            rightExpandedValue: 3,
          ),

          generalInformationPicker2(
            surveyProvider,
            // surveyProvider.khanaMemberList.firstWhereOrNull((e) => e.id == member.memberRelation),
            khanaHeadRelationList.firstWhereOrNull((e) => e.id == member.memberRelation?.id),
            khanaHeadRelationList,
            'খানা প্রধানের সঙ্গে সম্পর্ক:',
                (OtherStaticModel? v) {
              surveyProvider.updateKhanaMember(index, member.copyWith(memberRelation: v!));
            },
            'সম্পর্ক নির্বাচন করুন',
            isEditTextEnable: false,
            inlineMaxHeight: 320.h,
          ),

          generalInformationPicker2(
            surveyProvider,
            genderList.firstWhereOrNull((e) => e.id == member.memberGender?.id),
            genderList,
            'লিঙ্গ',
                (v) {
              surveyProvider.updateKhanaMember(index, member.copyWith(memberGender: v));
            },
            'লিঙ্গ নির্বাচন করুন',
            isEditTextEnable: false,
            topPadding: 12.h,
            inlineMaxHeight: 250.h,
          ),

          generalInformationPicker2(surveyProvider, religionList.firstWhereOrNull((e) => e.id == member.religion?.id), religionList, 'ধর্মীয় পরিচয়:', (v) {
            surveyProvider.updateKhanaMember(index, member.copyWith(religion: v));
          }, 'ধর্ম নির্বাচন করুন'),

          (member.memberAge == null || (int.tryParse(member.memberAge!.trim()) ?? 0) < 10)
              ? spaceZero
              : generalInformationPicker2(
            surveyProvider,
            maritalStatusList.firstWhereOrNull((e) => e.id == member.marriageStatus?.id),
            maritalStatusList,
            'বৈবাহিক অবস্থা ',
                (v) {
              surveyProvider.updateKhanaMember(index, member.copyWith(marriageStatus: v));
            },
            'বৈবাহিক অবস্থা নির্বাচন করুন',
            topPadding: 12.h,
          ),

          (member.memberAge == null || (int.tryParse(member.memberAge!.trim()) ?? 0) < 3)
              ? spaceZero
              : generalInformationPicker2(
            surveyProvider,
            educationLevelList.firstWhereOrNull((e) => e.id == member.educationLevel?.id),
            educationLevelList,
            'শিক্ষাগত যোগ্যতা ',
                (v) {
              surveyProvider.updateKhanaMember(index, member.copyWith(educationLevel: v));
            },
            'শিক্ষাগত যোগ্যতা নির্বাচন করুন',
            topPadding: 12.h,
          ),

          (member.memberAge == null || (int.tryParse(member.memberAge!.trim()) ?? 0) < 5)
              ? spaceZero
              : generalInformationPicker2(
            surveyProvider,
            yesNoList.firstWhereOrNull((e) => e.id == member.agricultureRelative?.id),
            yesNoList,
            'কৃষি কাজে জড়িত কিনা',
                (v) {
              surveyProvider.updateKhanaMember(index, member.copyWith(agricultureRelative: v));
            },
            'কৃষি কাজে জড়িত কিনা নির্বাচন করুন',
            topPadding: 12.h,
            inlineMaxHeight: 180.h,
          ),

          (member.memberAge == null || (int.tryParse(member.memberAge!.trim()) ?? 0) < 10)
              ? spaceZero
              : generalInformationPicker2(
            surveyProvider,
            mainIncomeSourceList.firstWhereOrNull((e) => e.id == member.incomeSource?.id),
            mainIncomeSourceList,
            'আয়ের প্রধান উৎস',
                (v) {
              surveyProvider.updateKhanaMember(index, member.copyWith(incomeSource: v));
            },
            'আয়ের প্রধান উৎস নির্বাচন করুন',
            topPadding: 12.h,
          ),
        ],
      ),
    );
  }
}
