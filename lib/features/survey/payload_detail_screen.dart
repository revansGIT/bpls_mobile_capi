import 'package:bpls_mobile/business_logic/provider/save_data_provider.dart';
import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/datasource/model/module_3_model.dart';
import 'package:bpls_mobile/datasource/model/payload_model.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../routes/app_pages.dart';

class PayloadDetailScreen extends StatelessWidget {
  const PayloadDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context);
    final saveDataProvider = Provider.of<SaveDataProvider>(context);
    final PayloadModel? item = surveyProvider.retrivePayloadModel;

    if (item == null) {
      return Scaffold(
        appBar: AppBar(leading: backButton, title: const Text('বিস্তারিত তথ্য')),
        body: const Center(child: Text('কোন তথ্য পাওয়া যায়নি')),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      appBar: AppBar(leading: backButton, title: const Text('বিস্তারিত তথ্য')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Analysis Text
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      'সার্ভে পেলোডের বিস্তারিত তথ্য এখানে দেখানো হয়েছে। এটি সমস্ত মডিউলের ডেটা অন্তর্ভুক্ত করে।',
                      style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Summary
                  _buildSection('সারাংশ', [
                    _buildInfoRow('স্ট্যাটাস', (item.isDoneAll ?? false) ? 'সম্পন্ন' : 'আংশিক'),
                    _buildInfoRow('পিএসইউ নম্বর', _valueOrDash(item.psuNumber)),

                    _buildInfoRow('টাইমস্ট্যাম্প', _valueOrDash(item.timeStamp)),
                  ]),
                  // Meta Data
                  // if (item.metaData != null) _buildMetaDataSection(item.metaData!),
                  // Module 01
                  if (item.module01Identification != null) _buildModule01Section(item),
                  // Household
                  if (item.module02GeneralInfo?.householdDetails != null) _buildHouseholdSection(item.module02GeneralInfo!.householdDetails!),
                  // Institution
                  if (item.module02GeneralInfo?.institutionDetails != null) _buildInstitutionSection(item.module02GeneralInfo!.institutionDetails!),
                  // Other Info
                  _buildOtherInfoSection(item.module02GeneralInfo!),
                  // Module 03
                  if (item.module03ProductionActivity != null) _buildModule03Section(item.module03ProductionActivity!),

                  // Module 04
                  if (item.amonDhanModel != null) _buildLossSection("আমন ধান", item.amonDhanModel!),
                  if (item.boroDhanModel != null) _buildLossSection("বোরো ধান", item.boroDhanModel!),
                  if (item.ausDhanModel != null) _buildLossSection("আউশ ধান", item.ausDhanModel!),
                  if (item.dhanModel != null) _buildLossSection("ধান (সকল ধরনের ধান)", item.dhanModel!),
                  if (item.calModel != null) _buildLossSection("চাল", item.calModel!),
                  if (item.mosurModel != null) _buildLossSection("মসুর", item.mosurModel!),
                  if (item.mangoModel != null) _buildLossSection("আম ", item.mangoModel!),
                  if (item.peyajModel != null) _buildLossSection("পেঁয়াজ ", item.peyajModel!),
                  if (item.aluModel != null) _buildLossSection("আলু", item.aluModel!),
                  if (item.sorisaModel != null) _buildLossSection("সরিষা", item.sorisaModel!),
                  if (item.carpModel != null) _buildLossSection("কার্প জাতীয় মাছ (রুই, কাতলা, কালবাউশ, মৃগেল, অন্যান্য কার্প)", item.carpModel!),
                  if (item.cingriModel != null) _buildLossSection("চিংড়ি", item.cingriModel!),
                  if (item.meetCowModel != null) _buildLossSection("গরুর মাংস", item.meetCowModel!),
                  if (item.meetHenModel != null) _buildLossSection("মুরগির মাংস (পোল্ট্রি/ব্রয়লারসহ সব ধরনের মুরগী)", item.meetHenModel!),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      surveyProvider.setAllValue();
                      surveyProvider.changeFromTrue();
                      Get.toNamed(AppRoutes.survey);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade300, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: const Text(
                      'আপডেট করুন',
                      style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('নিশ্চিত করুন'),
                          content: const Text('আপনি কি এই পেলোড মুছতে চান?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('বাতিল')),
                            TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('মুছুন')),
                          ],
                        ),
                      );
                      if (confirm == true) {
                        saveDataProvider.deletePayload(item, item.isDoneAll ?? false);
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: const Text(
                      'মুছুন',
                      style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        ...children,
        const SizedBox(height: 16),
      ],
    );
  }

  // Module01Identification
  Widget _buildModule01Section(PayloadModel payloadModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.blue.shade50,
          child: Text(
            'মডিউল ০১: আইডেন্টিফিকেশন',
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue.shade800),
          ),
        ),
        const SizedBox(height: 8),
        _buildInfoRow('রেসপন্ডেন্ট টাইপ', _valueOrDash(payloadModel.module01Identification!.respondentType?.toString())),
        _buildInfoRow('রেসপন্ডেন্ট টাইপ লেবেল', _valueOrDash(payloadModel.module01Identification!.respondentTypeLabel)),
        if (payloadModel.module01Identification!.geoCode != null) ...[
          const Divider(),
          // const Text(
          //   'জিও কোড',
          //   style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
          // ),
          _buildInfoRow('জিও কোড', payloadModel.psuNumber!),
          // _buildInfoRow('ডিভিশন কোড', _valueOrDash(module01.geoCode!.divisionCode)),
          // _buildInfoRow('জেলা কোড', _valueOrDash(module01.geoCode!.districtCode)),
          // _buildInfoRow('সিটি কর্প কোড', _valueOrDash(module01.geoCode!.cityCorpCode?.toString())),
          // _buildInfoRow('পৌরসভা কোড', _valueOrDash(module01.geoCode!.pourashavaCode?.toString())),
          // _buildInfoRow('উপজেলা কোড', _valueOrDash(module01.geoCode!.upazilaCode)),
          // _buildInfoRow('ইউনিয়ন কোড', _valueOrDash(module01.geoCode!.unionCode)),
          // _buildInfoRow('ওয়ার্ড কোড', _valueOrDash(module01.geoCode!.wardCode)),
          // _buildInfoRow('মৌজা কোড', _valueOrDash(module01.geoCode!.mouzaCode)),
          // _buildInfoRow('গ্রাম কোড', _valueOrDash(module01.geoCode!.villageCode)),
          // _buildInfoRow('ইএ কোড', _valueOrDash(module01.geoCode!.eaCode)),
          // _buildInfoRow('আরএমও কোড', _valueOrDash(module01.geoCode!.rmoCode)),
        ],
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHouseholdSection(HouseholdDetails household) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'খানা তথ্য',
          style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        _buildInfoRow('বর্ণনা', _valueOrDash(household.description?.description)),
        _buildInfoRow('খানা নম্বর', _valueOrDash(household.khanaNumber)),
        _buildInfoRow('খানা প্রধানের নাম', _valueOrDash(household.khanaHeadName)),
        _buildInfoRow('পিতার/স্বামীর নাম', _valueOrDash(household.fatherHusbandName)),
        _buildInfoRow('ঠিকানা/হোল্ডিং', _valueOrDash(household.addressHoldingNo)),
        _buildInfoRow('উত্তরদাতার ফোন', _valueOrDash(household.respondentMobile)),
        _buildInfoRow('উত্তরদাতার লাইন নম্বর', _valueOrDash(household.answerPersonLineNumber)),
        _buildInfoRow('উত্তরদাতার ফোন নম্বর', _valueOrDash(household.answerPersonPhoneNumber)),
        _buildInfoRow('বাড়ির ধরন', _valueOrDash(household.houseType?.description)),
        _buildInfoRow('রান্নাঘরের অবস্থা', _valueOrDash(household.kitchenStatus?.description)),
        _buildInfoRow('জ্বালানি উৎস', _valueOrDash(household.fuelSource?.description)),
        _buildInfoRow('বিদ্যুৎ উৎস', _valueOrDash(household.electricitySource?.description)),
        _buildInfoRow('পানি উৎস', _valueOrDash(household.waterSource?.description)),
        _buildInfoRow('টয়লেট সুবিধা', _valueOrDash(household.toiletFacility?.description)),
        if (household.members != null && household.members!.isNotEmpty) ...[
          const Divider(),
          const Text(
            'খানা সদস্য',
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
          ),
          ...household.members!.map(
            (member) => Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'নাম: ${_valueOrDash(member.name)}',
                      style: const TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600),
                    ),
                    Text('লাইন নম্বর: ${_valueOrDash(member.lineNo?.toString())}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('সম্পর্ক: ${_valueOrDash(member.relationship?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('লিঙ্গ: ${_valueOrDash(member.gender?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('বয়স: ${_valueOrDash(member.age?.toString())}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('ধর্ম: ${_valueOrDash(member.religion?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('বৈবাহিক অবস্থা: ${_valueOrDash(member.maritalStatus?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('শিক্ষা কোড: ${_valueOrDash(member.educationCode?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('কৃষিতে জড়িত: ${_valueOrDash(member.isInvolvedAgri?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                    Text('আয়ের উৎস: ${_valueOrDash(member.incomeSource?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                  ],
                ),
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildInstitutionSection(InstitutionDetails institution) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'প্রতিষ্ঠান তথ্য',
          style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        _buildInfoRow('প্রতিষ্ঠান সিরিয়াল', _valueOrDash(institution.institutionSerial)),
        _buildInfoRow('মালিকের নাম', _valueOrDash(institution.ownerName)),
        _buildInfoRow('মালিকের লিঙ্গ', _valueOrDash(institution.ownerGender!.description)),
        _buildInfoRow('মালিকের বয়স', _valueOrDash(institution.ownerAge)),
        _buildInfoRow('প্রতিষ্ঠার বছর', _valueOrDash(institution.establishmentYear)),
        _buildInfoRow('প্রতিষ্ঠানের হোল্ডিং নম্বর', _valueOrDash(institution.organizationHoldingNo)),
        _buildInfoRow('প্রতিষ্ঠানের ঠিকানা', _valueOrDash(institution.organizationAddress)),
        _buildInfoRow('প্রতিষ্ঠানের ফোন', _valueOrDash(institution.organizationPhone)),
        _buildInfoRow('প্রতিষ্ঠানের ধরন', _valueOrDash(institution.institutionType?.description)),
        _buildInfoRow('মালিকানার ধরন', _valueOrDash(institution.ownershipType?.description)),
        if (institution.manpowerRegular != null) ...[
          const Divider(),
          const Text(
            'নিয়মিত কর্মী',
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
          ),
          _buildInfoRow('পুরুষ', _valueOrDash(institution.manpowerRegular!.male?.toString())),
          _buildInfoRow('মহিলা', _valueOrDash(institution.manpowerRegular!.female?.toString())),
          _buildInfoRow('হিজড়া', _valueOrDash(institution.manpowerRegular!.hijra?.toString())),
        ],
        if (institution.manpowerIrregular != null) ...[
          const Divider(),
          const Text(
            'অনিয়মিত কর্মী',
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
          ),
          _buildInfoRow('পুরুষ', _valueOrDash(institution.manpowerIrregular!.male?.toString())),
          _buildInfoRow('মহিলা', _valueOrDash(institution.manpowerIrregular!.female?.toString())),
          _buildInfoRow('হিজড়া', _valueOrDash(institution.manpowerIrregular!.hijra?.toString())),
        ],
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildOtherInfoSection(Module02GeneralInfo module02) {
    return _buildSection('অন্য তথ্য', [
      _buildInfoRow('তথ্য স্তর', _valueOrDash(module02.informationLevel?.description)),
      _buildInfoRow('উৎপাদন/খাদ্য ধরন', _listValue(module02.typeOfProductOrFoodConduct?.map((e) => e.description).toList())),
    ]);
  }

  Widget _buildModule03Section(Module03ProductionActivity module03) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.blue.shade50,
          child: Text(
            'মডিউল ০৩: উৎপাদন কার্যক্রম',
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue.shade800),
          ),
        ),

        // const Text(
        //   'মডিউল ০৩: উৎপাদন কার্যক্রম',
        //   style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
        // ),
        // const SizedBox(height: 8),
        // _buildInfoRow('বর্ণনা', _valueOrDash(module03.description)),
        if (module03.items != null && module03.items!.isNotEmpty) ...[
          // const Divider(),
          const Text(
            'ফসলসমূহ',
            style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
          ),
          ...module03.items!.asMap().entries.map((entry) {
            int i = entry.key;
            var item = entry.value;
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ফসল ${i + 1}',
                      style: const TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    _buildInfoRow('নাম', _valueOrDash(item.otherStaticModel?.description)),
                    _buildInfoRow('জমির পরিমাণ', _valueOrDash(item.landQuantity?.toString())),
                    _buildInfoRow('উৎপাদন পরিমাণ', _valueOrDash(item.productionQuantity?.toString())),
                    _buildInfoRow('অন্য উৎস পরিমাণ', _valueOrDash(item.otherSourceQuantity?.toString())),
                    _buildInfoRow('বিক্রয় পরিমাণ', _valueOrDash(item.salesQuantity?.toString())),
                  ],
                ),
              ),
            );
          }),
        ],
        const SizedBox(height: 16),
      ],
    );
  }

  // Widget _buildModule04Section(Module04LossAssessment module04, Module02GeneralInfo module02) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'মডিউল ০৪: ক্ষতি মূল্যায়ন',
  //         style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
  //       ),
  //       const SizedBox(height: 8),
  //       if (module04.farmerLosses != null && module04.farmerLosses!.isNotEmpty) _buildLossSection('কৃষক ক্ষতি', module04.farmerLosses!, module02),
  //       if (module04.middlemanLosses != null && module04.middlemanLosses!.isNotEmpty) _buildLossSection('মধ্যস্থতাকারী ক্ষতি', module04.middlemanLosses!, module02),
  //       if (module04.godownLosses != null && module04.godownLosses!.isNotEmpty) _buildLossSection('গোডাউন ক্ষতি', module04.godownLosses!, module02),
  //       if (module04.millerLosses != null && module04.millerLosses!.isNotEmpty) _buildLossSection('মিলার ক্ষতি', module04.millerLosses!, module02),
  //       if (module04.processorLosses != null && module04.processorLosses!.isNotEmpty) _buildLossSection('প্রসেসর ক্ষতি', module04.processorLosses!, module02),
  //     ],
  //   );
  // }

  Widget _buildLossSection(String title, Module3Model module3) {
    return module3.module4ModelList == null || module3.module4ModelList!.isEmpty
        ? spaceZero
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Text(
                title,
                style: const TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(
                        'মোট ক্ষতি',
                        "${_valueOrDash(tottoKhanAndOrganization ? module3.computedTotalQuantity.toString() : module3.computedTotalQuantityPartTwo.toString())} (কেজি)",
                      ),
                      if (module3.module4ModelList != null && module3.module4ModelList!.isNotEmpty) ...[
                        const Text(
                          'সকল প্রশ্নসমূহ',
                          style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: module3.module4ModelList!.length,
                          itemBuilder: (context, index) {
                            var stage = module3.module4ModelList![index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'প্রশ্ন-${index + 1}: ${stage.title}',
                                    style: const TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600),
                                  ),

                                  Text('ক্ষতি পরিমাণ (কেজি): ${_valueOrDash(stage.lossAmountPerKg?.toString())}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                                  Text('ক্ষতি শতাংশ: ${_valueOrDash(stage.lossPercentage?.toString())}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                                  Text('মেশিন ব্যবহৃত: ${_valueOrDash(stage.useMachineOrNot?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                                  stage.lossReasonData == null
                                      ? spaceZero
                                      : Text('কারণ: ${_valueOrDash(stage.lossReasonData?.description)}', style: const TextStyle(fontFamily: 'Noto Sans Bengali')),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w400, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  String _valueOrDash(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '-';
    }
    return value;
  }

  String _listValue(List<String>? values) {
    if (values == null || values.isEmpty) {
      return '-';
    }
    return values.where((v) => v.trim().isNotEmpty).join(', ');
  }
}
