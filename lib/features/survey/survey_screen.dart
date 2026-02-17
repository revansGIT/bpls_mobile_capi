import 'package:bpls_mobile/business_logic/provider/helper_provider.dart';
import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/utils/text.styles.dart';
import 'package:bpls_mobile/widget/checkbox_widget.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:bpls_mobile/widget/radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    surveyProvider.startTime();
  }

  @override
  Widget build(BuildContext context) {
    final helperProvider = Provider.of<HelperProvider>(context);
    final surveyProvider = Provider.of<SurveyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed(AppRoutes.dashboard);
          },
          icon: Icon(Icons.arrow_circle_left_outlined, size: 24, color: AppTheme.listingButtonColor),
        ),
        title: Text(
          'ফসলের ক্ষতি ও অপচয় নিরূপণ জরিপ-২০২৬ এর প্রশ্নপত্র ',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: natoSansStyle600SemiBold.copyWith(
            // fontSize: 11,
            color: AppTheme.listingButtonColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unit Selection Box
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 20),
                BuildInputFieldWidget(
                  "পিএসইউ নং",
                  surveyProvider.psuCotroller,
                  isShowColumnData: false,
                  hint: "পিএসইউ নং লিখুন",
                  isNumber: true,
                  currentFocus: surveyProvider.psuFocusNode,
                  onChanged: (v) {
                    surveyProvider.changePsuValue(v);
                  },
                ),

                // SearchablePicker<AddressStaticDataModel>(
                //   label: 'পিএসইউ নং',
                //   items: divisions,
                //   value: helperProvider.selectedDivision,
                //   hint: 'পিএসইউ নং নির্বাচন করুন',
                //   searchable: false,
                //   inlineMaxHeight: 300.h,
                //   leftPadding: 0,
                //   rightPadding: 0,
                //   itemAsString: (s) => s.name,
                //   onClear: () {
                //     helperProvider.updateStaticData(1, data: null);
                //   },
                //   onChanged: (AddressStaticDataModel? v) {
                //     helperProvider.updateStaticData(1, data: v!);
                //   },
                // ),
                //
                // helperProvider.selectedDivision == null
                //     ? spaceZero
                //     : Column(
                //         children: [
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'জেলা',
                //             items: districts.where((d) => d.parentCode == helperProvider.selectedDivision?.code).toList(),
                //             value: helperProvider.selectedDistrict,
                //             hint: 'জেলা নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(2, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(2, data: v!);
                //             },
                //           ),
                //         ],
                //       ),
                // helperProvider.selectedDistrict == null
                //     ? spaceZero
                //     : Column(
                //         children: [
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'উপজেলা/থানা',
                //             items: upazilas.where((d) => d.parentCode == helperProvider.selectedDistrict?.code).toList(),
                //             value: helperProvider.selectedUpazilas,
                //             hint: 'উপজেলা/থানা নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(3, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(3, data: v!);
                //             },
                //           ),
                //         ],
                //       ),
                //
                // helperProvider.selectedUpazilas == null
                //     ? spaceZero
                //     : Column(
                //         children: [
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'সিটি কর্পোরেশন',
                //             items: cityCorporations.where((d) => d.parentCode == helperProvider.selectedUpazilas?.code).toList(),
                //             value: helperProvider.selectedCityCorporations,
                //             hint: 'সিটি কর্পোরেশন নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(4, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(4, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'পৌরসভা',
                //             items: porosonas.where((d) => d.parentCode == helperProvider.selectedUpazilas?.code).toList(),
                //             value: helperProvider.selectedPorosonas,
                //             hint: 'পৌরসভা নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(6, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(6, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'ইউনিয়ন',
                //             items: villages.where((d) => d.parentCode == helperProvider.selectedUpazilas?.code).toList(),
                //             value: helperProvider.selectedUnions,
                //             hint: 'ইউনিয়ন নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(8, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(8, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'ইউনিয়ন',
                //             items: villages.where((d) => d.parentCode == helperProvider.selectedUpazilas?.code).toList(),
                //             value: helperProvider.selectedVillages,
                //             hint: 'ইউনিয়ন নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(8, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(8, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'ওয়ার্ড',
                //             items: villages.where((d) => d.parentCode == helperProvider.selectedUpazilas?.code).toList(),
                //             value: helperProvider.selectedVillages,
                //             hint: 'ওয়ার্ড নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(8, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(8, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'মৌজা',
                //             items: villages.where((d) => d.parentCode == helperProvider.selectedUpazilas?.code).toList(),
                //             value: helperProvider.selectedMoujas,
                //             hint: 'মৌজা নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(7, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(7, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'গ্রাম/মহল্লা',
                //             items: villages.where((d) => d.parentCode == helperProvider.selectedUpazilas?.code).toList(),
                //             value: helperProvider.selectedEA,
                //             hint: 'গ্রাম/মহল্লা নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(8, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(8, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'গণনা এলাকা',
                //             items: surveyVillages,
                //             value: helperProvider.selectedSurveyVillages,
                //             hint: 'গণনা এলাকা নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(9, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(9, data: v!);
                //             },
                //           ),
                //           spaceHeight10,
                //           SearchablePicker<AddressStaticDataModel>(
                //             label: 'আর এমও',
                //             items: rmoTypes,
                //             value: helperProvider.selectedSurveyRmoTypes,
                //             hint: 'আর এমও নির্বাচন করুন',
                //             inlineMaxHeight: 500.h,
                //             searchable: true,
                //             leftPadding: 0,
                //             rightPadding: 0,
                //             itemAsString: (s) => s.name,
                //             onClear: () {
                //               helperProvider.updateStaticData(10, data: null);
                //             },
                //             onChanged: (AddressStaticDataModel? v) {
                //               helperProvider.updateStaticData(10, data: v!);
                //             },
                //           ),
                //         ],
                //       ),

                // Fixed Bottom Button
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 40.h),
                //   child: Row(
                //     children: [
                //       Expanded(child: _buildListingButton("ফসলের ক্ষতি ফরমে যান", '1')),
                //       spaceWeight10,
                //       Expanded(child: _buildListingButton("ফসলের অপচয় ফরমে যান", '2')),
                //     ],
                //   ),
                // ),
                surveyProvider.psuValue.isEmpty
                    ? spaceZero
                    : Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(color: const Color(0xFFF8EFFD), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ফরমের ধরনঃ", style: AppTheme.listingLabelStyle.copyWith(fontSize: 15)),
                            SizedBox(height: 8.h),
                            Text("নির্বাচন করুনঃ", style: AppTheme.listingHintStyle.copyWith(color: const Color(0xFF1D1B20), fontSize: 13)),
                            SizedBox(height: 32.h),

                            Row(
                              children: [
                                buildTypeButton(
                                  label: "ফসলের ক্ষতি ফরম",
                                  onTap: () {
                                    hideKeyboard();
                                    surveyProvider.resetTottoType();
                                    surveyProvider.changeFormTypeSelect(1);
                                  },
                                  isSelect: surveyProvider.formTypeSelect == 1,
                                ),
                                SizedBox(width: 32.w),
                                buildTypeButton(
                                  label: "খাদ্যের অপচয় ফরম",
                                  onTap: () {
                                    hideKeyboard();
                                    showToastMessage('Upcomming...');
                                    surveyProvider.resetTottoType();
                                    surveyProvider.changeFormTypeSelect(2);
                                  },
                                  isSelect: surveyProvider.formTypeSelect == 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                spaceHeight10,
                surveyProvider.formTypeSelect == -1 || surveyProvider.formTypeSelect == 2 || surveyProvider.psuValue.isEmpty
                    ? spaceZero
                    : Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(color: const Color(0xFFF8EFFD), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ইউনিটের ধরনঃ", style: AppTheme.listingLabelStyle.copyWith(fontSize: 15)),
                            SizedBox(height: 8.h),
                            Text("নির্বাচন করুনঃ", style: AppTheme.listingHintStyle.copyWith(color: const Color(0xFF1D1B20), fontSize: 13)),
                            SizedBox(height: 32.h),

                            Row(
                              children: [
                                buildTypeButton(
                                  label: "খানা",
                                  onTap: () {
                                    hideKeyboard();
                                    surveyProvider.changeUnitSelect(1, helperProvider);
                                    surveyProvider.changeTottoType(OtherStaticModel(id: '1', description: 'খানা'));
                                  },
                                  isSelect: surveyProvider.unitSelect == 1,
                                ),
                                SizedBox(width: 32.w),
                                buildTypeButton(
                                  label: "প্রতিষ্ঠান",
                                  onTap: () {
                                    hideKeyboard();
                                    surveyProvider.changeUnitSelect(2, helperProvider);
                                    surveyProvider.changeTottoType(OtherStaticModel(id: '-1', description: 'প্রতিষ্ঠান'));
                                  },
                                  isSelect: surveyProvider.unitSelect == 2,
                                  // onTap: () => controller.selectUnit('institution')
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                spaceHeight10,

                surveyProvider.unitSelect == -1 || surveyProvider.unitSelect == 1 ? spaceZero : labelText('তথ্যের পর্যায়'),
                surveyProvider.unitSelect == -1 || surveyProvider.unitSelect == 1
                    ? spaceZero
                    : DynamicRadioList(
                        items: tottoTypes,
                        value: surveyProvider.selectedTottoType,
                        onValueChanged: (value) {
                          if (value != null) {
                            surveyProvider.changeTottoType(value);
                          }
                        },
                        labelBuilder: (item) => item.description,
                      ),

                surveyProvider.unitSelect == -1 && surveyProvider.selectedTottoType.id == '-1' ? spaceZero : spaceHeight10,
                (surveyProvider.unitSelect == -1 && surveyProvider.selectedTottoType.id == '-1') || (surveyProvider.unitSelect == 2 && surveyProvider.selectedTottoType.id == '-1')
                    ? spaceZero
                    : labelText('আপনি কোন ধরনের ফসল/পণ্য উৎপাদন/পরিচালনা করেন?'),
                (surveyProvider.unitSelect == -1 && surveyProvider.selectedTottoType.id == '-1') || (surveyProvider.unitSelect == 2 && surveyProvider.selectedTottoType.id == '-1') ? spaceZero : spaceHeight10,
                (surveyProvider.unitSelect == -1 && surveyProvider.selectedTottoType.id == '-1') || (surveyProvider.unitSelect == 2 && surveyProvider.selectedTottoType.id == '-1')
                    ? spaceZero
                    : DynamicCheckboxList(
                        items: (surveyProvider.selectedTottoType.id == '1' || surveyProvider.unitSelect == 1) || (surveyProvider.selectedTottoType.id == '2'
                            && surveyProvider.selectedTottoType.id == '2') ? conductTypes1_2 : conductTypesOther,
                        selectedValues: surveyProvider.selectedConductTypes.toSet(),
                        onChanged: (selected) {

                          final previous = surveyProvider.selectedConductTypes.toSet();
                          final added = selected.difference(previous);
                          final removed = previous.difference(selected);
                          for (final item in added) {
                            surveyProvider.toggleConductType(item);
                          }
                          for (final item in removed) {
                            surveyProvider.toggleConductType(item);
                          }
                          surveyProvider.updatedData();
                        },
                        labelBuilder: (item) => item.description,
                      ),

                surveyProvider.unitSelect == -1 && surveyProvider.selectedTottoType.id == '-1' || surveyProvider.selectedConductTypes.isEmpty ? spaceZero : spaceHeight20,

                surveyProvider.unitSelect == -1 && surveyProvider.selectedTottoType.id == '-1' || surveyProvider.selectedConductTypes.isEmpty
                    ? spaceZero
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildNextButton(() {
                            helperProvider.updateMetaData();
                            Get.toNamed(surveyProvider.unitSelect == 1 ? AppRoutes.secondScreenKhana : AppRoutes.secondScreenOrganitation);
                          }),
                        ],
                      ),
                surveyProvider.unitSelect == -1 && surveyProvider.selectedTottoType.id == '-1' || surveyProvider.selectedConductTypes.isEmpty ? spaceZero : spaceHeight5,

                // Get.toNamed(val == 1 ? AppRoutes.secondScreenKhana : AppRoutes.secondScreenOrganitation);
              ],
            ),
          ),
        ],
      ),
    );
  }

}
