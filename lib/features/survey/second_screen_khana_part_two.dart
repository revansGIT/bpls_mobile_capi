import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:bpls_mobile/widget/searchable_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SecondScreenKhanaPartTwo extends StatefulWidget {
  const SecondScreenKhanaPartTwo({super.key});

  @override
  State<SecondScreenKhanaPartTwo> createState() => _SecondScreenKhanaPartTwoState();
}

class _SecondScreenKhanaPartTwoState extends State<SecondScreenKhanaPartTwo> {
  ScrollController scrollController = ScrollController();
  FocusNode lineNumberFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();
  List<GlobalKey> memberKeys = [];
  GlobalKey lineNumberKey = GlobalKey();
  GlobalKey mobileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context);

    return Scaffold(
      appBar: AppBar(leading: backButton, title: Text("খানার সদস্যদের তথ্য")),
      body: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 24.h),
        children: [
          SizedBox(height: 24.h),
          Container(
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
                SearchablePicker<int>(
                  label: '১. মোট সদস্য সংখ্যা:',
                  items: totalMemberList,
                  value: surveyProvider.memberListCount,
                  hint: 'মোট সদস্য সংখ্যা নির্বাচন করুন',
                  inlineMaxHeight: 500.h,
                  searchable: false,
                  leftPadding: 0,
                  rightPadding: 0,
                  fontSize: 12,
                  itemAsString: (s) => s.toString(),
                  onClear: () {
                    surveyProvider.changeMemberListCount(0);
                  },
                  onChanged: (int? v) {
                    surveyProvider.changeMemberListCount(v!);
                    // surveyProvider.updateKhanaMember(index, member.copyWith(memberRelation: v!));
                    // surveyProvider.khanaMemberList[0].memberRelation = OtherStaticModel(id: '1', description: 'খানা প্রধান');
                    // surveyProvider.updatedData();
                  },
                ),
                surveyProvider.memberListCount == null
                    ? spaceZero
                    : spaceHeight20,
                ...(surveyProvider.memberListCount == null
                    ? [spaceZero]
                    : List.generate(surveyProvider.memberListCount!, (int index) {
                        if (memberKeys.length != surveyProvider.memberListCount!) {
                          memberKeys = List.generate(surveyProvider.memberListCount!, (i) => GlobalKey());
                        }
                        bool isOpenOptionsForKhanaRelation = true;
                        if (index == 0) {
                          // surveyProvider.khanaMemberList[index].memberRelation = OtherStaticModel(id: '1', description: 'খা���া প্রধান');
                          // surveyProvider.updateKhanaMember(index, member.copyWith(memberRelation: v!));
                          isOpenOptionsForKhanaRelation = false;
                        }

                        return generator(index, surveyProvider, isOpenOptionsForKhanaRelation);
                      })),
                surveyProvider.memberListCount == null ? spaceZero : spaceHeight10,
                surveyProvider.memberListCount == null
                    ? spaceZero
                    : BuildInputFieldWidget(
                        "২. উত্তর দাতার লাইন নম্বর",
                        surveyProvider.answerPersonLineNumber,
                        key: lineNumberKey,
                        isShowColumnData: false,
                        hint: "উত্তর দাতার লাইন নম্বর লিখুন",
                        isNumber: true,
                        isMandatory: true,
                        mandatoryMessage: 'উত্তর দাতার লাইন নম্বর লিখুন',
                        currentFocus: lineNumberFocusNode,
                        onChanged: (value) {
                          surveyProvider.changeAnswerPersonName8_3(value);
                          // if (value.trim().isNotEmpty && surveyProvider.answerPersonName8_3.isEmpty) {
                          //   setState(() => lineNumberError = 'উত্তর দাতার নাম পাওয়া যায়নি');
                          // } else {
                          //   setState(() => lineNumberError = null);
                          // }
                        },
                      ),
                surveyProvider.memberListCount == null
                    ? spaceZero
                    : Row(
                        children: [
                          Expanded(child: Text('উত্তর দাতার নামঃ', style: AppTheme.listingLabelStyle.copyWith(fontSize: 12))),
                          spaceWeight10,
                          Expanded(child: Text(surveyProvider.answerPersonName8_3.isEmpty ? "পাওয়া যায়নি" : surveyProvider.answerPersonName8_3, style: AppTheme.listingLabelStyle.copyWith(fontSize: 13))),
                        ],
                      ),
                surveyProvider.memberListCount == null ? spaceZero : spaceHeight15,
                surveyProvider.memberListCount == null
                    ? spaceZero
                    : BuildInputFieldWidget(
                        "৩. উত্তর দাতার মোবাইল নম্বর (যদি থাকে)",
                        surveyProvider.answerPersonMobileNumber,
                        key: mobileKey,
                        maxLength: 11,
                        isShowColumnData: false,
                        hint: "উত্তর দাতার মোবাইল নম্বর লিখুন",
                        isNumber: true,
                        currentFocus: mobileFocusNode,
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
                        surveyProvider.saveFormData(providerSaveData, (bool status) async {
                          if (status == true) {
                            showToastMessage('আংশিক সংরক্ষণ সম্পন্ন হয়েছে');
                            Get.offAllNamed(AppRoutes.dashboard);
                          }
                        }, false);
                      },
                      title: 'আংশিক সংরক্ষণ করুন',
                      btnColor: Colors.red,
                    ),
                    buildNextButton(() {
                      if (validate()) {
                        surveyProvider.secondStepClick(providerSaveData.dashboardCount!.totalCount+1);
                        surveyProvider.saveTempData();
                        surveyProvider.shortByAscIDConductType();
                        // bool isPartOne = surveyProvider.selectedTottoType.id == '1' || surveyProvider.selectedTottoType.id == '2';
                        // initializeModule4Data(surveyProvider, isPartOne);
                        // surveyProvider.changeSelectedPageIndex(0);
                        // Get.toNamed(AppRoutes.module34Screen);
                      }
                    }),
                  ],
                ),

          SizedBox(height: surveyProvider.memberListCount == null ? 400.h : 24.h),
        ],
      ),
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
    bool isOpenOptions = true,
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
      isOpenOptions: isOpenOptions,
      onCustomTextChanged: (String v) {
        final customItem = OtherStaticModel(id: searchQuery, description: v);
        onChanged(customItem);
      },
      shouldShowCustomField: isEditTextEnable == false ? null : (item) => item.id == searchQuery,
    );
  }

  Widget generator(int index, SurveyProvider surveyProvider, bool isOpenOptionsForKhanaRelation) {
    final member = surveyProvider.khanaMemberList[index];
    return Container(
      key: memberKeys[index],
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
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(10)),
              child: Text(
                'খানা সদস্যের লাইন নং ${index + 1}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
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
            index == 0 ? khanaHeadRelationListOne.firstWhereOrNull((e) => e.id == member.memberRelation?.id) : khanaHeadRelationList.firstWhereOrNull((e) => e.id == member.memberRelation?.id),
            index == 0 ? khanaHeadRelationListOne : khanaHeadRelationList,
            'খানা প্রধানের সঙ্গে সম্পর্ক:',
            (OtherStaticModel? v) {
              print('Selected Relation: ${v?.description}');
              // surveyProvider.updateKhanaMember(index, member.copyWith(memberRelation: v!));
              if (v!.id == '2') {
                surveyProvider.updateKhanaMember(
                  index,
                  member.copyWith(
                    marriageStatus: OtherStaticModel(id: '2', description: 'স্ত্রী/স্বামী'),
                    memberRelation: v,
                  ),
                );
              } else {
                surveyProvider.updateKhanaMember(index, member.copyWith(marriageStatus: null, memberRelation: v));
              }
              surveyProvider.updatedData();
            },
            'সম্পর্ক নির্বাচন করুন',
            isEditTextEnable: false,
            isOpenOptions: isOpenOptionsForKhanaRelation,
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
                    surveyProvider.updatedData();
                  },
                  'বৈবাহিক অবস্থা নির্বাচন করুন',
                  topPadding: 12.h,
                  isOpenOptions: member.memberRelation?.id == '2' ? false : true,
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
                  'কৃষি কাজে জড়িত কিনা',
                  (v) {
                    surveyProvider.updateKhanaMember(index, member.copyWith(agricultureRelative: v));
                  },
                  'কৃষি কাজে জড়িত কিনা নির্বাচন করুন',
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

  void _showErrorAndScroll(String message, int index, FocusNode? focusNode) {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    if (index < surveyProvider.memberListCount!) {
      Scrollable.ensureVisible(memberKeys[index].currentContext!, duration: const Duration(milliseconds: 300), alignment: 0.1);
    } else if (index == surveyProvider.memberListCount) {
      Scrollable.ensureVisible(lineNumberKey.currentContext!, duration: const Duration(milliseconds: 300), alignment: 0.1);
    } else {
      Scrollable.ensureVisible(mobileKey.currentContext!, duration: const Duration(milliseconds: 300), alignment: 0.1);
    }
    focusNode?.requestFocus();
    Get.snackbar('ত্রুটি', message, backgroundColor: Colors.red, colorText: Colors.white);
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text('Error'),
    //     content: Text(message),
    //     actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK'))],
    //   ),
    // );
  }

  bool validate() {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    // Validate member fields
    for (int i = 0; i < surveyProvider.khanaMemberList.length; i++) {
      final member = surveyProvider.khanaMemberList[i];
      if (member.nameController.text.trim().isEmpty) {
        _showErrorAndScroll('সদস্যের নাম লিখুন', i, member.nameFocusNode);
        return false;
      }
      if (member.ageController.text.trim().isEmpty) {
        _showErrorAndScroll('বয়স লিখুন', i, member.ageFocusNode);
        return false;
      }
      if (member.memberRelation == null) {
        _showErrorAndScroll('সম্পর্ক নির্বাচন করুন', i, null);
        return false;
      }
      if (member.memberGender == null) {
        _showErrorAndScroll('লিঙ্গ নির্বাচন করুন', i, null);
        return false;
      }
      if (member.religion == null) {
        _showErrorAndScroll('ধর্ম নির্বাচন করুন', i, null);
        return false;
      }
      if (member.memberAge != null && (int.tryParse(member.memberAge!.trim()) ?? 0) >= 10 && member.marriageStatus == null) {
        _showErrorAndScroll('বৈবাহিক অবস্থা নির্বাচন করুন', i, null);
        return false;
      }
      // Add checks for education, agriculture, income if applicable
      if (member.memberAge != null && (int.tryParse(member.memberAge!.trim()) ?? 0) >= 3 && member.educationLevel == null) {
        _showErrorAndScroll('শিক্ষাগত যোগ্যতা নির্বাচন করুন', i, null);
        return false;
      }
      if (member.memberAge != null && (int.tryParse(member.memberAge!.trim()) ?? 0) >= 5 && member.agricultureRelative == null) {
        _showErrorAndScroll('কৃষি কাজে জড়িত কিনা নির্বাচন করুন', i, null);
        return false;
      }
      if (member.memberAge != null && (int.tryParse(member.memberAge!.trim()) ?? 0) >= 10 && member.incomeSource == null) {
        _showErrorAndScroll('আয়ের প্রধান উৎস নির্বাচন করুন', i, null);
        return false;
      }
    }
    String lineNumber = surveyProvider.answerPersonLineNumber.text.trim();
    if (lineNumber.isEmpty && surveyProvider.answerPersonName8_3.isNotEmpty) {
      _showErrorAndScroll('উত্তর দাতার লাইন নম্বর লিখুন', surveyProvider.memberListCount!, lineNumberFocusNode);
      return false;
    }
    if (lineNumber.isNotEmpty && surveyProvider.answerPersonName8_3.isEmpty) {
      _showErrorAndScroll('উত্তর দাতার নাম পাওয়া যায়নি', surveyProvider.memberListCount!, lineNumberFocusNode);
      return false;
    }
    String phone = surveyProvider.answerPersonMobileNumber.text.trim();
    if (phone.isNotEmpty && (phone.length != 11 || !phone.startsWith('01')) && surveyProvider.answerPersonName8_3.isNotEmpty) {
      _showErrorAndScroll('সঠিক মোবাইল নম্বর প্রয়োজন (01 দিয়ে শুরু 11 ডিজিট)', surveyProvider.memberListCount! + 1, mobileFocusNode);
      return false;
    }
    return true;
  }
}
