// lib/features/dashboard/presentation/dashboard_screen.dart

import 'package:bpls_mobile/business_logic/provider/save_data_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/utils/text.styles.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bpls_mobile/features/dashboard/controller/dashboard_controller.dart';
import 'package:provider/provider.dart';

// initializeSavedPayloadList

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.find<DashboardController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveData();
    // providerSaveData.initializeSavedPayloadList();
  }

  void saveData() async {
    await providerSaveData.initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    final saveSurveyProvider = Provider.of<SaveDataProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      appBar: AppBar(
        leading: spaceZero,
        backgroundColor: AppTheme.scaffoldBg,
        title: Text('ফসলের ক্ষতি ও অপচয় নিরূপণ জরিপ-২০২৬', style: _getBengaliStyle(32.sp, AppTheme.listingButtonColor, height: 1.3, spacing: -0.04 * 32.sp)),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Obx(() => controller.isNetworkConnected.value
                ? Tooltip(
                    message: 'নেটওয়ার্ক সংযুক্ত',
                    child: Icon(Icons.wifi, size: 20, color: Colors.green),
                  )
                : Tooltip(
                    message: 'নেটওয়ার্ক সংযোগ নেই',
                    child: Icon(Icons.wifi_off, size: 20, color: Colors.red),
                  )),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Obx(() {
              if (controller.isRequestingLocation.value) {
                return const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.blue),
                );
              }
              return GestureDetector(
                onTap: () => controller.refreshLocation(),
                child: controller.isLocationPermissionGranted.value
                    ? Tooltip(
                        message: 'অবস্থান সক্রিয়\n${controller.getLocationString()}',
                        child: Icon(Icons.location_on, size: 20, color: Colors.green),
                      )
                    : Tooltip(
                        message: 'অবস্থান অনুমতি নেই',
                        child: Icon(Icons.location_off, size: 20, color: Colors.red),
                      ),
              );
            }),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile & Info Row
                    Padding(
                      padding: EdgeInsets.only(top: 68.h, left: 56.w, right: 56.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 96.h,
                              child: Row(
                                children: [
                                  Obx(
                                    () => Container(
                                      width: 96.r,
                                      height: 96.r,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xFFD9D9D9),
                                        image: controller.profileImage.value != null ? DecorationImage(image: FileImage(controller.profileImage.value!), fit: BoxFit.cover) : null,
                                      ),
                                      child: controller.profileImage.value == null ? Icon(Icons.person, size: 50.sp, color: Colors.white) : null,
                                    ),
                                  ),
                                  SizedBox(width: 36.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('স্বাগতম,', style: _getBengaliStyle(28.sp, AppTheme.listingButtonColor)),
                                        Obx(() => Text(controller.userName.value, style: _getBengaliStyle(28.sp, AppTheme.listingButtonColor), overflow: TextOverflow.ellipsis)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w), // Small gap between sections
                          _buildProfileButton(),
                        ],
                      ),
                    ),

                    spaceHeight20,
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        // width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          color: AppTheme.cardBg,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppTheme.listingButtonColor.withValues(alpha: 0.1)),
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10.r, offset: Offset(0, 4.h))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('সার্ভারে প্রেরিত সর্বমোট', style: poppinsStyle700Bold.copyWith(fontSize: 18, color: AppTheme.primaryPurple)),
                            spaceHeight10,
                            Text('খানা এবং প্রতিষ্ঠান (${saveSurveyProvider.dashboardCount!.totalSubmissions})', style: poppinsStyle500Medium.copyWith(fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),

                    // Stats Grid (two columns per row)
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 56.w, right: 56.w),
                      child: Builder(
                        builder: (context) {
                          final items = <DashboardItem>[
                            DashboardItem(title: 'ফসলের ক্ষতির সংগৃহীত তথ্য', value: '${saveSurveyProvider.dashboardCount!.khanaAndOrganizationSave}', action: () => navigateToOtherScreen('ফসলের ক্ষতির সংগৃহীত তথ্য')),
                            DashboardItem(
                              title: 'আংশিক সংরক্ষণ: ক্ষতি',
                              value: '${saveSurveyProvider.dashboardCount!.totalTemporaySave}',
                              action: () => Get.toNamed(AppRoutes.viewSurveySaveData, arguments: {'data': false, 'isFromKhana': false}),
                            ),
                            DashboardItem(
                              title: 'সংগৃহীত তথ্য: খানা',
                              value: saveSurveyProvider.dashboardCount!.totalKhanaSave.toString(),
                              action: () => Get.toNamed(AppRoutes.viewSurveySaveData, arguments: {'data': true, 'isFromKhana': true}),
                            ),
                            DashboardItem(
                              title: 'সংগৃহীত তথ্য: প্রতিষ্ঠান',
                              value: saveSurveyProvider.dashboardCount!.totalOrgniztionSave.toString(),
                              action: () => Get.toNamed(AppRoutes.viewSurveySaveData, arguments: {'data': true, 'isFromKhana': false}),
                            ),
                            DashboardItem(title: 'প্রেরিত: খানা', value: saveSurveyProvider.dashboardCount!.totalKhanaHousehold.toString(), action: () => navigateToOtherScreen('প্রেরিত: খানা')),
                            DashboardItem(title: 'প্রেরিত: প্রতিষ্ঠান', value: saveSurveyProvider.dashboardCount!.totalOrganization.toString(), action: () => navigateToOtherScreen('প্রেরিত: প্রতিষ্ঠান')),
                          ];

                          final rows = <Widget>[];
                          for (var i = 0; i < items.length; i += 2) {
                            final left = _buildStatCard(items[i]);
                            final right = (i + 1) < items.length ? _buildStatCard(items[i + 1]) : const SizedBox.shrink();
                            rows.add(
                              Row(
                                children: [
                                  Expanded(child: left),
                                  SizedBox(width: 32.w),
                                  Expanded(child: right),
                                ],
                              ),
                            );
                            if (i + 2 < items.length) rows.add(SizedBox(height: 24.h));
                          }

                          return Column(children: rows);
                        },
                      ),
                    ),

                    // Stats Grid (two columns per row)
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 56.w, right: 56.w),
                      child: Builder(
                        builder: (context) {
                          final items = <DashboardItem>[
                            DashboardItem(title: 'খাদ্যের অপচয়ের সংগৃহীত তথ্য', value: '০', action: () => navigateToOtherScreen('খাদ্যের অপচয়ের সংগৃহীত তথ্য')),
                            DashboardItem(title: 'আংশিক সংরক্ষণ: অপচয়', value: '০', action: () => navigateToOtherScreen('আংশিক সংরক্ষণ: অপচয়')),
                            DashboardItem(title: 'সংগৃহীত তথ্য: খানা', value: '০', action: () => navigateToOtherScreen('সংগৃহীত তথ্য: খানা')),
                            DashboardItem(title: 'সংগৃহীত তথ্য: প্রতিষ্ঠান', value: '০', action: () => navigateToOtherScreen('সংগৃহীত তথ্য: প্রতিষ্ঠান')),
                            DashboardItem(title: 'প্রেরিত: খানা', value: '০', action: () => navigateToOtherScreen('প্রেরিত: খানা')),
                            DashboardItem(title: 'প্রেরিত: প্রতিষ্ঠান', value: '০', action: () => navigateToOtherScreen('প্রেরিত: প্রতিষ্ঠান')),
                          ];

                          final rows = <Widget>[];
                          for (var i = 0; i < items.length; i += 2) {
                            final left = _buildStatCard(items[i]);
                            final right = (i + 1) < items.length ? _buildStatCard(items[i + 1]) : const SizedBox.shrink();
                            rows.add(
                              Row(
                                children: [
                                  Expanded(child: left),
                                  SizedBox(width: 32.w),
                                  Expanded(child: right),
                                ],
                              ),
                            );
                            if (i + 2 < items.length) rows.add(SizedBox(height: 24.h));
                          }

                          return Column(children: rows);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            spaceHeight5,
            buildNextButton(() {
              // surveyProvider.secondStepClick();
              // bool isPartOne = surveyProvider.selectedTottoType.id == '1' || surveyProvider.selectedTottoType.id == '2';
              // initializeModule4Data(surveyProvider, isPartOne);
              providerSurvey.clearAllData();
              Get.toNamed(AppRoutes.survey);
              // Get.toNamed(AppRoutes.module3PartOne);
            }),
            spaceHeight5,
          ],
        ),
      ),
    );
  }

  Widget _buildProfileButton() {
    return GestureDetector(
      onTap: () => controller.goToProfile(),
      child: Container(
        width: 408.w,
        height: 90.h,
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        decoration: BoxDecoration(
          color: const Color(0xFFEADDFF),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFEDF4EE), width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('প্রোফাইল', style: _getBengaliStyle(28.sp, AppTheme.listingButtonColor)),
            Icon(Icons.person_outline, size: 34.sp, color: AppTheme.listingButtonColor),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(DashboardItem item) {
    return GestureDetector(
      onTap: item.action,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 85,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(16.r),
          border: item.action != null ? Border.all(color: AppTheme.listingButtonColor.withValues(alpha: 0.1)) : null,
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10.r, offset: Offset(0, 4.h))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, textAlign: TextAlign.start, style: _getBengaliStyle(15, AppTheme.listingButtonColor), maxLines: 2, overflow: TextOverflow.ellipsis),
            const Spacer(),
            item.icon != null
                ? Icon(item.icon, size: 56.sp, color: const Color(0xFF1D1B20))
                : Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.value,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 25, fontWeight: FontWeight.w800, color: const Color(0xFF1D1B20), height: 1.1, letterSpacing: -0.04 * 56.sp),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  TextStyle _getBengaliStyle(double size, Color color, {double height = 1.2, double spacing = 0}) {
    return TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: size, fontWeight: FontWeight.w600, color: color, height: height, letterSpacing: spacing);
  }
}
