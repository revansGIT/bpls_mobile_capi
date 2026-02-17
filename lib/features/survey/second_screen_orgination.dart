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

class SecondScreenOrganitation extends StatefulWidget {
  const SecondScreenOrganitation({super.key});

  @override
  State<SecondScreenOrganitation> createState() => _SecondScreenOrganitationState();
}

class _SecondScreenOrganitationState extends State<SecondScreenOrganitation> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context);

    return Scaffold(
      appBar: AppBar(leading: backButton, title: Text("প্রতিষ্ঠান")),
      body: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 24.h),
        children: [
          buildReadOnlyField("১. প্রতিষ্ঠানের সিরিয়াল নম্বর", surveyProvider.getSLNumber(providerSaveData.dashboardCount!.totalCount + 1)),

          BuildInputFieldWidget(
            "২ প্রতিষ্ঠানের মালিকের নাম",
            surveyProvider.organizationOwnerNameController,
            hint: "প্রতিষ্ঠানের মালিকের নাম",
            currentFocus: surveyProvider.organizationOwnerNameFocusNode,
            nextFocus: surveyProvider.organizationOwnerAgeFocusNode,
            isShowColumnData: false,
            isMandatory: true,
            mandatoryMessage: 'প্রতিষ্ঠানের মালিকের নাম লিখুন',
          ),

          labelText('৩ প্রতিষ্ঠানের মালিকের লিঙ্গ '),
          DynamicRadioList(
            items: genderList,
            value: surveyProvider.selectGender,
            runSpacing: -20.h,
            onValueChanged: (value) {
              if (value != null) {
                surveyProvider.changeGender(value);
              }
            },
            labelBuilder: (item) => item.description,
          ),

          BuildInputFieldWidget(
            "৪. প্রতিষ্ঠানের মালিকের বয়স",
            surveyProvider.organizationOwnerAgeController,
            hint: "প্রতিষ্ঠানের মালিকের বয়স",
            isNumber: true,
            currentFocus: surveyProvider.organizationOwnerAgeFocusNode,
            nextFocus: surveyProvider.organizationHoldingNumberFocusNode,
            isShowColumnData: false,
            isMandatory: true,
            mandatoryMessage: 'প্রতিষ্ঠানের মালিকের বয়স লিখুন',
          ),
          BuildInputFieldWidget(
            "৫. প্রতিষ্ঠানের ঠিকানা হোল্ডিং নম্বরসহঃ",
            surveyProvider.organizationHoldingNumberController,
            hint: "হোল্ডিং নম্বরসহ ঠিকানা লিখুন",
            currentFocus: surveyProvider.organizationHoldingNumberFocusNode,
            nextFocus: surveyProvider.organizationAddressFocusNode,
            isShowColumnData: false,
            isMandatory: true,
            mandatoryMessage: 'প্রতিষ্ঠানের ঠিকানা হোল্ডিং নম্বর লিখুন',
          ),
          BuildInputFieldWidget(
            "৬. প্রতিষ্ঠানের ঠিকানা",
            surveyProvider.organizationAddressController,
            isShowColumnData: false,
            hint: "প্রতিষ্ঠানের ঠিকানা লিখুন",
            currentFocus: surveyProvider.organizationAddressFocusNode,
            nextFocus: surveyProvider.organizationPhoneFocusNode,
            isMandatory: true,
            mandatoryMessage: 'প্রতিষ্ঠানের ঠিকানা লিখুন',
          ),
          BuildInputFieldWidget(
            "৭. প্রতিষ্ঠানের ফোন নম্বর",
            surveyProvider.organizationPhoneController,
            isShowColumnData: false,
            hint: "প্রতিষ্ঠানের ফোন নম্বর লিখুন",
            isNumber: true,
            currentFocus: surveyProvider.organizationPhoneFocusNode,
            nextFocus: surveyProvider.organizationEstablishedYearFocusNode,
            isMandatory: true,
            mandatoryMessage: 'প্রতিষ্ঠানের ফোন নম্বর লিখুন',
            maxLength: 11,
          ),
          BuildInputFieldWidget(
            "৮. প্রতিষ্ঠানটি কত সালে প্রতিষ্ঠিত?",
            surveyProvider.organizationEstablishedYearController,
            isShowColumnData: false,
            hint: "প্রতিষ্ঠানের প্রতিষ্ঠার সাল লিখুন",
            isNumber: true,
            currentFocus: surveyProvider.organizationEstablishedYearFocusNode,
            isMandatory: true,
            mandatoryMessage: 'প্রতিষ্ঠানের প্রতিষ্ঠার সাল লিখুন',
            maxLength: 4,
          ),
          labelText('৯ প্রতিষ্ঠানটি কি ধরনের (নির্বাচন করুন)'),
          DynamicRadioList(
            items: residenceTypeList,
            value: surveyProvider.selectedOrganizationType,
            runSpacing: -20.h,
            onValueChanged: (value) {
              if (value != null) {
                surveyProvider.changeOrganizationType(value);
              }
            },
            labelBuilder: (item) => item.description,
          ),

          labelText('১০ প্রতিষ্ঠানটির মালিকানা (নির্বাচন করুন)'),
          DynamicRadioList(
            items: organizationTypeList,
            value: surveyProvider.selectedBusinessType,
            runSpacing: -20.h,
            onValueChanged: (value) {
              if (value != null) {
                surveyProvider.changeBusinessType(value);
              }
            },
            labelBuilder: (item) => item.description,
            isOthersItem: (item) => item.id == '96',
            othersHint: 'অন্যান্য মালিকানা লিখুন',
            othersController: surveyProvider.otherBusinessTypeController,
            onOthersTextChanged: (String value) {
              surveyProvider.changeOtherTypeSection2(7, value);
            },
            othersTextValue: surveyProvider.otherBusinessType,
          ),

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
                labelText('১১. প্রতিষ্ঠানটির নিয়মিত জনবল কত?'),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Expanded(
                      child: BuildInputFieldWidget(
                        "পুরুষ",
                        surveyProvider.organizationDailyWorkedMan,
                        isShowColumnData: false,
                        hint: "সংখ্যা লিখুন",
                        isNumber: true,
                        currentFocus: surveyProvider.organizationDailyWorkedManFocusNode,
                        nextFocus: surveyProvider.organizationDailyWorkedWomenFocusNode,
                        onChanged: (v) {
                          surveyProvider.updateTotalWorkers();
                        },
                        isMandatory: true,
                        mandatoryMessage: 'পুরুষের সংখ্যা লিখুন',
                      ),
                    ),
                    spaceWeight5,
                    Expanded(
                      child: BuildInputFieldWidget(
                        "মহিলা",
                        surveyProvider.organizationDailyWorkedWomen,
                        isShowColumnData: false,
                        hint: "সংখ্যা লিখুন",
                        isNumber: true,
                        currentFocus: surveyProvider.organizationDailyWorkedWomenFocusNode,
                        nextFocus: surveyProvider.organizationDailyWorkedOtherFocusNode,
                        onChanged: (v) {
                          surveyProvider.updateTotalWorkers();
                        },
                        isMandatory: true,
                        mandatoryMessage: 'মহিলার সংখ্যা লিখুন',
                      ),
                    ),
                    spaceWeight5,
                    Expanded(
                      child: BuildInputFieldWidget(
                        "হিজড়া",
                        surveyProvider.organizationDailyWorkedOther,
                        isShowColumnData: false,
                        hint: "সংখ্যা লিখুন",
                        isNumber: true,
                        currentFocus: surveyProvider.organizationDailyWorkedOtherFocusNode,
                        nextFocus: surveyProvider.organizationDailyIrregularWorkedManFocusNode,
                        onChanged: (v) {
                          surveyProvider.updateTotalWorkers();
                        },
                        isMandatory: true,
                        mandatoryMessage: 'হিজড়ার সংখ্যা লিখুন',
                      ),
                    ),
                    spaceWeight5,

                    Expanded(
                      child: BuildInputFieldWidget(
                        "মোট",
                        TextEditingController(text: surveyProvider.totalRegularWorker.toString()),
                        isShowColumnData: false,
                        hint: "মোট",
                        isNumber: true,
                        isEnable: false,
                      ),
                    ),
                  ],
                ),

                labelText('১২. প্রতিষ্ঠানটির অনিয়মিত জনবল কত?'),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Expanded(
                      child: BuildInputFieldWidget(
                        "পুরুষ",
                        surveyProvider.organizationDailyIrregularWorkedMan,
                        isShowColumnData: false,
                        hint: "সংখ্যা লিখুন",
                        isNumber: true,
                        currentFocus: surveyProvider.organizationDailyIrregularWorkedManFocusNode,
                        nextFocus: surveyProvider.organizationDailyIrregularWorkedWomenFocusNode,
                        onChanged: (v) {
                          surveyProvider.updateTotalWorkers();
                        },
                        isMandatory: true,
                        mandatoryMessage: 'পুরুষের সংখ্যা লিখুন',
                      ),
                    ),
                    spaceWeight15,
                    Expanded(
                      child: BuildInputFieldWidget(
                        "মহিলা",
                        surveyProvider.organizationDailyIrregularWorkedWomen,
                        isShowColumnData: false,
                        hint: "সংখ্যা লিখুন",
                        isNumber: true,
                        currentFocus: surveyProvider.organizationDailyIrregularWorkedWomenFocusNode,
                        nextFocus: surveyProvider.organizationDailyIrregularWorkedOtherFocusNode,
                        onChanged: (v) {
                          surveyProvider.updateTotalWorkers();
                        },
                        isMandatory: true,
                        mandatoryMessage: 'মহিলার সংখ্যা লিখুন',
                      ),
                    ),
                    spaceWeight15,
                    Expanded(
                      child: BuildInputFieldWidget(
                        "হিজড়া",
                        surveyProvider.organizationDailyIrregularWorkedOther,
                        isShowColumnData: false,
                        hint: "সংখ্যা লিখুন",
                        isNumber: true,
                        currentFocus: surveyProvider.organizationDailyIrregularWorkedOtherFocusNode,
                        onChanged: (v) {
                          surveyProvider.updateTotalWorkers();
                        },
                        isMandatory: true,
                        mandatoryMessage: 'হিজড়ার সংখ্যা লিখুন',
                      ),
                    ),
                    spaceWeight5,

                    Expanded(
                      child: BuildInputFieldWidget(
                        "মোট",
                        TextEditingController(text: surveyProvider.totalIrregularWorker.toString()),
                        isShowColumnData: false,
                        hint: "মোট",
                        isNumber: true,
                        isEnable: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

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
                        surveyProvider.secondStepClick(providerSaveData.dashboardCount!.totalCount + 1);
                        surveyProvider.saveTempData();
                        surveyProvider.shortByAscIDConductType();
                      }
                    }),
                  ],
                ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _showErrorAndScroll(String message, int index, FocusNode? focusNode) {
    // Approximate scroll offsets based on estimated heights
    double offset = 0;
    if (index == 0) {
      offset = 50;
    } else if (index == 1) {
      offset = 100;
    } else if (index == 2) {
      offset = 150;
    } else if (index == 3) {
      offset = 200;
    } else if (index == 4) {
      offset = 250;
    } else if (index == 5) {
      offset = 300;
    } else if (index == 6) {
      offset = 350;
    } else if (index == 7) {
      offset = 400;
    } else if (index == 8) {
      offset = 450;
    } else if (index >= 9) {
      offset = 500;
    }
    scrollController.animateTo(offset, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    focusNode?.requestFocus();
    Get.snackbar('ত্রুটি', message, backgroundColor: Colors.red, colorText: Colors.white);
  }

  bool validate() {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    if (surveyProvider.organizationOwnerNameController.text.trim().isEmpty) {
      _showErrorAndScroll('প্রতিষ্ঠানের মালিকের নাম লিখুন', 0, surveyProvider.organizationOwnerNameFocusNode);
      return false;
    }
    if (surveyProvider.selectGender == null) {
      _showErrorAndScroll('লিঙ্গ নির্বাচন করুন', 1, null);
      return false;
    }
    if (surveyProvider.organizationOwnerAgeController.text.trim().isEmpty) {
      _showErrorAndScroll('প্রতিষ্ঠানের মালিকের বয়স লিখুন', 2, surveyProvider.organizationOwnerAgeFocusNode);
      return false;
    }
    if (surveyProvider.organizationHoldingNumberController.text.trim().isEmpty) {
      _showErrorAndScroll('প্রতিষ্ঠানের ঠিকানা হোল্ডিং নম্বর লিখুন', 3, surveyProvider.organizationHoldingNumberFocusNode);
      return false;
    }
    if (surveyProvider.organizationAddressController.text.trim().isEmpty) {
      _showErrorAndScroll('প্রতিষ্ঠানের ঠিকানা লিখুন', 4, surveyProvider.organizationAddressFocusNode);
      return false;
    }
    String phone = surveyProvider.organizationPhoneController.text.trim();
    if (phone.isEmpty || phone.length != 11 || !phone.startsWith('01')) {
      _showErrorAndScroll('সঠিক ফোন নম্বর প্রয়োজন (01 দিয়ে শুরু 11 ডিজিট)', 5, surveyProvider.organizationPhoneFocusNode);
      return false;
    }
    if (surveyProvider.organizationEstablishedYearController.text.trim().isEmpty) {
      _showErrorAndScroll('প্রতিষ্ঠানের প্রতিষ্ঠার সাল লিখুন', 6, surveyProvider.organizationEstablishedYearFocusNode);
      return false;
    }
    if (surveyProvider.selectedOrganizationType == null) {
      _showErrorAndScroll('প্রতিষ্ঠানের ধরন নির্বাচন করুন', 7, null);
      return false;
    }
    if (surveyProvider.selectedBusinessType == null) {
      _showErrorAndScroll('মালিকানা নির্বাচন করুন', 8, null);
      return false;
    }
    if (surveyProvider.organizationDailyWorkedMan.text.trim().isEmpty) {
      _showErrorAndScroll('পুরুষের সংখ্যা লিখুন', 9, surveyProvider.organizationDailyWorkedManFocusNode);
      return false;
    }
    if (surveyProvider.organizationDailyWorkedWomen.text.trim().isEmpty) {
      _showErrorAndScroll('মহিলার সংখ্যা লিখুন', 10, surveyProvider.organizationDailyWorkedWomenFocusNode);
      return false;
    }
    if (surveyProvider.organizationDailyWorkedOther.text.trim().isEmpty) {
      _showErrorAndScroll('হিজড়ার সংখ্যা লিখুন', 11, surveyProvider.organizationDailyWorkedOtherFocusNode);
      return false;
    }
    if (surveyProvider.organizationDailyIrregularWorkedMan.text.trim().isEmpty) {
      _showErrorAndScroll('পুরুষের সংখ্যা লিখুন', 12, surveyProvider.organizationDailyIrregularWorkedManFocusNode);
      return false;
    }
    if (surveyProvider.organizationDailyIrregularWorkedWomen.text.trim().isEmpty) {
      _showErrorAndScroll('মহিলার সংখ্যা লিখুন', 13, surveyProvider.organizationDailyIrregularWorkedWomenFocusNode);
      return false;
    }
    if (surveyProvider.organizationDailyIrregularWorkedOther.text.trim().isEmpty) {
      _showErrorAndScroll('হিজড়ার সংখ্যা লিখুন', 14, surveyProvider.organizationDailyIrregularWorkedOtherFocusNode);
      return false;
    }
    return true;
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
      shouldShowCustomField: isEditTextEnable == false ? null : (item) => item.id == searchQuery,
    );
  }
}
