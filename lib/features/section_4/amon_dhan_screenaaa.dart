import 'package:bpls_mobile/business_logic/provider/amon_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/datasource/model/module_3_model.dart';
import 'package:bpls_mobile/datasource/model/module_4_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/helper/helper_section_last.dart' as helper_last;
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/utils/text.styles.dart';
import 'package:bpls_mobile/widget/checkbox_widget.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:bpls_mobile/widget/radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';

class AmonDhanScreen extends StatefulWidget {
  const AmonDhanScreen({super.key});

  @override
  State<AmonDhanScreen> createState() => _AmonDhanScreenState();
}

class _AmonDhanScreenState extends State<AmonDhanScreen> {
  final Map<String, String?> _lossErrors = {};

  Map<String, GlobalKey> lossKeys = {};
  late final helper_last.ErrorHighlightController _errorHighlightController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _errorHighlightController = helper_last.ErrorHighlightController(
      onChange: () {
        if (!mounted) return;
        setState(() {});
      },
    );

    if (providerSaveData.savedPayloadList.isNotEmpty) {
      providerAmonDhan.initializeValue(providerSaveData.savedPayloadList.first.amonDhanModel!);
    }

    _initializeLossKeys();
  }

  @override
  void dispose() {
    _errorHighlightController.dispose();
    super.dispose();
  }

  void _initializeLossKeys() {
    final module4List = providerAmonDhan.member.module4ModelList ?? [];
    lossKeys = helper_last.buildLossKeys(module4List.length);
  }

  GlobalKey _getLossKey(String keyName) {
    if (!lossKeys.containsKey(keyName)) {
      lossKeys[keyName] = GlobalKey();
    }
    return lossKeys[keyName]!;
  }

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context);
    final amonDhanProvider = Provider.of<AmonDhanProvider>(context);
    String title = 'আমন ধান (গত এক বছরে)';


    return Consumer<AmonDhanProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_circle_left_outlined, size: 26, color: AppTheme.listingButtonColor),
            ),
            title: Text(title),
            toolbarHeight: 40,
          ),
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: amonDhanProvider.scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            tottoKhanAndOrganization == false
                                ? spaceZero
                                : buildErrorHighlightWrapper(
                              key: amonDhanProvider.landQuantityKey,
                              child: BuildInputFieldWidget(
                                "১. আবাদকৃত জমির পরিমাণ",
                                amonDhanProvider.member.controllerLandQuantity,
                                onChanged: (v) {
                                  amonDhanProvider.member.landQuantity = v.isEmpty ? null : int.parse(v);
                                  surveyProvider.updatedData();
                                  if (v.isNotEmpty) {
                                    _errorHighlightController.clearHighlight(amonDhanProvider.landQuantityKey.toString());
                                  }
                                },
                                currentFocus: amonDhanProvider.member.focusNodeLandQuantity,
                                nextFocus: amonDhanProvider.member.focusNodeProductionQuantity,
                                hint: "শতক",
                                isNumberAndShowFraction: true,
                                isShowColumnData: false,
                                leftExpandedValue: 1,
                                rightExpandedValue: 1,
                              ),
                            ),
                            tottoKhanAndOrganization == false
                                ? spaceZero
                                : buildErrorHighlightWrapper(
                              key: amonDhanProvider.productionQuantityKey,
                              child: BuildInputFieldWidget(
                                "২. পণ্য/উৎপাদিত ফসলের পরিমাণ ",
                                amonDhanProvider.member.controllerProductionQuantity,
                                onChanged: (v) {
                                  amonDhanProvider.member.productionQuantity = v.isEmpty ? null : double.parse(v);
                                  surveyProvider.updatedData();
                                  if (v.isNotEmpty) {
                                    _errorHighlightController.clearHighlight(amonDhanProvider.productionQuantityKey.toString());
                                  }
                                },
                                currentFocus: amonDhanProvider.member.focusNodeProductionQuantity,
                                nextFocus: amonDhanProvider.member.focusNodeOtherSourceQuantity,
                                hint: "কেজি",
                                isNumberAndShowFraction: true,
                                isShowColumnData: false,
                                leftExpandedValue: 1,
                                rightExpandedValue: 1,
                              ),
                            ),
                            // spaceHeight20,
                            buildErrorHighlightWrapper(
                              key: amonDhanProvider.otherSourceQuantityKey,
                              child: BuildInputFieldWidget(
                                tottoKhanAndOrganization
                                    ? "৩. অন্যান্য উৎস থেকে (বর্গা/লীজ/ক্রয়কৃত) প্রাপ্ত ফসলের পরিমাণ"
                                    : "১. গত এক বছরে ক্রয়কৃত/ মিলিং/ প্রসেস করার জন্য ব্যবহৃত ফসলের পরিমাণ",
                                amonDhanProvider.member.controllerOtherSourceQuantity,
                                onChanged: (v) {
                                  amonDhanProvider.member.otherSourceQuantity = v.isEmpty ? null : double.parse(v);
                                  surveyProvider.updatedData();
                                  if (v.isNotEmpty) {
                                    _errorHighlightController.clearHighlight(amonDhanProvider.otherSourceQuantityKey.toString());
                                  }
                                },
                                currentFocus: amonDhanProvider.member.focusNodeOtherSourceQuantity,
                                nextFocus: amonDhanProvider.member.focusNodeSalesQuantity,
                                hint: "কেজি",
                                isNumberAndShowFraction: true,
                                isShowColumnData: false,
                                leftExpandedValue: 1,
                                rightExpandedValue: 1,
                              ),
                            ),
                            buildErrorHighlightWrapper(
                              key: amonDhanProvider.salesQuantityKey,
                              child: BuildInputFieldWidget(
                                tottoKhanAndOrganization
                                    ? "৪. অন্যকে প্রদানকৃত ফসলের পরিমাণ (বিক্রয়/বর্গা/সেচ/লীজ/অন্য কোন কারণে) পরিমাণ"
                                    : "২. গত এক বছরে বিক্রিত/মিলিং পণ্যের/ফসলের পরিমাণ",
                                amonDhanProvider.member.controllerSalesQuantity,
                                isNumberAndShowFraction: true,
                                isShowColumnData: false,
                                currentFocus: amonDhanProvider.member.focusNodeSalesQuantity,
                                hint: "কেজি",
                                onChanged: (v) {
                                  if (v.isEmpty) {
                                    amonDhanProvider.member.salesQuantity = null;
                                    surveyProvider.updatedData();
                                    return;
                                  }

                                  final double? parsed = double.tryParse(v);
                                  if (parsed == null) {
                                    // revert to previous valid value
                                    final prev = amonDhanProvider.member.salesQuantity?.toString() ?? '';
                                    amonDhanProvider.member.controllerSalesQuantity.text = prev;
                                    amonDhanProvider.member.controllerSalesQuantity.selection = TextSelection.fromPosition(TextPosition(offset: prev.length));
                                    return;
                                  }

                                  var value = tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo;

                                  if (parsed > value) {
                                    // revert
                                    final prev = amonDhanProvider.member.salesQuantity?.toString() ?? '';
                                    amonDhanProvider.member.controllerSalesQuantity.text = prev;
                                    amonDhanProvider.member.controllerSalesQuantity.selection = TextSelection.fromPosition(TextPosition(offset: prev.length));
                                    return;
                                  }

                                  amonDhanProvider.member.salesQuantity = parsed;
                                  surveyProvider.updatedData();
                                  if (v.isNotEmpty) {
                                    _errorHighlightController.clearHighlight(amonDhanProvider.salesQuantityKey.toString());
                                  }
                                },
                                leftExpandedValue: 1,
                                rightExpandedValue: 1,
                              ),
                            ),

                            tottoKhanAndOrganization
                                ? buildReadOnlyField(
                              "৫. নীট ফসলের পরিমাণ (কেজি)",
                              "${tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo}",
                              isColumn: false,
                            )
                                : spaceZero,

                            labelText('২ ${tottoKhanAndOrganization ? "কৃষি পণ্য/ফসল উৎপাদন/বিক্রয় সম্পর্কিত তথ্য:" : "কৃষি পণ্য উৎপাদন/বিক্রয় সম্পর্কিত তথ্য"}'),
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
                                  tottoKhanAndOrganization ? labelText("২.১ ফসল উৎপাদন/ মাছ চাষ/ গরু,মুরগী পালনের মূল উদ্দেশ্য কী?") : spaceZero,
                                  tottoKhanAndOrganization
                                      ? buildErrorHighlightWrapper(
                                    key: amonDhanProvider.uddesoKey,
                                    child: DynamicRadioList(
                                      items: productionPurposeList,
                                      value: amonDhanProvider.member.uddesshoType ?? OtherStaticModel(id: '-1', description: 'নির্বাচন করুন'),
                                      onValueChanged: (value) {
                                        if (value != null && value.id != '-1') {
                                          amonDhanProvider.member.changeUddesshoType(value);
                                          surveyProvider.updatedData();
                                        } else if (value?.id == '-1') {
                                          amonDhanProvider.member.changeUddesshoType(null);
                                          surveyProvider.updatedData();
                                        }
                                      },
                                      labelBuilder: (item) => item.description,
                                    ),
                                  )
                                      : spaceZero,
                                  tottoKhanAndOrganization ? spaceZero : labelText('২.১ আপনার ক্রয়কৃত ফসল/মাছ/গরু/মুরগী সংরক্ষণের স্থান কোনটি?'),
                                  tottoKhanAndOrganization ? spaceZero : spaceHeight5,

                                  tottoKhanAndOrganization
                                      ? spaceZero
                                      : buildErrorHighlightWrapper(
                                    key: amonDhanProvider.section3_2_PartTwoKey,
                                    child: DynamicCheckboxList(
                                      items: storageLocationList,
                                      selectedValues: amonDhanProvider.member.section3_2_PartTwoOne.toSet(),
                                      onChanged: (selected) {
                                        hideKeyboard();
                                        final previous = amonDhanProvider.member.section3_2_PartTwoOne.toSet();
                                        final added = selected.difference(previous);
                                        final removed = previous.difference(selected);
                                        for (final item in added) {
                                          amonDhanProvider.member.toggleSection3_2(item, 8);
                                        }
                                        for (final item in removed) {
                                          amonDhanProvider.member.toggleSection3_2(item, 8);
                                        }
                                        surveyProvider.updatedData();
                                      },
                                      labelBuilder: (item) => item.description,
                                    ),
                                  ),
                                  spaceHeight10,
                                  labelText(
                                    '২.২ ${tottoKhanAndOrganization ? "আপনার উৎপাদিত ফসল /চাষকৃত মাছ/পালিত গরু,মুরগী এর প্রসেসিং/উত্তোলন/মাড়াইয়ের স্থান কোনটি?" : "আপনার ক্রয়কৃত ফসল /চাষকৃত মাছ/পালিত গরু,মুরগী এর প্রসেসিং/উত্তোলন/মাড়াইয়ের স্থান কোনটি?"}',
                                  ),
                                  spaceHeight5,
                                  buildErrorHighlightWrapper(
                                    key: amonDhanProvider.section3_2_2Key,
                                    child: DynamicCheckboxList(
                                      items: tottoKhanAndOrganization ? productionLocationList : cultivationLocationList1,
                                      selectedValues: amonDhanProvider.member.section3_2_2List.toSet(),
                                      onChanged: (selected) {
                                        hideKeyboard();
                                        final previous = amonDhanProvider.member.section3_2_2List.toSet();
                                        final added = selected.difference(previous);
                                        final removed = previous.difference(selected);
                                        for (final item in added) {
                                          amonDhanProvider.member.toggleSection3_2(item, 2);
                                        }
                                        for (final item in removed) {
                                          amonDhanProvider.member.toggleSection3_2(item, 2);
                                        }
                                        surveyProvider.updatedData();
                                      },
                                      labelBuilder: (item) => item.description,
                                    ),
                                  ),
                                  spaceHeight10,
                                  labelText(
                                    '২.৩ ${tottoKhanAndOrganization ? "আপনার উৎপাদিত ফসল /চাষকৃত মাছ/পালিত গরু,মুরগী কিভাবে খানা/খামার পর্যন্ত পরিবহন করেন?" : "আপনার ক্রয়কৃত ফসল/মাছ/গরু/মুরগী কিভাবে পরিবহন করেন?"}',
                                  ),
                                  spaceHeight5,
                                  buildErrorHighlightWrapper(
                                    key: amonDhanProvider.section3_2_3Key,
                                    child: DynamicCheckboxList(
                                      items: packagingTypeList,
                                      selectedValues: amonDhanProvider.member.section3_2_3List.toSet(),
                                      onChanged: (selected) {
                                        hideKeyboard();
                                        final previous = amonDhanProvider.member.section3_2_3List.toSet();
                                        final added = selected.difference(previous);
                                        final removed = previous.difference(selected);
                                        for (final item in added) {
                                          amonDhanProvider.member.toggleSection3_2(item, 3);
                                        }
                                        for (final item in removed) {
                                          amonDhanProvider.member.toggleSection3_2(item, 3);
                                        }
                                        surveyProvider.updatedData();
                                      },
                                      labelBuilder: (item) => item.description,
                                      isOthersItem: (item) => item.id == '96',
                                      othersTextValue: amonDhanProvider.member.section3_2_3OtherText,
                                      onOthersTextChanged: (val) {
                                        amonDhanProvider.member.updateSection3_2OtherText(val, 3);
                                        surveyProvider.updatedData();
                                      },
                                    ),
                                  ),
                                  spaceHeight10,
                                  labelText(
                                    tottoKhanAndOrganization
                                        ? '২.৪ আপনার খানা/প্রতিষ্ঠানিক খামার পণ্য স্থানান্তরের জন্য কোনো পরিবহন ব্যবহার করেন কিনা? '
                                        : "২.৪ আপনার প্রতিষ্ঠান পণ্য স্থানান্তরের জন্য কোনো পরিবহন ব্যবহার করেন কিনা? ",
                                  ),
                                  buildErrorHighlightWrapper(
                                    key: amonDhanProvider.transportUseOrNotKey,
                                    child: DynamicRadioList(
                                      items: yesNoList,
                                      value: amonDhanProvider.member.transportUseOrNo,
                                      onValueChanged: (value) {
                                        hideKeyboard();
                                        if (value != null) {
                                          amonDhanProvider.member.changeTransportUseOrNo(value);
                                          surveyProvider.updatedData();
                                        }
                                      },
                                      labelBuilder: (item) => item.description,
                                    ),
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight10,
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : labelText(
                                    tottoKhanAndOrganization
                                        ? '২.৫ আপনার খানা/প্রতিষ্ঠানিক খামার কী ধরনের পরিবহন ব্যবহার করেন?'
                                        : "২.৫ আপনার প্রতিষ্ঠান কী ধরনের পরিবহন ব্যবহার করেন?",
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight5,
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : buildErrorHighlightWrapper(
                                    key: amonDhanProvider.transportTypeKey,
                                    child: DynamicCheckboxList(
                                      items: transportTypeList,
                                      selectedValues: amonDhanProvider.member.section3_2_6List.toSet(),
                                      onChanged: (selected) {
                                        hideKeyboard();
                                        final previous = amonDhanProvider.member.section3_2_6List.toSet();
                                        final added = selected.difference(previous);
                                        final removed = previous.difference(selected);
                                        for (final item in added) {
                                          amonDhanProvider.member.toggleSection3_2(item, 6);
                                        }
                                        for (final item in removed) {
                                          amonDhanProvider.member.toggleSection3_2(item, 6);
                                        }
                                        surveyProvider.updatedData();
                                      },
                                      labelBuilder: (item) => item.description,
                                      isOthersItem: (item) => item.id == '96',
                                      othersTextValue: amonDhanProvider.member.section3_2_6OtherText,
                                      onOthersTextChanged: (val) {
                                        amonDhanProvider.member.updateSection3_2OtherText(val, 6);
                                        surveyProvider.updatedData();
                                      },
                                    ),
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight10,
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : labelText(
                                    tottoKhanAndOrganization
                                        ? '২.৬ পরিবহনকালে কিভাবে প্যাকেজিং করেন (উত্তরদাতার পর্যায়ে ক্ষতি পরিবহন ব্যবস্থা) ?'
                                        : "২.৬ পরিবহনকালে কিভাবে প্যাকেজিং করেন (উত্তরদাতার পর্যায়ে ক্ষতি পরিবহন ব্যবস্থা) ?",
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight5,
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : buildErrorHighlightWrapper(
                                    key: amonDhanProvider.packageSelectKey,
                                    child: DynamicCheckboxList(
                                      items: packageUnitList,
                                      selectedValues: amonDhanProvider.member.section3_2_7List.toSet(),
                                      onChanged: (selected) {
                                        hideKeyboard();
                                        final previous = amonDhanProvider.member.section3_2_7List.toSet();
                                        final added = selected.difference(previous);
                                        final removed = previous.difference(selected);
                                        for (final item in added) {
                                          amonDhanProvider.member.toggleSection3_2(item, 7);
                                        }
                                        for (final item in removed) {
                                          amonDhanProvider.member.toggleSection3_2(item, 7);
                                        }
                                        surveyProvider.updatedData();
                                      },
                                      labelBuilder: (item) => item.description,
                                      isOthersItem: (item) => item.id == '96',
                                      othersTextValue: amonDhanProvider.member.section3_2_7OtherText,
                                      onOthersTextChanged: (val) {
                                        amonDhanProvider.member.updateSection3_2OtherText(val, 7);
                                        surveyProvider.updatedData();
                                      },
                                    ),
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight5,
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : labelText(
                                    tottoKhanAndOrganization
                                        ? '২.৭ উৎপাদিত পণ্য/ফসল মাঠ পযার্য় হতে খানা/প্রাতিষ্ঠানিক কৃষি খামারে স্থানান্তরের জন্য দূরত্ব (কিমি ও সময়) কত? '
                                        : "২.৭ ক্রয়কৃত ফসল/মাছ/মুরগী/গরু ক্রয়ের স্থান থেকে প্রতিষ্ঠানে স্থানান্তরের জন্য দূরত্ব (কি.মি ও সময়) কত?",
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight15,

                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : Row(
                                    children: [
                                      Expanded(
                                        child: buildErrorHighlightWrapper(
                                          key: amonDhanProvider.distanceKey,
                                          child: BuildInputFieldWidget(
                                            "দূরত্ব",
                                            amonDhanProvider.member.section3_1_8DistanceController,
                                            onChanged: (v) {
                                              amonDhanProvider.member.distanceLabel1_8 = v;
                                              surveyProvider.updatedData();
                                            },
                                            currentFocus: amonDhanProvider.member.section3_1_8DistanceFocusNode,
                                            nextFocus: amonDhanProvider.member.section3_1_8HourFocusNode,
                                            hint: "কিলোমিটার",
                                            isNumberAndShowFraction: true,
                                            // maxLength: 3,
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 16.w),
                                      Expanded(
                                        child: buildErrorHighlightWrapper(
                                          key: amonDhanProvider.hourKey,
                                          child: BuildInputFieldWidget(
                                            "ঘন্টা",
                                            amonDhanProvider.member.section3_1_8HourController,
                                            onChanged: (v) {
                                              amonDhanProvider.member.hourLabel1_8 = v;
                                              surveyProvider.updatedData();
                                            },
                                            currentFocus: amonDhanProvider.member.section3_1_8HourFocusNode,
                                            nextFocus: amonDhanProvider.member.section3_1_8MinuteFocusNode,
                                            hint: "ঘন্টা",
                                            // isNumber: true,
                                            isNumberAndShowFraction: true,
                                            // maxLength: 2,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        child: buildErrorHighlightWrapper(
                                          key: amonDhanProvider.minuteKey,
                                          child: BuildInputFieldWidget(
                                            "মিনিট",
                                            amonDhanProvider.member.section3_1_8MinuteController,
                                            onChanged: (v) {
                                              amonDhanProvider.member.minuteLabel1_8 = v;
                                              surveyProvider.updatedData();
                                            },
                                            currentFocus: amonDhanProvider.member.section3_1_8MinuteFocusNode,
                                            nextFocus: amonDhanProvider.member.section3_1_9DistanceFocusNode,
                                            hint: "মিনিট",
                                            isNumberAndShowFraction: true,
                                            // maxLength: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight5,
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : labelText(
                                    tottoKhanAndOrganization
                                        ? '২.৮ খানা/ প্রাতিষ্ঠানিক কৃষি খামার হতে যে বাজারে সাধারণত বিক্রয়/সরবরাহ করেন তার দূরত্ব (কিমি) ও সময় কত?'
                                        : '২.৮ প্রতিষ্ঠান হতে যে বাজারে সাধারণত বিক্রয়/সরবরাহ করেন তার দূরত্ব (কি.মি) ও সময় কত?',
                                  ),
                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : spaceHeight15,

                                  amonDhanProvider.member.transportUseOrNo == null ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '-1' ||
                                      amonDhanProvider.member.transportUseOrNo!.id == '2'
                                      ? spaceZero
                                      : Row(
                                    children: [
                                      Expanded(
                                        child: buildErrorHighlightWrapper(
                                          key: amonDhanProvider.distance2Key,
                                          child: BuildInputFieldWidget(
                                            "দূরত্ব",
                                            amonDhanProvider.member.section3_1_9DistanceController,
                                            onChanged: (v) {
                                              amonDhanProvider.member.distanceLabel1_9 = v;
                                              surveyProvider.updatedData();
                                            },
                                            currentFocus: amonDhanProvider.member.section3_1_9DistanceFocusNode,
                                            nextFocus: amonDhanProvider.member.section3_1_9HourFocusNode,
                                            hint: "কিলোমিটার",
                                            isNumberAndShowFraction: true,
                                            // maxLength: 3,
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 16.w),
                                      Expanded(
                                        child: buildErrorHighlightWrapper(
                                          key: amonDhanProvider.hour2Key,
                                          child: BuildInputFieldWidget(
                                            "ঘন্টা",
                                            amonDhanProvider.member.section3_1_9HourController,
                                            onChanged: (v) {
                                              amonDhanProvider.member.hourLabel1_9 = v;
                                              surveyProvider.updatedData();
                                            },
                                            currentFocus: amonDhanProvider.member.section3_1_9HourFocusNode,
                                            nextFocus: amonDhanProvider.member.section3_1_9MinuteFocusNode,
                                            hint: "ঘন্টা",
                                            isNumberAndShowFraction: true,
                                            // maxLength: 2,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        child: buildErrorHighlightWrapper(
                                          key: amonDhanProvider.minute2Key,
                                          child: BuildInputFieldWidget(
                                            "মিনিট",
                                            amonDhanProvider.member.section3_1_9MinuteController,
                                            onChanged: (v) {
                                              amonDhanProvider.member.minuteLabel1_9 = v;
                                              surveyProvider.updatedData();
                                            },
                                            currentFocus: amonDhanProvider.member.section3_1_9MinuteFocusNode,
                                            hint: "মিনিট",
                                            isNumberAndShowFraction: true,
                                            // maxLength: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    (tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo) <= 0
                        ? SliverToBoxAdapter(child: spaceZero)
                        : SliverPersistentHeader(
                      pinned: true,
                      delegate: helper_last.CenteredHeaderDelegate(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F0F4),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                            border: Border.all(color: AppTheme.listingBorderColor),
                          ),
                          child: Column(
                            children: [
                              Text('গত এক বছরে বিভিন্ন পর্যায়ে ক্ষতি', style: natoSansStyle700Bold.copyWith(fontSize: 15, color: Colors.black)),
                              spaceHeight5,
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'নীট ফসলের পরিমাণ ${formatNumber(tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo)} (কেজি)',
                                      style: natoSansStyle500Medium.copyWith(fontSize: 14, color: Colors.green.withValues(alpha: 0.8)),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        '${part == 1
                                            ? "ক্ষতিসহ মোট উৎপাদনের পরিমাণ (কেজি)"
                                            : part == 2
                                            ? "মোট বিক্রয়যোগ্য ফসলের পরিমাণ"
                                            : part == 3
                                            ? "ক্ষতি বাদে মোট ফসলের পরিমাণ"
                                            : part == 4
                                            ? "ক্ষতিবাদে মিলিংকৃত পণ্যের পরিমাণ"
                                            : "প্রসেসিং শেষে প্রাপ্ত মোট পণ্যের পরিমাণ"} ${part == 1 ? (() {
                                          final double lossQty = amonDhanProvider.member.module4ModelList!.fold(0, (sum, item) => sum + (item.lossAmountPerKg ?? 0));
                                          var value = lossQty + (tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo);
                                          return "${formatNumber(value)} (কেজি)";
                                        })() : (() {
                                          final double lossQty = amonDhanProvider.member.module4ModelList!.fold(0, (sum, item) => sum + (item.lossAmountPerKg ?? 0));
                                          return "${formatNumber(tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo - lossQty)} (কেজি)";
                                        })()}',
                                        style: natoSansStyle500Medium.copyWith(fontSize: 14, color: Colors.green.withValues(alpha: 0.8)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        minExtent: 94.0,
                        maxExtent: 94.0,
                      ),
                    ),

                    (tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo) <= 0
                        ? SliverToBoxAdapter(child: spaceZero)
                        : SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F0F4),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
                            border: Border.all(color: AppTheme.listingBorderColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...(amonDhanProvider.member.module4ModelList!.isEmpty
                                  ? [spaceZero]
                                  : List.generate(amonDhanProvider.member.module4ModelList!.length, (int index) {
                                final keyInputField = 'IF-$index';
                                final keyMachineUseOrNot = 'MUON-$index';
                                final keyReason = 'RE-$index';
                                Module4Model moduleData = amonDhanProvider.member.module4ModelList![index];
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.green,
                                            child: Text(moduleData.slNo.toString(), style: natoSansStyle600SemiBold.copyWith(fontSize: 13, color: Colors.white)),
                                          ),
                                          SizedBox(width: 20.h),
                                          Expanded(
                                            child: Text(moduleData.title ?? '', style: natoSansStyle600SemiBold.copyWith(fontSize: 13, color: Colors.green)),
                                          ),
                                        ],
                                      ),

                                      spaceHeight10,

                                      buildErrorHighlightWrapper(
                                        key: _getLossKey(keyInputField),
                                        child: BuildInputFieldWidget(
                                          'ক্ষতির পরিমাণ (কেজি) ',
                                          moduleData.lossQuantityPerKgController,
                                          onChanged: (v) {
                                            final double net = (tottoKhanAndOrganization
                                                ? amonDhanProvider.member.computedTotalQuantity
                                                : amonDhanProvider.member.computedTotalQuantityPartTwo);
                                            final isValid = amonDhanProvider.handleLossAmountInput(value: v, moduleData: moduleData, netQuantity: net, part: part);
                                            if (!isValid) {
                                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                                final prev = moduleData.lossAmountPerKg?.toString() ?? '';
                                                if (moduleData.lossQuantityPerKgController.text != prev) {
                                                  moduleData.lossQuantityPerKgController.value = TextEditingValue(
                                                    text: prev,
                                                    selection: TextSelection.fromPosition(TextPosition(offset: prev.length)),
                                                  );
                                                }
                                              });
                                              return;
                                            }
                                            amonDhanProvider.updatedData();
                                          },

                                          currentFocus: moduleData.lossQuantityPerKgFocusNode,
                                          hint: 'ক্ষতির পরিমাণ লিখুন',
                                          isNumberAndShowFraction: true,
                                          isShowColumnData: false,
                                          externalErrorText: _lossErrors['$index'],
                                          isMandatory: true,
                                          mandatoryMessage: _lossErrors['$index'],
                                        ),
                                      ),

                                      buildReadOnlyField(
                                        'ক্ষতির হার (%)',
                                        (() {
                                          final double lossWith =
                                          (tottoKhanAndOrganization
                                              ? amonDhanProvider.member.computedTotalQuantity
                                              : amonDhanProvider.member.computedTotalQuantityPartTwo)
                                              .toDouble();
                                          final double lossQty = (moduleData.lossAmountPerKg ?? 0).toDouble();
                                          final double lossRate = (lossQty * 100.0) / lossWith;
                                          if (lossRate == 0 || lossRate.isNaN) return '0%';
                                          return "${formatNumber(lossRate)}%";
                                        })(),
                                        isColumn: false,
                                      ),
                                      labelText('আপনি কি এই পর্যায়ে মেশিন ব্যবহার করেন?'),
                                      buildErrorHighlightWrapper(
                                        key: _getLossKey(keyMachineUseOrNot),
                                        child: DynamicRadioList(
                                          items: yesNoList,
                                          value: moduleData.useMachineOrNot,
                                          runSpacing: -20.h,
                                          onValueChanged: (value) {
                                            if (value != null) {
                                              amonDhanProvider.updateModule4(index, moduleData.copyWith(useMachineOrNot: value));
                                            }
                                          },
                                          labelBuilder: (item) => item.description,
                                        ),
                                      ),

                                      moduleData.lossAmountPerKg == null || moduleData.lossAmountPerKg! <= 0 || moduleData.lossAmountPerKg! == 0.0
                                          ? spaceZero
                                          : spaceHeight10,
                                      moduleData.lossAmountPerKg == null || moduleData.lossAmountPerKg! <= 0 || moduleData.lossAmountPerKg! == 0.0
                                          ? spaceZero
                                          : labelText('ক্ষতির প্রধান কারণ'),
                                      moduleData.typeList == null ||
                                          moduleData.lossAmountPerKg == null ||
                                          moduleData.lossAmountPerKg! <= 0 ||
                                          moduleData.lossAmountPerKg! == 0.0
                                          ? spaceZero
                                          : buildErrorHighlightWrapper(
                                        key: _getLossKey(keyReason),
                                        child: DynamicRadioList(
                                          items: moduleData.typeList!,
                                          value: moduleData.lossReasonData ?? OtherStaticModel(id: '-1', description: 'নির্বাচন করুন'),
                                          runSpacing: -20.h,
                                          onValueChanged: (value) {
                                            if (value != null && value.id != '-1') {
                                              amonDhanProvider.updateModule4(index, moduleData.copyWith(lossReasonData: value));
                                            }
                                          },
                                          labelBuilder: (item) => item.description,
                                          isOthersItem: (item) => item.id == '96',
                                          othersHint: 'নির্বাচন করুন',
                                          othersController: moduleData.otherReasonsController,
                                          onOthersTextChanged: (String value) {
                                            moduleData.updateOtherReasonsController(value);
                                          },
                                          othersTextValue: moduleData.otherReasons,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })),

                              spaceHeight10,
                            ],
                          ),
                        ),
                      ),
                    ),

                    (tottoKhanAndOrganization ? amonDhanProvider.member.computedTotalQuantity : amonDhanProvider.member.computedTotalQuantityPartTwo) <= 0
                        ? SliverToBoxAdapter(child: spaceZero)
                        : SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildNextButton(
                                () {
                              // providerSaveData.saveTempData();
                              showToastMessage('আংশিক সংরক্ষণ সম্পন্ন হয়েছে');
                              Get.offAllNamed(AppRoutes.dashboard);
                            },
                            title: 'আংশিক সংরক্ষণ করুন',
                            textColor: Colors.white,
                            btnColor: Colors.red,
                          ),
                          buildNextButton(() async {
                            if (validate(amonDhanProvider.member, tottoKhanAndOrganization, amonDhanProvider)) {
                              // providerSaveData.saveTempData(isDoneAll: true);
                              // surveyProvider.changeClickNoButtonFinally(false);
                              // surveyProvider.updateForm4Data(part, (isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo).toDouble());
                              Get.toNamed(AppRoutes.listingConfirmation);

                              // if (surveyProvider.selectedPageIndex < surveyProvider.module3ModelList.length - 1) {
                              //   amonDhanProvider.pageController.jumpToPage(surveyProvider.selectedPageIndex + 1);
                              // } else {
                              //
                              // }
                            } else {
                              // showToastMessage('অনুগ্রহ করে ফর্মটি সম্পূর্ণ করুন এবং ত্রুটিগুলো সংশোধন করুন', isError: true);
                            }
                          }, title: surveyProvider.selectedPageIndex < surveyProvider.module3ModelList.length - 1 ? 'পরবর্তী ফসলে যান' : 'শেষ করুন'),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: spaceHeight10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool checkStatus(List<Module4Model> itemLists) {
    double? totalLoss = 0;
    totalLoss += itemLists.fold(0, (sum, item) => sum + (item.lossAmountPerKg ?? 0));
    if (totalLoss == 0) {
      helper_last.showErrorAndScroll(
        'ক্ষতির সকল ইনপুট ফিল্ডের যোগফল ০ (শূন্য) হতে পারবে না। যেকোনো একটি ফিল্ডে অন্তত ১ বা তার বেশি মান থাকা প্রয়োজন।',
        key: lossKeys['IF-0'],
        focusNode: null,
        highlightController: _errorHighlightController,
      );
      return false;
    }

    for (int i = 0; i < itemLists.length; i++) {
      var item = itemLists[i];
      final keyInputField = 'IF-$i';
      final keyMachineUseOrNot = 'MUON-$i';
      final keyReason = 'RE-$i';
      if (item.lossAmountPerKg == null) {
        helper_last.showErrorAndScroll(
          'ক্ষতির পরিমাণ লিখুন',
          key: lossKeys[keyInputField],
          focusNode: item.lossQuantityPerKgFocusNode,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      // Validate useMachineOrNot
      if (item.useMachineOrNot == null) {
        helper_last.showErrorAndScroll('মেশিন ব্যবহারের তথ্য প্রদান করুন', key: lossKeys[keyMachineUseOrNot], focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
      // Validate lossReasonData if loss quantity > 0
      if (item.lossAmountPerKg != null && item.lossAmountPerKg! > 0 && (item.lossReasonData == null || item.lossReasonData!.id == '-1')) {
        helper_last.showErrorAndScroll('ক্ষতির প্রধান কারণ নির্বাচন করুন', key: lossKeys[keyReason], focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
    }
    return true;
  }

  bool validate(Module3Model member, bool isPartOne, var provider) {
    // Reset all errors
    for (var key in _lossErrors.keys) {
      _lossErrors[key] = null;
    }

    // Check required fields
    if (isPartOne) {
      if (member.landQuantity == null || member.landQuantity! < 0) {
        helper_last.showErrorAndScroll(
          'আবাদকৃত জমির পরিমাণ লিখুন',
          key: provider.landQuantityKey,
          focusNode: member.focusNodeLandQuantity,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.productionQuantity == null || member.productionQuantity! < 0) {
        helper_last.showErrorAndScroll(
          'পণ্য/উৎপাদিত ফসলের পরিমাণ লিখুন',
          key: provider.productionQuantityKey,
          focusNode: member.focusNodeProductionQuantity,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.otherSourceQuantity == null || member.otherSourceQuantity! < 0) {
        helper_last.showErrorAndScroll(
          'অন্যান্য উৎস থেকে প্রাপ্ত ফসলের পরিমাণ লিখুন',
          key: provider.otherSourceQuantityKey,
          focusNode: member.focusNodeOtherSourceQuantity,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.salesQuantity == null || member.salesQuantity! < 0) {
        helper_last.showErrorAndScroll(
          'অন্যকে প্রদানকৃত ফসলের পরিমাণ লিখুন',
          key: provider.salesQuantityKey,
          focusNode: member.focusNodeSalesQuantity,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.uddesshoType == null) {
        helper_last.showErrorAndScroll('উদ্দেশ্য নির্বাচন করুন', key: provider.uddesoKey, focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
      if (member.section3_2_2List.isEmpty) {
        helper_last.showErrorAndScroll(
          'প্রসেসিং/উত্তোলন/মাড়াইয়ের স্থান নির্বাচন করুন',
          key: provider.section3_2_2Key,
          focusNode: null,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.section3_2_3List.isEmpty) {
        helper_last.showErrorAndScroll('পরিবহনের পদ্ধতি নির্বাচন করুন', key: provider.section3_2_3Key, focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
      if (member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1') {
        helper_last.showErrorAndScroll('পরিবহন ব্যবহারের তথ্য প্রদান করুন', key: provider.transportUseOrNotKey, focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
      if (member.transportUseOrNo!.id == '1') {
        if (member.section3_2_6List.isEmpty) {
          helper_last.showErrorAndScroll('পরিবহনের ধরন নির্বাচন করুন', key: provider.transportTypeKey, focusNode: null, highlightController: _errorHighlightController);
          return false;
        }
        if (member.section3_2_7List.isEmpty) {
          helper_last.showErrorAndScroll('প্যাকেজিংয়ের ধরন নির্বাচন করুন', key: provider.packageSelectKey, focusNode: null, highlightController: _errorHighlightController);
          return false;
        }
        if (member.distanceLabel1_8!.isEmpty || member.hourLabel1_8!.isEmpty || member.minuteLabel1_8!.isEmpty) {
          helper_last.showErrorAndScroll(
            'মাঠ থেকে খামারে স্থানান্তরের দূরত্ব এবং সময় লিখুন',
            key: provider.distanceKey,
            focusNode: member.section3_1_8DistanceFocusNode,
            highlightController: _errorHighlightController,
          );
          return false;
        }
        if (member.distanceLabel1_9!.isEmpty || member.hourLabel1_9!.isEmpty || member.minuteLabel1_9!.isEmpty) {
          helper_last.showErrorAndScroll(
            'খামার থেকে বাজারে স্থানান্তরের দূরত্ব এবং সময় লিখুন',
            key: provider.distance2Key,
            focusNode: member.section3_1_9DistanceFocusNode,
            highlightController: _errorHighlightController,
          );
          return false;
        }
      }
    } else {
      if (member.otherSourceQuantity == null || member.otherSourceQuantity! <= 0) {
        helper_last.showErrorAndScroll(
          'ক্রয়কৃত/ মিলিং/ প্রসেস করার জন্য ব্যবহৃত ফসলের পরিমাণ লিখুন',
          key: provider.otherSourceQuantityKey,
          focusNode: member.focusNodeOtherSourceQuantity,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.salesQuantity == null || member.salesQuantity! <= 0) {
        helper_last.showErrorAndScroll(
          'বিক্রিত/মিলিং পণ্যের/ফসলের পরিমাণ লিখুন',
          key: provider.salesQuantityKey,
          focusNode: member.focusNodeSalesQuantity,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.section3_2_PartTwoOne.isEmpty) {
        helper_last.showErrorAndScroll('সংরক্ষণের স্থান নির্বাচন করুন', key: provider.section3_2_PartTwoKey, focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
      if (member.section3_2_2List.isEmpty) {
        helper_last.showErrorAndScroll(
          'প্রসেসিং/উত্তোলন/মাড়াইয়ের স্থান নির্বাচন করুন',
          key: provider.section3_2_2Key,
          focusNode: null,
          highlightController: _errorHighlightController,
        );
        return false;
      }
      if (member.section3_2_3List.isEmpty) {
        helper_last.showErrorAndScroll('পরিবহনের পদ্ধতি নির্বাচন করুন', key: provider.section3_2_3Key, focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
      if (member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1') {
        helper_last.showErrorAndScroll('পরিবহন ব্যবহারের তথ্য প্রদান করুন', key: provider.transportUseOrNotKey, focusNode: null, highlightController: _errorHighlightController);
        return false;
      }
      if (member.transportUseOrNo!.id == '1') {
        if (member.section3_2_6List.isEmpty) {
          helper_last.showErrorAndScroll('পরিবহনের ধরন নির্বাচন করুন', key: provider.transportTypeKey, focusNode: null, highlightController: _errorHighlightController);
          return false;
        }
        if (member.section3_2_7List.isEmpty) {
          helper_last.showErrorAndScroll('প্যাকেজিংয়ের ধরন নির্বাচন করুন', key: provider.packageSelectKey, focusNode: null, highlightController: _errorHighlightController);
          return false;
        }
        if (member.distanceLabel1_8!.isEmpty || member.hourLabel1_8!.isEmpty || member.minuteLabel1_8!.isEmpty) {
          helper_last.showErrorAndScroll(
            'ক্রয়ের স্থান থেকে প্রতিষ্ঠানে স্থানান্তরের দূরত্ব এবং সময় লিখুন',
            key: provider.distanceKey,
            focusNode: member.section3_1_8DistanceFocusNode,
            highlightController: _errorHighlightController,
          );
          return false;
        }
        if (member.distanceLabel1_9!.isEmpty || member.hourLabel1_9!.isEmpty || member.minuteLabel1_9!.isEmpty) {
          helper_last.showErrorAndScroll(
            'প্রতিষ্ঠান থেকে বাজারে স্থানান্তরের দূরত্ব এবং সময় লিখুন',
            key: provider.distance2Key,
            focusNode: member.section3_1_9DistanceFocusNode,
            highlightController: _errorHighlightController,
          );
          return false;
        }
      }
    }

    // Check loss quantities
    final double lossQty = provider.member.module4ModelList!.fold(0, (sum, item) => sum + (item.lossAmountPerKg ?? 0));
    final double totalQty = isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo;
    if (lossQty > totalQty) {
      helper_last.showErrorAndScroll('ক্ষতির পরিমাণ মোট উৎপাদনের পরিমাণের চেয়ে বেশি হতে পারে না', key: null, focusNode: null, highlightController: _errorHighlightController);
      return false;
    }

    if (provider.member.module4ModelList!.isNotEmpty) {
      return checkStatus(provider.member.module4ModelList!);
    }
    return true;
  }

  // Wrapper to apply error highlight to a container
  Widget buildErrorHighlightWrapper({required GlobalKey key, required Widget child}) {
    return helper_last.buildErrorHighlightWrapper(key: key, child: child, hasError: _errorHighlightController.hasHighlight(key.toString()));
  }
}
