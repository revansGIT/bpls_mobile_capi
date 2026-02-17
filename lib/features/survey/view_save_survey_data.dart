import 'package:bpls_mobile/business_logic/provider/save_data_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/datasource/model/payload_model.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ViewSaveSurveyData extends StatefulWidget {
  final bool data;
  final bool isFromKhana;

  const ViewSaveSurveyData({required this.data, required this.isFromKhana, super.key});

  @override
  State<ViewSaveSurveyData> createState() => _ViewSaveSurveyDataState();
}

class _ViewSaveSurveyDataState extends State<ViewSaveSurveyData> {
  TextEditingController searchController = TextEditingController();
  Set<int> selectedIndices = {};


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.data==false){
      providerSurvey.changeFromTemporarySaveTrue();
    }

  }

  @override
  Widget build(BuildContext context) {
    final saveSurveyProvider = Provider.of<SaveDataProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      appBar: AppBar(leading: backButton, title: Text(widget.data && widget.isFromKhana ? 'সংগৃহীত তথ্য: খানা' :widget.data && widget.isFromKhana==false ? 'সংগৃহীত তথ্য: প্রতিষ্ঠান' : 'আংশিক সংরক্ষণ: ক্ষতি')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              widget.data == true && widget.isFromKhana == true
                  ? Expanded(child: _buildDataColumn(saveSurveyProvider.savedPayloadListCompleteKhanaTemp))
                  : widget.data == true && widget.isFromKhana == false
                  ? Expanded(child: _buildDataColumn(saveSurveyProvider.savedPayloadListCompleteOrganizationTemp))
                  : Expanded(child: _buildDataColumn(saveSurveyProvider.savedPayloadListTemp)),
              if (widget.data == true) ...[
                spaceHeight5,
                saveSurveyProvider.isLoading
                    ? CircularProgressIndicator()
                    : (widget.isFromKhana?saveSurveyProvider.savedPayloadListCompleteKhanaTemp.isEmpty:saveSurveyProvider.savedPayloadListCompleteOrganizationTemp.isEmpty)
                    ? spaceZero
                    : buildNextButton(() {
                        if (selectedIndices.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('অন্তত একটি তথ্য নির্বাচন করুন')));
                          return;
                        }
                        saveSurveyProvider.clickSubmitForm(selectedIndices.toList(), widget.isFromKhana);
                        selectedIndices.clear();
                        selectedIndices = {};
                      }, title: 'নির্বাচিত তথ্য সার্ভারে জমা দিন'),
                SizedBox(height: 50.h),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    final saveSurveyProvider = Provider.of<SaveDataProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFECE6F0),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Row(
        children: [
          widget.data == false
              ? spaceZero
              : SizedBox(
                  width: 48,
                  child: Checkbox(
                    value: widget.isFromKhana?
                    (selectedIndices.length == saveSurveyProvider.savedPayloadListCompleteKhanaTemp.length && saveSurveyProvider.savedPayloadListCompleteKhanaTemp.isNotEmpty):
                    (selectedIndices.length == saveSurveyProvider.savedPayloadListCompleteOrganizationTemp.length && saveSurveyProvider.savedPayloadListCompleteOrganizationTemp.isNotEmpty),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          if(widget.isFromKhana){
                            selectedIndices = Set.from(List.generate(saveSurveyProvider.savedPayloadListCompleteKhanaTemp.length, (i) => i));
                          } else {
                            selectedIndices = Set.from(List.generate(saveSurveyProvider.savedPayloadListCompleteOrganizationTemp.length, (i) => i));
                          }
                          // selectedIndices = Set.from(List.generate(saveSurveyProvider.savedPayloadListCompleteKhanaTemp.length, (i) => i));
                        } else {
                          selectedIndices.clear();
                        }
                      });
                    },
                  ),
                ),
          _cellWrapper('ক্রমিক', 1, isHeader: true, hasArrow: true),
          _cellWrapper('নাম', 2, isHeader: true, hasArrow: true),
          _cellWrapper('মোবাইল', 2, isHeader: true, hasArrow: true),
          _cellWrapper('পদক্ষেপ', 1, isHeader: true, hasArrow: false),
        ],
      ),
    );
  }

  Widget _buildTableRow(var item, int index, String name, String phone) {
    final isSelected = selectedIndices.contains(index);

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFECE6F0))),
      ),
      child: Row(
        children: [
          widget.data == false
              ? spaceZero
              : SizedBox(
                  width: 48,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedIndices.add(index);
                        } else {
                          selectedIndices.remove(index);
                        }
                      });
                    },
                  ),
                ),
          _cellWrapper('${index + 1}', 1),
          _cellWrapper(name, 2),
          _cellWrapper(phone, 2),
          // View Action
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                providerSurvey.initializeRetrivePayloadData(item, index);
                Get.toNamed(AppRoutes.payloadDetails);
              },
              child: Container(
                padding: EdgeInsets.all(8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ভিউ',
                      style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 10, color: AppTheme.listingButtonColor),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.visibility_outlined, size: 13, color: AppTheme.listingButtonColor),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Unified cell helper for cleaner code
  Widget _cellWrapper(String label, int flex, {bool isHeader = false, bool hasArrow = false}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          label,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400, fontSize: (isHeader ? 10 : 10), color: isHeader ? AppTheme.listingButtonColor : const Color(0xFF1D1B20)),
        ),
      ),
    );
  }

  Widget _buildDataColumn(List<PayloadModel> list) {
    return Column(
      children: [
        list.isEmpty ? spaceZero : _buildTableHeader(),
        list.isEmpty
            ? Center(child: SizedBox(height: 300, child: Text("কোন তথ্য পাওয়া যায়নি")))
            : Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var item = list[index];

                    print('Item at index $index: ${item.module02GeneralInfo!.toJson()}');

                    String? name;
                    String? phone;
                    if (item.module02GeneralInfo?.householdDetails != null) {
                      name = item.module02GeneralInfo!.householdDetails!.khanaHeadName;
                      phone = item.module02GeneralInfo!.householdDetails!.respondentMobile;
                    } else if (item.module02GeneralInfo?.institutionDetails != null) {
                      name = item.module02GeneralInfo!.institutionDetails!.ownerName;
                      phone = item.module02GeneralInfo!.institutionDetails!.organizationPhone;
                    }

                    return (name == null || phone == null) ? SizedBox.shrink() : _buildTableRow(item, index, name, phone);
                  },
                ),
              ),
      ],
    );
  }
}
