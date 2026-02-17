// import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
// import 'package:bpls_mobile/core/theme/theme.dart';
// import 'package:bpls_mobile/datasource/model/module_3_model.dart';
// import 'package:bpls_mobile/datasource/model/module_4_model.dart';
// import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
// import 'package:bpls_mobile/helper/helper.dart';
// import 'package:bpls_mobile/routes/app_pages.dart';
// import 'package:bpls_mobile/utils/size.util.dart';
// import 'package:bpls_mobile/utils/text.styles.dart';
// import 'package:bpls_mobile/widget/checkbox_widget.dart';
// import 'package:bpls_mobile/widget/custom_widget.dart';
// import 'package:bpls_mobile/widget/radio_widget.dart';
// import 'package:bpls_mobile/widget/searchable_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
//
// class Module34ScreenCopy extends StatefulWidget {
//   const Module34ScreenCopy({super.key});
//
//   @override
//   State<Module34ScreenCopy> createState() => _Module34ScreenCopyState();
// }
//
// class _Module34ScreenCopyState extends State<Module34ScreenCopy> {
//   late PageController _pageController;
//
//   // Map to track inline error messages for loss inputs per (type-index) key
//   final Map<String, String?> _lossErrors = {};
//
//   // Map to track inline error messages per page (index) and field
//   final Map<int, Map<String, String?>> _pageErrors = {};
//
//   ScrollController scrollController = ScrollController();
//
//   GlobalKey landQuantityKey = GlobalKey();
//   GlobalKey productionQuantityKey = GlobalKey();
//   GlobalKey otherSourceQuantityKey = GlobalKey();
//   GlobalKey salesQuantityKey = GlobalKey();
//   GlobalKey distanceKey = GlobalKey();
//   GlobalKey hourKey = GlobalKey();
//   GlobalKey minuteKey = GlobalKey();
//   GlobalKey distance2Key = GlobalKey();
//   GlobalKey hour2Key = GlobalKey();
//   GlobalKey minute2Key = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final surveyProvider = Provider.of<SurveyProvider>(context);
//     int part = (surveyProvider.selectedTottoType.id == '1' || surveyProvider.selectedTottoType.id == '2')
//         ? 1
//         : (surveyProvider.selectedTottoType.id == '3' || surveyProvider.selectedTottoType.id == '4')
//         ? 2
//         : (surveyProvider.selectedTottoType.id == '6')
//         ? 3
//         : (surveyProvider.selectedTottoType.id == '5')
//         ? 4
//         : 5;
//
//     // Check if module3ModelList is empty
//     if (surveyProvider.module3ModelList.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Icon(Icons.arrow_circle_left_outlined, size: 26, color: AppTheme.listingButtonColor),
//           ),
//           title: Text('কোন ফসল নির্বাচন করা হয়নি'),
//         ),
//         body: Center(
//           child: Text(
//             'অনুগ্রহ করে জরিপ পরিচালনার জন্য ফসল নির্বাচন করুন।',
//             style: TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       );
//     }
//
//     String title = '${surveyProvider.module3ModelList[surveyProvider.selectedPageIndex].otherStaticModel!.description} (গত এক বছরে)';
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             if (surveyProvider.selectedPageIndex > 0) {
//               _pageController.jumpToPage(surveyProvider.selectedPageIndex - 1);
//             } else {
//               Get.back();
//             }
//           },
//           icon: Icon(Icons.arrow_circle_left_outlined, size: 26, color: AppTheme.listingButtonColor),
//         ),
//         title: Text(title),
//         actions: [
//           // spaceWeight20,
//         ],
//         toolbarHeight: 40,
//       ),
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: surveyProvider.module3ModelList.length,
//         physics: NeverScrollableScrollPhysics(),
//         onPageChanged: (int val) {
//           surveyProvider.changeSelectedPageIndex(val);
//         },
//         itemBuilder: (context, index) {
//           bool isPartOne = surveyProvider.selectedTottoType.id == '1' || surveyProvider.selectedTottoType.id == '2';
//           final member = surveyProvider.module3ModelList[index];
//
//           return Column(
//             children: [
//               Expanded(
//                 child: CustomScrollView(
//                   physics: BouncingScrollPhysics(),
//                   slivers: [
//                     SliverToBoxAdapter(
//                       child: Container(
//                         padding: EdgeInsets.only(left: 20, right: 20, bottom: 10,top: 15),
//                         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             isPartOne == false
//                                 ? spaceZero
//                                 : BuildInputFieldWidget(
//                               "১. আবাদকৃত জমির পরিমাণ",
//                               member.controllerLandQuantity,
//                               onChanged: (v) {
//                                 // surveyProvider.updateModule3(index, member.copyWith(landQuantity: v.isEmpty?null:int.parse(v)));
//                                 member.landQuantity = v.isEmpty ? null : int.parse(v);
//                                 surveyProvider.updatedData();
//                               },
//                               currentFocus: member.focusNodeLandQuantity,
//                               nextFocus: member.focusNodeProductionQuantity,
//                               hint: "শতক",
//                               isNumber: true,
//                               isShowColumnData: false,
//                               leftExpandedValue: 1,
//                               rightExpandedValue: 1,
//                               externalErrorText: _pageErrors[index]?['landQuantity'],
//                             ),
//                             isPartOne == false
//                                 ? spaceZero
//                                 : BuildInputFieldWidget(
//                               "২. পণ্য/উৎপাদিত ফসলের পরিমাণ ",
//                               member.controllerProductionQuantity,
//                               onChanged: (v) {
//                                 member.productionQuantity = v.isEmpty ? null : int.parse(v);
//                                 surveyProvider.updatedData();
//                               },
//                               currentFocus: member.focusNodeProductionQuantity,
//                               nextFocus: member.focusNodeOtherSourceQuantity,
//                               hint: "কেজি",
//                               isNumber: true,
//                               isShowColumnData: false,
//                               leftExpandedValue: 1,
//                               rightExpandedValue: 1,
//                               externalErrorText: _pageErrors[index]?['productionQuantity'],
//                             ),
//                             // spaceHeight20,
//                             BuildInputFieldWidget(
//                               isPartOne ? "৩. অন্যান্য উৎস থেকে (বর্গা/লীজ/ক্রয়কৃত) প্রাপ্ত ফসলের পরিমাণ" : "২ গত এক বছরে ক্রয়কৃত/ মিলিং/ প্রসেস করার জন্য ব্যবহৃত ফসলের পরিমাণ",
//                               member.controllerOtherSourceQuantity,
//                               onChanged: (v) {
//                                 member.otherSourceQuantity = v.isEmpty ? null : int.parse(v);
//                                 surveyProvider.updatedData();
//                               },
//                               currentFocus: member.focusNodeOtherSourceQuantity,
//                               nextFocus: member.focusNodeSalesQuantity,
//                               hint: "কেজি",
//                               isNumber: true,
//                               isShowColumnData: false,
//                               leftExpandedValue: 1,
//                               rightExpandedValue: 1,
//                               externalErrorText: _pageErrors[index]?['otherSourceQuantity'],
//                             ),
//                             BuildInputFieldWidget(
//                               isPartOne ? "৪. অন্যকে প্রদানকৃত ফসলের পরিমাণ (বিক্রয়/বর্গা/সেচ/লীজ/অন্য কোন কারণে) পরিমাণ" : "১.৩ গত এক বছরে বিক্রিত/মিলিং পণ্যের/ফসলের পরিমাণ",
//                               member.controllerSalesQuantity,
//                               isNumber: true,
//                               isShowColumnData: false,
//                               currentFocus: member.focusNodeSalesQuantity,
//                               hint: "কেজি",
//                               externalErrorText: _pageErrors[index]?['salesQuantity'],
//                               onChanged: (v) {
//                                 // Allow empty (deletion) — clear stored value and update provider
//                                 if (v.isEmpty) {
//                                   setState(() {
//                                     _pageErrors[index] ??= {};
//                                     _pageErrors[index]!['salesQuantity'] = null;
//                                   });
//                                   member.salesQuantity = null;
//                                   surveyProvider.updatedData();
//                                   return;
//                                 }
//
//                                 final int? parsed = int.tryParse(v);
//                                 if (parsed == null) {
//                                   // revert to previous valid value
//                                   final prev = member.salesQuantity?.toString() ?? '';
//                                   member.controllerSalesQuantity.text = prev;
//                                   member.controllerSalesQuantity.selection = TextSelection.fromPosition(TextPosition(offset: prev.length));
//                                   return;
//                                 }
//
//                                 var value = isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo;
//
//                                 if (parsed > value) {
//                                   // Set external error text to show inline error
//                                   setState(() {
//                                     _pageErrors[index] ??= {};
//                                     _pageErrors[index]!['salesQuantity'] = "বিক্রিত/প্রদানকৃত ফসলের পরিমাণ নীট ফসলের পরিমাণের চেয়ে বেশি হতে পারে না";
//                                   });
//                                   final prev = member.salesQuantity?.toString() ?? '';
//                                   member.controllerSalesQuantity.text = prev;
//                                   member.controllerSalesQuantity.selection = TextSelection.fromPosition(TextPosition(offset: prev.length));
//                                   return;
//                                 }
//
//                                 // valid
//                                 setState(() {
//                                   if (_pageErrors[index]?['salesQuantity'] != null) _pageErrors[index]!['salesQuantity'] = null;
//                                 });
//                                 member.salesQuantity = parsed;
//                                 surveyProvider.updatedData();
//                               },
//                               // externalErrorText: _salesError,
//                               leftExpandedValue: 1,
//                               rightExpandedValue: 1,
//                             ),
//
//                             isPartOne ? buildReadOnlyField("৫. নীট ফসলের পরিমাণ (কেজি)", "${isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo}", isColumn: false) : spaceZero,
//
//                             labelText('২ ${isPartOne ? "কৃষি পণ্য/ফসল উৎপাদন/বিক্রয় সম্পর্কিত তথ্য:" : "কৃষি পণ্য উৎপাদন/বিক্রয় সম্পর্কিত তথ্য"}'),
//                             SizedBox(height: 24.h),
//                             Container(
//                               width: double.infinity,
//                               padding: EdgeInsets.all(16.r),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFF1F0F4),
//                                 borderRadius: BorderRadius.circular(8.r),
//                                 border: Border.all(color: AppTheme.listingBorderColor),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   isPartOne ? labelText("২.১ ফসল উৎপাদন/ মাছ চাষ/ গরু,মুরগী পালনের মূল উদ্দেশ্য কী?") : spaceZero,
//                                   isPartOne
//                                       ? DynamicRadioList(
//                                     items: productionPurposeList,
//                                     value: member.uddesshoType ?? OtherStaticModel(id: '-1', description: 'নির্বাচন করুন'),
//                                     onValueChanged: (value) {
//                                       if (value != null && value.id != '-1') {
//                                         member.changeUddesshoType(value);
//                                         surveyProvider.updatedData();
//                                         setState(() {
//                                           _pageErrors[index]?['radioError'] = null;
//                                         });
//                                       } else if (value?.id == '-1') {
//                                         member.changeUddesshoType(null);
//                                         surveyProvider.updatedData();
//                                       }
//                                     },
//                                     labelBuilder: (item) => item.description,
//                                   )
//                                       : spaceZero,
//                                   if (_pageErrors[index]?['radioError'] != null) Padding(padding: EdgeInsets.only(top: 8.h), child: Text(_pageErrors[index]!['radioError']!, style: TextStyle(color: Colors.red, fontSize: 12))),
//                                   isPartOne ? spaceZero : labelText('২.১ আপনার ক্রয়কৃত ফসল/মাছ/গরু/মুরগী সংরক্ষণের স্থান কোনটি?'),
//                                   isPartOne ? spaceZero : spaceHeight5,
//
//                                   isPartOne
//                                       ? spaceZero
//                                       : DynamicCheckboxList(
//                                     items: storageLocationList,
//                                     selectedValues: member.section3_2_PartTwoOne.toSet(),
//                                     onChanged: (selected) {
//                                       final previous = member.section3_2_PartTwoOne.toSet();
//                                       final added = selected.difference(previous);
//                                       final removed = previous.difference(selected);
//                                       for (final item in added) {
//                                         member.toggleSection3_2(item, 8);
//                                       }
//                                       for (final item in removed) {
//                                         member.toggleSection3_2(item, 8);
//                                       }
//                                       surveyProvider.updatedData();
//                                       setState(() {
//                                         if (selected.isNotEmpty) {
//                                           _pageErrors[index]?['storageError'] = null;
//                                         }
//                                       });
//                                     },
//                                     labelBuilder: (item) => item.description,
//                                   ),
//                                   if (_pageErrors[index]?['storageError'] != null) Padding(padding: EdgeInsets.only(top: 8.h), child: Text(_pageErrors[index]!['storageError']!, style: TextStyle(color: Colors.red, fontSize: 12))),
//                                   spaceHeight10,
//                                   labelText('২.২ ${isPartOne ? "আপনার উৎপাদিত ফসল /চাষকৃত মাছ/পালিত গরু,মুরগী এর প্রসেসিং/উত্তোলন/মাড়াইয়ের স্থান কোনটি?" : "আপনার ক্রয়কৃত ফসল /চাষকৃত মাছ/পালিত গরু,মুরগী এর প্রসেসিং/উত্তোলন/মাড়াইয়ের স্থান কোনটি?"}'),
//                                   spaceHeight5,
//                                   DynamicCheckboxList(
//                                     items: isPartOne ? productionLocationList : cultivationLocationList1,
//                                     selectedValues: member.section3_2_2List.toSet(),
//                                     onChanged: (selected) {
//                                       final previous = member.section3_2_2List.toSet();
//                                       final added = selected.difference(previous);
//                                       final removed = previous.difference(selected);
//                                       for (final item in added) {
//                                         member.toggleSection3_2(item, 2);
//                                       }
//                                       for (final item in removed) {
//                                         member.toggleSection3_2(item, 2);
//                                       }
//                                       surveyProvider.updatedData();
//                                       setState(() {
//                                         if (selected.isNotEmpty) {
//                                           _pageErrors[index]?['processingError'] = null;
//                                         }
//                                       });
//                                     },
//                                     labelBuilder: (item) => item.description,
//                                   ),
//                                   if (_pageErrors[index]?['processingError'] != null) Padding(padding: EdgeInsets.only(top: 8.h), child: Text(_pageErrors[index]!['processingError']!, style: TextStyle(color: Colors.red, fontSize: 12))),
//                                   spaceHeight10,
//                                   labelText('২.৩ ${isPartOne ? "আপনার উৎপাদিত ফসল /চাষকৃত মাছ/পালিত গরু,মুরগী কিভাবে খানা/খামার পর্যন্ত পরিবহন করেন?" : "আপনার ক্রয়কৃত ফসল/মাছ/গরু/মুরগী কিভাবে পরিবহন করেন?"}'),
//                                   spaceHeight5,
//                                   DynamicCheckboxList(
//                                     items: packagingTypeList,
//                                     selectedValues: member.section3_2_3List.toSet(),
//                                     onChanged: (selected) {
//                                       final previous = member.section3_2_3List.toSet();
//                                       final added = selected.difference(previous);
//                                       final removed = previous.difference(selected);
//                                       for (final item in added) {
//                                         member.toggleSection3_2(item, 3);
//                                       }
//                                       for (final item in removed) {
//                                         member.toggleSection3_2(item, 3);
//                                       }
//                                       surveyProvider.updatedData();
//                                       setState(() {
//                                         if (selected.isNotEmpty) {
//                                           _pageErrors[index]?['transportMethodError'] = null;
//                                         }
//                                       });
//                                     },
//                                     labelBuilder: (item) => item.description,
//                                     isOthersItem: (item) => item.id == '96',
//                                     othersTextValue: member.section3_2_3OtherText,
//                                     onOthersTextChanged: (val) {
//                                       member.updateSection3_2OtherText(val, 3);
//                                       surveyProvider.updatedData();
//                                     },
//                                   ),
//                                   if (_pageErrors[index]?['transportMethodError'] != null) Padding(padding: EdgeInsets.only(top: 8.h), child: Text(_pageErrors[index]!['transportMethodError']!, style: TextStyle(color: Colors.red, fontSize: 12))),
//                                   spaceHeight10,
//                                   labelText(isPartOne ? '২.৫ আপনার খানা/প্রতিষ্ঠানিক খামার পণ্য স্থানান্তরের জন্য কোনো পরিবহন ব্যবহার করেন কিনা? ' : "২.৪ আপনার প্রতিষ্ঠান পণ্য স্থানান্তরের জন্য কোনো পরিবহন ব্যবহার করেন কিনা? "),
//                                   DynamicRadioList(
//                                     items: yesNoList,
//                                     value: member.transportUseOrNo,
//                                     onValueChanged: (value) {
//                                       if (value != null) {
//                                         member.changeTransportUseOrNo(value);
//                                         surveyProvider.updatedData();
//                                         setState(() {
//                                           _pageErrors[index]?['transportError'] = null;
//                                         });
//                                       }
//                                     },
//                                     labelBuilder: (item) => item.description,
//                                   ),
//                                   if (_pageErrors[index]?['transportError'] != null) Padding(padding: EdgeInsets.only(top: 8.h), child: Text(_pageErrors[index]!['transportError']!, style: TextStyle(color: Colors.red, fontSize: 12))),
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2' ? spaceZero : spaceHeight10,
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       : labelText(isPartOne ? '২.৬ আপনার খানা/প্রতিষ্ঠানিক খামার কী ধরনের পরিবহন ব্যবহার করেন?' : "২.৫ আপনার প্রতিষ্ঠান কী ধরনের পরিবহন ব্যবহার করেন?"),
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2' ? spaceZero : spaceHeight5,
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       : DynamicCheckboxList(
//                                     items: transportTypeList,
//                                     selectedValues: member.section3_2_6List.toSet(),
//                                     onChanged: (selected) {
//                                       final previous = member.section3_2_6List.toSet();
//                                       final added = selected.difference(previous);
//                                       final removed = previous.difference(selected);
//                                       for (final item in added) {
//                                         member.toggleSection3_2(item, 6);
//                                       }
//                                       for (final item in removed) {
//                                         member.toggleSection3_2(item, 6);
//                                       }
//                                       surveyProvider.updatedData();
//                                       setState(() {
//                                         if (selected.isNotEmpty) {
//                                           _pageErrors[index]?['transportTypeError'] = null;
//                                         }
//                                       });
//                                     },
//                                     labelBuilder: (item) => item.description,
//                                     isOthersItem: (item) => item.id == '96',
//                                     othersTextValue: member.section3_2_6OtherText,
//                                     onOthersTextChanged: (val) {
//                                       member.updateSection3_2OtherText(val, 6);
//                                       surveyProvider.updatedData();
//                                     },
//                                   ),
//                                   if (_pageErrors[index]?['transportTypeError'] != null) Padding(padding: EdgeInsets.only(top: 8.h), child: Text(_pageErrors[index]!['transportTypeError']!, style: TextStyle(color: Colors.red, fontSize: 12))),
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2' ? spaceZero : spaceHeight10,
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       : labelText(isPartOne ? '২.৭ পরিবহনকালে কিভাবে প্যাকেজিং করেন (উত্তরদাতার পর্যায়ে ক্ষতি পরিবহন ব্যবস্থা) ?' : "২.৬ পরিবহনকালে কিভাবে প্যাকেজিং করেন (উত্তরদাতার পর্যায়ে ক্ষতি পরিবহন ব্যবস্থা) ?"),
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2' ? spaceZero : spaceHeight5,
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       : DynamicCheckboxList(
//                                     items: packageUnitList,
//                                     selectedValues: member.section3_2_7List.toSet(),
//                                     onChanged: (selected) {
//                                       final previous = member.section3_2_7List.toSet();
//                                       final added = selected.difference(previous);
//                                       final removed = previous.difference(selected);
//                                       for (final item in added) {
//                                         member.toggleSection3_2(item, 7);
//                                       }
//                                       for (final item in removed) {
//                                         member.toggleSection3_2(item, 7);
//                                       }
//                                       surveyProvider.updatedData();
//                                       setState(() {
//                                         if (selected.isNotEmpty) {
//                                           _pageErrors[index]?['packagingError'] = null;
//                                         }
//                                       });
//                                     },
//                                     labelBuilder: (item) => item.description,
//                                     isOthersItem: (item) => item.id == '96',
//                                     othersTextValue: member.section3_2_7OtherText,
//                                     onOthersTextChanged: (val) {
//                                       member.updateSection3_2OtherText(val, 7);
//                                       surveyProvider.updatedData();
//                                     },
//                                   ),
//                                   if (_pageErrors[index]?['packagingError'] != null) Padding(padding: EdgeInsets.only(top: 8.h), child: Text(_pageErrors[index]!['packagingError']!, style: TextStyle(color: Colors.red, fontSize: 12))),
//                                   spaceHeight5,
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       :labelText(
//                                     isPartOne
//                                         ? '২.৮ উৎপাদিত পণ্য/ফসল মাঠ পযার্য় হতে খানা/প্রাতিষ্ঠানিক কৃষি খামারে স্থানান্তরের জন্য দূরত্ব (কিমি ও সময়) কত? '
//                                         : "২.৭ ক্রয়কৃত ফসল/মাছ/মুরগী/গরু ক্রয়ের স্থান থেকে প্রতিষ্ঠানে স্থানান্তরের জন্য দূরত্ব (কি.মি ও সময়) কত?",
//                                   ),
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       :spaceHeight15,
//
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       :Row(
//                                     children: [
//                                       Expanded(
//                                         child: BuildInputFieldWidget(
//                                           "দূরত্ব",
//                                           member.section3_1_8DistanceController,
//                                           onChanged: (v) {
//                                             member.distanceLabel1_8 = v;
//                                             surveyProvider.updatedData();
//                                           },
//                                           currentFocus: member.section3_1_8DistanceFocusNode,
//                                           nextFocus: member.section3_1_8HourFocusNode,
//                                           hint: "কিলোমিটার",
//                                           isNumber: true,
//                                           maxLength: 3,
//                                           externalErrorText: _pageErrors[index]?['distance'],
//                                         ),
//                                       ),
//
//                                       SizedBox(width: 16.w),
//                                       Expanded(
//                                         child: BuildInputFieldWidget(
//                                           "ঘন্টা",
//                                           member.section3_1_8HourController,
//                                           onChanged: (v) {
//                                             member.hourLabel1_8 = v;
//                                             surveyProvider.updatedData();
//                                           },
//                                           currentFocus: member.section3_1_8HourFocusNode,
//                                           nextFocus: member.section3_1_8MinuteFocusNode,
//                                           hint: "ঘন্টা",
//                                           isNumber: true,
//                                           maxLength: 2,
//                                           externalErrorText: _pageErrors[index]?['hour'],
//                                         ),
//                                       ),
//                                       SizedBox(width: 16.w),
//                                       Expanded(
//                                         child: BuildInputFieldWidget(
//                                           "মিনিট",
//                                           member.section3_1_8MinuteController,
//                                           onChanged: (v) {
//                                             member.minuteLabel1_8 = v;
//                                             surveyProvider.updatedData();
//                                           },
//                                           currentFocus: member.section3_1_8MinuteFocusNode,
//                                           nextFocus: member.section3_1_9DistanceFocusNode,
//                                           hint: "মিনিট",
//                                           isNumber: true,
//                                           maxLength: 2,
//                                           externalErrorText: _pageErrors[index]?['minute'],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       :spaceHeight5,
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       :labelText(
//                                     isPartOne ? '২.৯ খানা/ প্রাতিষ্ঠানিক কৃষি খামার হতে যে বাজারে সাধারণত বিক্রয়/সরবরাহ করেন তার দূরত্ব (কিমি) ও সময় কত?' : '২.৮ প্রতিষ্ঠান হতে যে বাজারে সাধারণত বিক্রয়/সরবরাহ করেন তার দূরত্ব (কি.মি) ও সময় কত?',
//                                   ),
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       :spaceHeight15,
//
//                                   member.transportUseOrNo == null || member.transportUseOrNo!.id == '-1' || member.transportUseOrNo!.id == '2'
//                                       ? spaceZero
//                                       :Row(
//                                     children: [
//                                       Expanded(
//                                         child: BuildInputFieldWidget(
//                                           "দূরত্ব",
//                                           member.section3_1_9DistanceController,
//                                           onChanged: (v) {
//                                             member.distanceLabel1_9 = v;
//                                             surveyProvider.updatedData();
//                                           },
//                                           currentFocus: member.section3_1_9DistanceFocusNode,
//                                           nextFocus: member.section3_1_9HourFocusNode,
//                                           hint: "কিলোমিটার",
//                                           isNumber: true,
//                                           maxLength: 3,
//                                           externalErrorText: _pageErrors[index]?['distance2'],
//                                         ),
//                                       ),
//
//                                       SizedBox(width: 16.w),
//                                       Expanded(
//                                         child: BuildInputFieldWidget(
//                                           "ঘন্টা",
//                                           member.section3_1_9HourController,
//                                           onChanged: (v) {
//                                             member.hourLabel1_9 = v;
//                                             surveyProvider.updatedData();
//                                           },
//                                           currentFocus: member.section3_1_9HourFocusNode,
//                                           nextFocus: member.section3_1_9MinuteFocusNode,
//                                           hint: "ঘন্টা",
//                                           isNumber: true,
//                                           maxLength: 2,
//                                           externalErrorText: _pageErrors[index]?['hour2'],
//                                         ),
//                                       ),
//                                       SizedBox(width: 16.w),
//                                       Expanded(
//                                         child: BuildInputFieldWidget(
//                                           "মিনিট",
//                                           member.section3_1_9MinuteController,
//                                           onChanged: (v) {
//                                             member.minuteLabel1_9 = v;
//                                             surveyProvider.updatedData();
//                                           },
//                                           currentFocus: member.section3_1_9MinuteFocusNode,
//                                           hint: "মিনিট",
//                                           isNumber: true,
//                                           maxLength: 2,
//                                           externalErrorText: _pageErrors[index]?['minute2'],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     // For each possible item, add a pinned header and the body below it. Conditions match original show logic: show when id == 'X' AND the selected list is not empty.
//                     if (member.otherStaticModel!.id == '1' && surveyProvider.selected1Amon.isNotEmpty) ...buildLossSection(surveyProvider, 1, surveyProvider.selected1Amon, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '2' && surveyProvider.selected2Boro.isNotEmpty) ...buildLossSection(surveyProvider, 2, surveyProvider.selected2Boro, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '3' && surveyProvider.selected3Aus.isNotEmpty) ...buildLossSection(surveyProvider, 3, surveyProvider.selected3Aus, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '4' && surveyProvider.selected4Dhan.isNotEmpty) ...buildLossSection(surveyProvider, 4, surveyProvider.selected4Dhan, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '5' && surveyProvider.selected5Cal.isNotEmpty) ...buildLossSection(surveyProvider, 5, surveyProvider.selected5Cal, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '6' && surveyProvider.selected6Mosur.isNotEmpty) ...buildLossSection(surveyProvider, 6, surveyProvider.selected6Mosur, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '7' && surveyProvider.selected7Mango.isNotEmpty) ...buildLossSection(surveyProvider, 7, surveyProvider.selected7Mango, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '8' && surveyProvider.selected8_alu.isNotEmpty) ...buildLossSection(surveyProvider, 8, surveyProvider.selected8_alu, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '9' && surveyProvider.selected8_alu.isNotEmpty) ...buildLossSection(surveyProvider, 9, surveyProvider.selected8_alu, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '11' && surveyProvider.selected11_Carp.isNotEmpty) ...buildLossSection(surveyProvider, 11, surveyProvider.selected11_Carp, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '12' && surveyProvider.selected11_Carp.isNotEmpty) ...buildLossSection(surveyProvider, 12, surveyProvider.selected11_Carp, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '10' && surveyProvider.selected10Sorisha.isNotEmpty) ...buildLossSection(surveyProvider, 10, surveyProvider.selected10Sorisha, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '13' && surveyProvider.selected13_cow.isNotEmpty) ...buildLossSection(surveyProvider, 13, surveyProvider.selected13_cow, member, isPartOne, part),
//                     if (member.otherStaticModel!.id == '14' && surveyProvider.selected13_cow.isNotEmpty) ...buildLossSection(surveyProvider, 14, surveyProvider.selected13_cow, member, isPartOne, part),
//
//                     // Next buttons and spacing
//                     SliverToBoxAdapter(
//                       child: surveyProvider.selectedConductTypes.isEmpty
//                           ? spaceZero
//                           : Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           buildNextButton(
//                                 () {
//                               surveyProvider.updateForm4Data(part, (isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo).toDouble());
//                               surveyProvider.saveFormData(providerSaveData, (bool status) async {
//                                 if (status == true) {
//                                   showToastMessage('আংশিক সংরক্ষণ সম্পন্ন হয়েছে');
//                                   Get.offAllNamed(AppRoutes.dashboard);
//                                 }
//                               }, false);
//                             },
//                             title: 'আংশিক সংরক্ষণ করুন',
//                             textColor: Colors.white,
//                             btnColor: Colors.red,
//                           ),
//                           buildNextButton(() async {
//                             if (validate(index, member, isPartOne,surveyProvider)) {
//                               if (surveyProvider.selectedPageIndex < surveyProvider.module3ModelList.length - 1) {
//                                 _pageController.jumpToPage(surveyProvider.selectedPageIndex + 1);
//                               } else {
//                                 surveyProvider.changeClickNoButtonFinally(false);
//                                 surveyProvider.updateForm4Data(part, (isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo).toDouble());
//                                 Get.toNamed(AppRoutes.listingConfirmation);
//                               }
//                             }else{
//                               showToastMessage('অনুগ্রহ করে ফর্মটি সম্পূর্ণ করুন এবং ত্রুটিগুলো সংশোধন করুন', isError: true);
//                             }
//                           }, title: surveyProvider.selectedPageIndex < surveyProvider.module3ModelList.length - 1 ? 'পরবর্তী ফসলে যান' : 'শেষ করুন'),
//                         ],
//                       ),
//                     ),
//                     SliverToBoxAdapter(child: spaceHeight10),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//       // body: ,
//     );
//   }
//
//   SearchablePicker<OtherStaticModel> generalInformationPicker2(
//       SurveyProvider surveyProvider,
//       OtherStaticModel? selectedValue,
//       List<OtherStaticModel> itemList,
//       String label,
//       ValueChanged<OtherStaticModel?> onChanged,
//       String hint, {
//         bool isEditTextEnable = true,
//         String searchQuery = '96',
//         double inlineMaxHeight = 230,
//         double topPadding = 0,
//       }) {
//     return SearchablePicker<OtherStaticModel>(
//       label: label,
//       items: itemList,
//       value: selectedValue,
//       hint: hint,
//       inlineMaxHeight: inlineMaxHeight,
//       searchable: false,
//       leftPadding: 0,
//       rightPadding: 0,
//       topPadding: topPadding,
//       fontSize: 12,
//       itemAsString: (s) => s.description,
//       onChanged: onChanged,
//       shouldShowCustomField: isEditTextEnable == false ? null : (item) => item.id == searchQuery,
//     );
//   }
//
//   Padding tableData(String value) {
//     return Padding(
//       padding: EdgeInsets.all(8.r),
//       child: Text(
//         value,
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
//       ),
//     );
//   }
//
//   Padding tableHeader(String text) {
//     return Padding(
//       padding: EdgeInsets.all(8.r),
//       child: Center(
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }
//
//   // Body portion for item sections (header is handled by a pinned SliverPersistentHeader)
//   Widget itemWidgetBody(SurveyProvider surveyProvider, int type, int totalQuantity, List<Module4Model> dataList, int part, var member, bool isPartOne) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16.r),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF1F0F4),
//         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
//         border: Border.all(color: AppTheme.listingBorderColor),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ...(dataList.isEmpty
//               ? [spaceZero]
//               : List.generate(dataList.length, (int index) {
//             return generator(index, dataList[index], surveyProvider, type, part, member, isPartOne);
//           })),
//           spaceHeight10,
//
//           buildReadOnlyField(
//             part == 1
//                 ? "ক্ষতিসহ মোট উৎপাদনের পরিমাণ (কেজি)"
//                 : part == 2
//                 ? "মোট বিক্রয়যোগ্য ফসলের পরিমাণ"
//                 : part == 3
//                 ? "ক্ষতি বাদে মোট ফসলের পরিমাণ"
//                 : part == 4
//                 ? "ক্ষতিবাদে মিলিংকৃত পণ্যের পরিমাণ"
//                 : "প্রসেসিং শেষে প্রাপ্ত মোট পণ্যের পরিমাণ",
//             (() {
//               if (part == 1) {
//                 final double lossQty = dataList.fold(0, (sum, item) => sum + (item.lossAmountPerKg ?? 0));
//                 var value = lossQty + (isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo);
//                 return "$value (কেজি)";
//               } else {
//                 final double lossQty = dataList.fold(0, (sum, item) => sum + (item.lossAmountPerKg ?? 0));
//                 return "${isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo - lossQty} (কেজি)";
//               }
//             })(),
//             isColumn: false,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget generator(int index, Module4Model moduleData, SurveyProvider surveyProvider, int type, int part, var member, bool isPartOne) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.h),
//       padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.r),
//         border: Border.all(color: AppTheme.listingBorderColor),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Colors.green,
//                 child: Text(moduleData.slNo.toString(), style: natoSansStyle600SemiBold.copyWith(fontSize: 13, color: Colors.white)),
//               ),
//               SizedBox(width: 20.h),
//               Expanded(
//                 child: Text(moduleData.title ?? '', style: natoSansStyle600SemiBold.copyWith(fontSize: 13, color: Colors.green)),
//               ),
//             ],
//           ),
//
//           BuildInputFieldWidget(
//             'ক্ষতির পরিমাণ (কেজি) ',
//             moduleData.lossQuantityPerKgController,
//             onChanged: (v) {
//               // Key for this input (type-index) to store error
//               final key = '$type-$index';
//
//               // allow deletion
//               if (v.isEmpty) {
//                 if (_lossErrors[key] != null) setState(() => _lossErrors[key] = null);
//                 moduleData.lossAmountPerKg = null;
//                 surveyProvider.updatedData();
//                 return;
//               }
//
//               final parsed = double.tryParse(v);
//               if (parsed == null) {
//                 // revert to previous valid value
//                 final prev = moduleData.lossAmountPerKg?.toString() ?? '';
//                 moduleData.lossQuantityPerKgController.text = prev;
//                 moduleData.lossQuantityPerKgController.selection = TextSelection.fromPosition(TextPosition(offset: prev.length));
//                 return;
//               }
//
//               // Compute remaining allowed quantity for this type by summing other items
//               List<Module4Model> list;
//               switch (type) {
//                 case 1:
//                   list = surveyProvider.selected1Amon;
//                   break;
//                 case 2:
//                   list = surveyProvider.selected2Boro;
//                   break;
//                 case 3:
//                   list = surveyProvider.selected3Aus;
//                   break;
//                 case 4:
//                   list = surveyProvider.selected4Dhan;
//                   break;
//                 case 5:
//                   list = surveyProvider.selected5Cal;
//                   break;
//                 case 6:
//                   list = surveyProvider.selected6Mosur;
//                   break;
//                 case 7:
//                   list = surveyProvider.selected7Mango;
//                   break;
//                 case 11:
//                 case 12:
//                   list = surveyProvider.selected11_Carp;
//                   break;
//                 case 8:
//                 case 9:
//                   list = surveyProvider.selected8_alu;
//                   break;
//                 case 13:
//                 case 14:
//                   list = surveyProvider.selected13_cow;
//                   break;
//                 case 10:
//                   list = surveyProvider.selected10Sorisha;
//                   break;
//                 default:
//                   list = [];
//               }
//
//               final double sumAll = list.fold(0, (s, it) => s + (it.lossAmountPerKg ?? 0));
//               final double currentPrev = moduleData.lossAmountPerKg ?? 0;
//               final double sumOther = sumAll - currentPrev;
//               final double net = isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo ?? 0;
//               final double remaining = net - sumOther;
//
//               if (remaining <= 0) {
//                 // no remaining capacity
//                 setState(() => _lossErrors[key] = 'অধিক ক্ষতির জন্য কোনো খালি পরিমাণ আর নেই');
//                 final prev = moduleData.lossAmountPerKg?.toString() ?? '';
//                 moduleData.lossQuantityPerKgController.text = prev;
//                 moduleData.lossQuantityPerKgController.selection = TextSelection.fromPosition(TextPosition(offset: prev.length));
//                 return;
//               }
//
//               if (parsed > remaining) {
//                 setState(() => _lossErrors[key] = 'শুধু $remaining কেজি পর্যন্ত দিয়েই এটা পূরণ করা যাবে');
//                 final prev = moduleData.lossAmountPerKg?.toString() ?? '';
//                 moduleData.lossQuantityPerKgController.text = prev;
//                 moduleData.lossQuantityPerKgController.selection = TextSelection.fromPosition(TextPosition(offset: prev.length));
//                 return;
//               }
//
//               // valid
//               if (_lossErrors[key] != null) setState(() => _lossErrors[key] = null);
//               moduleData.lossAmountPerKg = parsed;
//               final double qty = moduleData.lossAmountPerKg ?? 0;
//               if (part == 1) {
//                 moduleData.lossWithTotalProducersPerKg = qty + (moduleData.lossWithTotalProducersPerKg ?? 0);
//               } else {
//                 moduleData.lossWithTotalProducersPerKgMinus = qty - (moduleData.lossWithTotalProducersPerKgMinus ?? 0);
//               }
//               surveyProvider.updatedData();
//             },
//             currentFocus: moduleData.lossQuantityPerKgFocusNode,
//             // nextFocus: moduleData.lossPercentageFocusNode,
//             hint: 'ক্ষতির পরিমাণ লিখুন',
//             isNumber: true,
//             isShowColumnData: false,
//             leftExpandedValue: 1,
//             rightExpandedValue: 1,
//             externalErrorText: _lossErrors['$type-$index'],
//           ),
//
//           buildReadOnlyField(
//             'ক্ষতির হার (%)',
//             // null-safe calculation: fallback to 0 when any input is null, format to drop unnecessary decimals
//             (() {
//               final double lossWith = (isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo ?? 0).toDouble();
//               final double lossQty = (moduleData.lossAmountPerKg ?? 0).toDouble();
//               final double lossRate = (lossQty * 100.0) / lossWith;
//               if (lossRate == 0 || lossRate.isNaN) return '0%';
//               return (lossRate % 1 == 0) ? "${lossRate.toInt()}%" : "${lossRate.toStringAsFixed(2)}%";
//             })(),
//             isColumn: false,
//           ),
//           labelText('আপনি কি এই পর্যায়ে মেশিন ব্যবহার করেন?'),
//           DynamicRadioList(
//             items: yesNoList,
//             value: moduleData.useMachineOrNot,
//             runSpacing: -20.h,
//             onValueChanged: (value) {
//               if (value != null) {
//                 surveyProvider.updateModule4(index, type, moduleData.copyWith(useMachineOrNot: value));
//                 // surveyProvider.changeBasicInformationType(3, val: value);
//               }
//             },
//             labelBuilder: (item) => item.description,
//           ),
//           spaceHeight10,
//           moduleData.lossAmountPerKg == null || moduleData.lossAmountPerKg == 0 ? spaceZero : labelText('ক্ষতির প্রধান কারণ'),
//           moduleData.lossAmountPerKg == null || moduleData.lossAmountPerKg == 0
//               ? spaceZero
//               : DynamicRadioList(
//             items: getLossReasonList(part, type, index),
//             value: moduleData.lossReasonData ?? OtherStaticModel(id: '-1', description: 'নির্বাচন করুন'),
//             runSpacing: -20.h,
//             onValueChanged: (value) {
//               if (value != null && value.id != '-1') {
//                 surveyProvider.updateModule4(index, type, moduleData.copyWith(lossReasonData: value));
//               } else if (value?.id == '-1') {
//                 surveyProvider.updateModule4(index, type, moduleData.copyWith(lossReasonData: null));
//               }
//             },
//             labelBuilder: (item) => item.description,
//             isOthersItem: (item) => item.id == '96',
//             othersHint: 'নির্বাচন করুন',
//             onOthersTextChanged: (String value) {
//               surveyProvider.changeMachineReasonOrLoss(2, value);
//             },
//             othersTextValue: surveyProvider.otherMachineLossReasonUse,
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<OtherStaticModel> getLossReasonList(int part, int type, int index) {
//     // For type 7 (Mango)
//     var list = [];
//     if (type == 7) {
//       if (part == 1) {
//         list = [
//           lossReasonListMangoPartOneFirst,
//           lossReasonListMangoPartOneSecond,
//           lossReasonListMangoPartOneThird,
//           lossReasonListMangoPartOneFourth,
//           lossReasonListMangoPartOneFifth,
//           lossReasonListMangoPartOneSixth,
//           lossReasonListMangoPartOneSeventh,
//           lossReasonListMangoPartOneEighth,
//           lossReasonListMangoPartOneNinth,
//           lossReasonListMangoPartOneTenth,
//           lossReasonListMangoPartOneEleventh,
//         ];
//       } else if (part == 2) {
//         list = [
//           lossReasonListMangoPartTwoFirst,
//           lossReasonListMangoPartTwoSecond,
//           lossReasonListMangoPartTwoThird,
//           lossReasonListMangoPartTwoFourth,
//           lossReasonListMangoPartTwoFifth,
//           lossReasonListMangoPartTwoSixth,
//           lossReasonListMangoPartTwoSeventh,
//           lossReasonListMangoPartTwoEighth,
//           lossReasonListMangoPartTwoNinth,
//           lossReasonListMangoPartTwoTenth,
//         ];
//       } else if (part == 3) {
//         list = [
//           lossReasonListMangoPartThreeFirst,
//           lossReasonListMangoPartThreeSecond,
//           lossReasonListMangoPartThreeThird,
//           lossReasonListMangoPartThreeFourth,
//           lossReasonListMangoPartThreeFifth,
//         ];
//       } else if (part == 4) {
//         list = [
//           lossReasonListMangoPartThreeFirst,
//           lossReasonListMangoPartThreeSecond,
//           lossReasonListMangoPartThreeThird,
//           lossReasonListMangoPartThreeFourth,
//           lossReasonListMangoPartThreeFifth,
//         ];
//       } else {
//         list = [
//           lossReasonListMangoPartFourFirst,
//           lossReasonListMangoPartFourSecond,
//           lossReasonListMangoPartFourThird,
//           lossReasonListMangoPartFourFourth,
//           lossReasonListMangoPartFourFifth,
//           lossReasonListMangoPartFourSixth,
//           lossReasonListMangoPartFourSeventh,
//           lossReasonListMangoPartFourEighth,
//           lossReasonListMangoPartFourNinth,
//           lossReasonListMangoPartFourTenth,
//           lossReasonListMangoPartFourEleventh,
//           lossReasonListMangoPartFourTwelfth,
//         ];
//       }
//
//       return list[index];
//     } else if (type == 11 || type == 12) {
//       if (part == 1) {
//         list = [
//           lossReasonListCarpCingripPartOneFirst,
//           lossReasonListCarpCingripPartOneSecond,
//           lossReasonListCarpCingripPartOneThird,
//           lossReasonListCarpCingripPartOneFourth,
//           lossReasonListCarpCingripPartOneFifth,
//           lossReasonListCarpCingripPartOneSixth,
//           lossReasonListCarpCingripPartOneSeventh,
//           lossReasonListCarpCingripPartOneEighth,
//           lossReasonListCarpCingripPartOneNinth,
//           lossReasonListCarpCingripPartOneTenth,
//           lossReasonListCarpCingripPartOneEleventh,
//           lossReasonListCarpCingripPartOneTwelfth,
//         ];
//       } else if (part == 2) {
//         list = [
//           lossReasonListCarpCingripPartTwoFirst,
//           lossReasonListCarpCingripPartTwoSecond,
//           lossReasonListCarpCingripPartTwoThird,
//           lossReasonListCarpCingripPartTwoFourth,
//           lossReasonListCarpCingripPartTwoFifth,
//           lossReasonListCarpCingripPartTwoSixth,
//           lossReasonListCarpCingripPartTwoSeventh,
//           lossReasonListCarpCingripPartTwoEighth,
//           lossReasonListCarpCingripPartTwoNinth,
//           lossReasonListCarpCingripPartTwoTenth,
//           lossReasonListCarpCingripPartTwoEleventh,
//         ];
//       } else if (part == 3) {
//         list = [
//           lossReasonListCarpCingripPartThreeFirst,
//           lossReasonListCarpCingripPartThreeSecond,
//           lossReasonListCarpCingripPartThreeThird,
//           lossReasonListCarpCingripPartThreeFourth,
//           lossReasonListCarpCingripPartThreeFifth,
//           lossReasonListCarpCingripPartThreeSixth,
//           lossReasonListCarpCingripPartThreeSeventh,
//           lossReasonListCarpCingripPartThreeEighth,
//           lossReasonListCarpCingripPartThreeNinth,
//         ];
//       } else if (part == 4) {
//         list = [];
//       } else {
//         list = [
//           lossReasonListCarpCingripPartThreeFirst,
//           lossReasonListCarpCingripPartThreeSecond,
//           lossReasonListCarpCingripPartThreeThird,
//           lossReasonListCarpCingripPartThreeFourth,
//           lossReasonListCarpCingripPartThreeFifth,
//           lossReasonListCarpCingripPartThreeSixth,
//           lossReasonListCarpCingripPartThreeSeventh,
//           lossReasonListCarpCingripPartThreeEighth,
//           lossReasonListCarpCingripPartThreeNinth,
//         ];
//       }
//
//       return list[index];
//     } else if (type == 8 || type == 9) {
//       if (part == 1) {
//         list = [
//           lossReasonListAluOrionPartOneFirst,
//           lossReasonListAluOrionPartOneSecond,
//           lossReasonListAluOrionPartOneThird,
//           lossReasonListAluOrionPartOneFourth,
//           lossReasonListAluOrionPartOneFifth,
//           lossReasonListAluOrionPartOneSixth,
//           lossReasonListAluOrionPartOneSeventh,
//           lossReasonListAluOrionPartOneEighth,
//           lossReasonListAluOrionPartOneNinth,
//           lossReasonListAluOrionPartOneTenth,
//           lossReasonListAluOrionPartOneEleventh,
//           lossReasonListAluOrionPartOneTwelfth,
//           lossReasonListAluOrionPartOneThirteenth,
//           lossReasonListAluOrionPartOneFourteenth,
//         ];
//       } else if (part == 2) {
//         list = [
//           lossReasonListAluOrionPartTwoFirst,
//           lossReasonListAluOrionPartTwoSecond,
//           lossReasonListAluOrionPartTwoThird,
//           lossReasonListAluOrionPartTwoFourth,
//           lossReasonListAluOrionPartTwoFifth,
//           lossReasonListAluOrionPartTwoSixth,
//           lossReasonListAluOrionPartTwoSeventh,
//           lossReasonListAluOrionPartTwoEighth,
//           lossReasonListAluOrionPartTwoNinth,
//           lossReasonListAluOrionPartTwoTenth,
//           lossReasonListAluOrionPartTwoEleventh,
//         ];
//       } else if (part == 3) {
//         list = [
//           lossReasonListAluOrionPartThreeFirst,
//           lossReasonListAluOrionPartThreeSecond,
//           lossReasonListAluOrionPartThreeThird,
//           lossReasonListAluOrionPartThreeFourth,
//           lossReasonListAluOrionPartThreeFifth,
//           lossReasonListAluOrionPartThreeSixth,
//           lossReasonListAluOrionPartThreeSeventh,
//           lossReasonListAluOrionPartThreeEighth,
//         ];
//       } else if (part == 4) {
//         list = [
//           lossReasonListAluOrionPartThreeFirst,
//           lossReasonListAluOrionPartThreeSecond,
//           lossReasonListAluOrionPartThreeThird,
//           lossReasonListAluOrionPartThreeFourth,
//           lossReasonListAluOrionPartThreeFifth,
//           lossReasonListAluOrionPartThreeSixth,
//           lossReasonListAluOrionPartThreeSeventh,
//           lossReasonListAluOrionPartThreeEighth,
//         ];
//       } else {
//         list = [
//           lossReasonListAluOrionPartFourFirst,
//           lossReasonListAluOrionPartFourSecond,
//           lossReasonListAluOrionPartFourThird,
//           lossReasonListAluOrionPartFourFourth,
//           lossReasonListAluOrionPartFourFifth,
//           lossReasonListAluOrionPartFourSixth,
//           lossReasonListAluOrionPartFourSeventh,
//           lossReasonListAluOrionPartFourEighth,
//           lossReasonListAluOrionPartFourNinth,
//           lossReasonListAluOrionPartFourTenth,
//           lossReasonListAluOrionPartFourEleventh,
//           lossReasonListAluOrionPartFourTwelfth,
//           lossReasonListAluOrionPartFourThirteenth,
//           lossReasonListAluOrionPartFourFourteenth,
//           lossReasonListAluOrionPartFourFifteenth,
//         ];
//       }
//
//       return list[index];
//     } else if (type == 13 || type == 14) {
//       if (part == 1) {
//         list = [
//           lossReasonListCowHenPartOneFirst,
//           lossReasonListCowHenPartOneSecond,
//           lossReasonListCowHenPartOneThird,
//           lossReasonListCowHenPartOneFourth,
//           lossReasonListCowHenPartOneFifth,
//           lossReasonListCowHenPartOneSixth,
//           lossReasonListCowHenPartOneSeventh,
//         ];
//       } else if (part == 2) {
//         list = [
//           lossReasonListCowHenPartTwoFirst,
//           lossReasonListCowHenPartTwoSecond,
//           lossReasonListCowHenPartTwoThird,
//           lossReasonListCowHenPartTwoFourth,
//           lossReasonListCowHenPartTwoFifth,
//           lossReasonListCowHenPartTwoSixth,
//           lossReasonListCowHenPartTwoSeventh,
//           lossReasonListCowHenPartTwoEighth,
//           lossReasonListCowHenPartTwoNinth,
//           lossReasonListCowHenPartTwoTenth,
//         ];
//       } else if (part == 3) {
//         list = [
//           lossReasonListCowHenPartThreeFirst,
//           lossReasonListCowHenPartThreeSecond,
//           lossReasonListCowHenPartThreeThird,
//           lossReasonListCowHenPartThreeFourth,
//           lossReasonListCowHenPartThreeFifth,
//           lossReasonListCowHenPartThreeSixth,
//           lossReasonListCowHenPartThreeSeventh,
//           lossReasonListCowHenPartThreeEighth,
//           lossReasonListCowHenPartThreeNinth,
//           lossReasonListCowHenPartThreeTenth,
//           lossReasonListCowHenPartThreeEleventh,
//         ];
//       } else if (part == 4) {
//         list = [];
//       } else {
//         list = [
//           lossReasonListMangoPartFourFirst,
//           lossReasonListMangoPartFourSecond,
//           lossReasonListMangoPartFourThird,
//           lossReasonListMangoPartFourFourth,
//           lossReasonListMangoPartFourFifth,
//           lossReasonListMangoPartFourSixth,
//           lossReasonListMangoPartFourSeventh,
//           lossReasonListMangoPartFourEighth,
//           lossReasonListMangoPartFourNinth,
//           lossReasonListMangoPartFourTenth,
//           lossReasonListMangoPartFourEleventh,
//           lossReasonListMangoPartFourTwelfth,
//         ];
//       }
//
//       return list[index];
//     }
//
//     // For other types
//     if (part == 1) {
//       list = [
//         lossReasonList1,
//         lossReasonList2,
//         lossReasonList3,
//         lossReasonList4,
//         lossReasonList5,
//         lossReasonList6,
//         lossReasonList7,
//         lossReasonList8,
//         lossReasonList9,
//         lossReasonList10,
//         lossReasonList96,
//       ];
//     } else if (part == 2) {
//       list = [
//         lossReasonListPartTwo1,
//         lossReasonListPartTwo2,
//         lossReasonListPartTwo3,
//         lossReasonListPartTwo4,
//         lossReasonListPartTwo5,
//         lossReasonListPartTwo6,
//         lossReasonListPartTwo7,
//         lossReasonListPartTwo8,
//         lossReasonList96,
//       ];
//     } else if (part == 3) {
//       list = [lossReasonListPartThree1, lossReasonListPartThree2, lossReasonListPartThree3, lossReasonListPartThree4, lossReasonListPartThree5, lossReasonList96];
//     } else if (part == 4) {
//       list = [
//         lossReasonListPartFour1,
//         lossReasonListPartFour2,
//         lossReasonListPartFour3,
//         lossReasonListPartFour4,
//         lossReasonListPartFour5,
//         lossReasonListPartFour6,
//         lossReasonListPartFour7,
//         lossReasonListPartFour8,
//         lossReasonListPartFour9,
//         lossReasonListPartFour10,
//         lossReasonListPartFour11,
//         lossReasonList96,
//       ];
//     } else {
//       list = [
//         lossReasonListPartFive1,
//         lossReasonListPartFive2,
//         lossReasonListPartFive3,
//         lossReasonListPartFive4,
//         lossReasonListPartFive5,
//         lossReasonListPartFive6,
//         lossReasonListPartFive7,
//         lossReasonListPartFive8,
//         lossReasonListPartFive9,
//         lossReasonListPartFive10,
//         lossReasonListPartFive11,
//         lossReasonListPartFive12,
//         lossReasonListPartFive13,
//         lossReasonListPartFive14,
//         lossReasonListPartFive15,
//         lossReasonList96,
//       ];
//     }
//
//     return list[index];
//   }
//
//
//   bool validate(int index, Module3Model member, bool isPartOne, SurveyProvider surveyProvider) {
//     bool isValid = true;
//
//     // Reset errors for this page
//     _pageErrors[index] = {};
//     print('shuvo check 1');
//     // Check input fields
//     if (isPartOne && member.controllerLandQuantity.text.trim().isEmpty) {
//       _pageErrors[index]!['landQuantity'] = 'আবাদকৃত জমির পরিমাণ লিখুন';
//       print('shuvo check 2');
//       isValid = false;
//     }
//     if (isPartOne && member.controllerProductionQuantity.text.trim().isEmpty) {
//       _pageErrors[index]!['productionQuantity'] = 'পণ্য/উৎপাদিত ফসলের পরিমাণ লিখুন';
//       print('shuvo check 3');
//       isValid = false;
//     }
//     if (member.controllerOtherSourceQuantity.text.trim().isEmpty) {
//       _pageErrors[index]!['otherSourceQuantity'] = 'অন্যান্য উৎস থেকে প্রাপ্ত ফসলের পরিমাণ লিখুন';
//       print('shuvo check 4');
//       isValid = false;
//     }
//     if (member.controllerSalesQuantity.text.trim().isEmpty) {
//       _pageErrors[index]!['salesQuantity'] = 'বিক্রিত/প্রদানকৃত ফসলের পরিমাণ লিখুন';
//       print('shuvo check 5');
//       isValid = false;
//     }
//
//     // Check radio lists
//     if (isPartOne && member.uddesshoType == null) {
//       _pageErrors[index]!['radioError'] = 'উদ্দেশ্য নির্বাচন করুন';
//       print('shuvo check 6');
//       isValid = false;
//     }
//     if (member.transportUseOrNo == null) {
//       _pageErrors[index]!['transportError'] = 'পরিবহন ব্যবহার নির্বাচন করুন';
//       print('shuvo check 7');
//       isValid = false;
//     }
//
//     // Check checkbox lists
//     if (!isPartOne && member.section3_2_PartTwoOne.isEmpty) {
//       _pageErrors[index]!['storageError'] = 'সংরক্ষণের স্থান নির্বাচন করুন';
//       print('shuvo check 8');
//       isValid = false;
//     }
//     if (member.section3_2_2List.isEmpty) {
//       _pageErrors[index]!['processingError'] = 'প্রসেসিং/উত্তোলন/মাড়াইয়ের স্থান নির্বাচন করুন';
//       print('shuvo check 9');
//       isValid = false;
//     }
//     if (member.section3_2_3List.isEmpty) {
//       _pageErrors[index]!['transportMethodError'] = 'পরিবহনের পদ্ধতি নির্বাচন করুন';
//       print('shuvo check 10');
//       isValid = false;
//     }
//
//
//
//     // Check conditional transport fields
//     if (member.transportUseOrNo != null && member.transportUseOrNo!.id == '1') {
//       print('shuvo check 17');
//       if (member.section3_2_6List.isEmpty) {
//         _pageErrors[index]!['transportTypeError'] = 'পরিবহনের ধরন নির্বাচন করুন';
//         print('shuvo check 18');
//         isValid = false;
//       }
//       if (member.section3_2_7List.isEmpty) {
//         _pageErrors[index]!['packagingError'] = 'প্যাকেজিংয়ের পদ্ধতি নির্বাচন করুন';
//         print('shuvo check 19');
//         isValid = false;
//       }
//
//       // Check distance fields
//       if (member.section3_1_8DistanceController.text.trim().isEmpty) {
//         _pageErrors[index]!['distance'] = 'দূরত্ব লিখুন';
//         print('shuvo check 11');
//         isValid = false;
//       }
//       if (member.section3_1_8HourController.text.trim().isEmpty) {
//         _pageErrors[index]!['hour'] = 'ঘন্টা লিখুন';
//         print('shuvo check 12');
//         isValid = false;
//       }
//       if (member.section3_1_8MinuteController.text.trim().isEmpty) {
//         _pageErrors[index]!['minute'] = 'মিনিট লিখুন';
//         print('shuvo check 13');
//         isValid = false;
//       }
//       if (member.section3_1_9DistanceController.text.trim().isEmpty) {
//         _pageErrors[index]!['distance2'] = 'দূরত্ব লিখুন';
//         print('shuvo check 14');
//         isValid = false;
//       }
//       if (member.section3_1_9HourController.text.trim().isEmpty) {
//         _pageErrors[index]!['hour2'] = 'ঘন্টা লিখুন';
//         print('shuvo check 15');
//         isValid = false;
//       }
//       if (member.section3_1_9MinuteController.text.trim().isEmpty) {
//         _pageErrors[index]!['minute2'] = 'মিনিট লিখুন';
//         print('shuvo check 16');
//         isValid = false;
//       }
//
//     }
//
//     // Check loss quantities if loss sections are present
//     if (member.otherStaticModel!.id == '1' && surveyProvider.selected1Amon.isNotEmpty) {
//       print('shuvo check 20');
//       for (int i = 0; i < surveyProvider.selected1Amon.length; i++) {
//         if (surveyProvider.selected1Amon[i].lossAmountPerKg == null || surveyProvider.selected1Amon[i].lossAmountPerKg! < 0) {
//           _lossErrors['1-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           print('shuvo check 21');
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '2' && surveyProvider.selected2Boro.isNotEmpty) {
//       print('shuvo check 22');
//       for (int i = 0; i < surveyProvider.selected2Boro.length; i++) {
//         if (surveyProvider.selected2Boro[i].lossAmountPerKg == null || surveyProvider.selected2Boro[i].lossAmountPerKg! < 0) {
//           _lossErrors['2-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           print('shuvo check 23');
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '3' && surveyProvider.selected3Aus.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected3Aus.length; i++) {
//         if (surveyProvider.selected3Aus[i].lossAmountPerKg == null || surveyProvider.selected3Aus[i].lossAmountPerKg! < 0) {
//           _lossErrors['3-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '4' && surveyProvider.selected4Dhan.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected4Dhan.length; i++) {
//         if (surveyProvider.selected4Dhan[i].lossAmountPerKg == null || surveyProvider.selected4Dhan[i].lossAmountPerKg! < 0) {
//           _lossErrors['4-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '5' && surveyProvider.selected5Cal.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected5Cal.length; i++) {
//         if (surveyProvider.selected5Cal[i].lossAmountPerKg == null || surveyProvider.selected5Cal[i].lossAmountPerKg! < 0) {
//           _lossErrors['5-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '6' && surveyProvider.selected6Mosur.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected6Mosur.length; i++) {
//         if (surveyProvider.selected6Mosur[i].lossAmountPerKg == null || surveyProvider.selected6Mosur[i].lossAmountPerKg! < 0) {
//           _lossErrors['6-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '7' && surveyProvider.selected7Mango.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected7Mango.length; i++) {
//         if (surveyProvider.selected7Mango[i].lossAmountPerKg == null || surveyProvider.selected7Mango[i].lossAmountPerKg! < 0) {
//           _lossErrors['7-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '8' && surveyProvider.selected8_alu.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected8_alu.length; i++) {
//         if (surveyProvider.selected8_alu[i].lossAmountPerKg == null || surveyProvider.selected8_alu[i].lossAmountPerKg! < 0) {
//           _lossErrors['8-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '9' && surveyProvider.selected8_alu.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected8_alu.length; i++) {
//         if (surveyProvider.selected8_alu[i].lossAmountPerKg == null || surveyProvider.selected8_alu[i].lossAmountPerKg! < 0) {
//           _lossErrors['9-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '11' && surveyProvider.selected11_Carp.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected11_Carp.length; i++) {
//         if (surveyProvider.selected11_Carp[i].lossAmountPerKg == null || surveyProvider.selected11_Carp[i].lossAmountPerKg! < 0) {
//           _lossErrors['11-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '12' && surveyProvider.selected11_Carp.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected11_Carp.length; i++) {
//         if (surveyProvider.selected11_Carp[i].lossAmountPerKg == null || surveyProvider.selected11_Carp[i].lossAmountPerKg! < 0) {
//           _lossErrors['12-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '10' && surveyProvider.selected10Sorisha.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected10Sorisha.length; i++) {
//         if (surveyProvider.selected10Sorisha[i].lossAmountPerKg == null || surveyProvider.selected10Sorisha[i].lossAmountPerKg! < 0) {
//           _lossErrors['10-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '13' && surveyProvider.selected13_cow.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected13_cow.length; i++) {
//         if (surveyProvider.selected13_cow[i].lossAmountPerKg == null || surveyProvider.selected13_cow[i].lossAmountPerKg! <0) {
//           _lossErrors['13-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//     if (member.otherStaticModel!.id == '14' && surveyProvider.selected13_cow.isNotEmpty) {
//       for (int i = 0; i < surveyProvider.selected13_cow.length; i++) {
//         if (surveyProvider.selected13_cow[i].lossAmountPerKg == null || surveyProvider.selected13_cow[i].lossAmountPerKg! < 0) {
//           _lossErrors['14-$i'] = 'ক্ষতির পরিমাণ লিখুন';
//           isValid = false;
//         }
//       }
//     }
//
//     setState(() {});
//
//     return isValid;
//   }
//
//   // New helper method to build the loss section with a header and body
//   List<Widget> buildLossSection(SurveyProvider surveyProvider, int type, List<Module4Model> dataList, var member, bool isPartOne, int part) {
//     final int totalQuantity = 0;
//     return [
//       SliverPersistentHeader(
//         pinned: true,
//         delegate: _CenteredHeaderDelegate(
//           child: Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(16.r),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF1F0F4),
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
//               border: Border.all(color: AppTheme.listingBorderColor),
//             ),
//             child: Column(
//               children: [
//                 Text('গত এক বছরে বিভিন্ন পর্যায়ে ক্ষতি', style: natoSansStyle700Bold.copyWith(fontSize: 15, color: Colors.black)),
//                 spaceHeight5,
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
//                   ),
//                   child: Text('নীট ফসলের পরিমাণ ${isPartOne ? member.computedTotalQuantity : member.computedTotalQuantityPartTwo} (কেজি)', style: natoSansStyle500Medium.copyWith(fontSize: 14, color: Colors.green.withValues(alpha: 0.8))),
//                 ),
//               ],
//             ),
//           ),
//           minExtent: 72.0,
//           maxExtent: 72.0,
//         ),
//       ),
//       SliverToBoxAdapter(
//         child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10), child: itemWidgetBody(surveyProvider, type, totalQuantity, dataList, part, member, isPartOne)),
//       ),
//     ];
//   }
// }
//
// class _CenteredHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;
//   final double minExtent;
//   final double maxExtent;
//
//   _CenteredHeaderDelegate({required this.child, required this.minExtent, required this.maxExtent});
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }
//
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
//
