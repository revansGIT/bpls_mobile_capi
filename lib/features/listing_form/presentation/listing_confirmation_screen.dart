
import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/features/listing_form/presentation/listing_success_screen.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/size.util.dart';
import 'package:bpls_mobile/utils/text.styles.dart';
import 'package:bpls_mobile/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ListingConfirmationScreen extends StatelessWidget {
  const ListingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      appBar: AppBar(leading: backButton),
      body: SafeArea(
        child: Column(
          children: [
            // _buildHeader(),
            // const Spacer(),

            // Confirmation Content
            Expanded(
              child: surveyProvider.isClickNoButtonFinally == true
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 100.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildActionButton(
                            label: "সাক্ষাৎকার শেষ করুন",
                            isPrimary: true,
                            isEnabled: surveyProvider.isClickNoButtonFinally,
                            fontSize: 14,
                            onTap: () {


                              surveyProvider.saveFormData(providerSaveData,(bool status) async {
                                if (status == true) {
                                  Get.dialog(const ListingSuccessScreen(), barrierDismissible: false);
                                  // Wait 2 seconds, then close dialog and navigate to dashboard
                                  await Future.delayed(const Duration(seconds: 4));
                                  if (Get.isDialogOpen ?? false) {
                                    Get.back(); // close the dialog
                                  }
                                  Get.offAllNamed(AppRoutes.dashboard);
                                }
                              }, true);
                            },
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 56.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.fact_check_outlined, size: 60, color: AppTheme.listingButtonColor),
                            SizedBox(height: 40.h),
                            Text(
                              surveyProvider.unitSelect == 1 ? "আপনি  অন্য কোন ফসল চাষ/প্রাণিসম্পদ পালন করেন কিনা?" : "প্রতিষ্ঠানের অন্য কোন পণ্যের তথ্য দিতে চান কিনা?",
                              textAlign: TextAlign.center,
                              style: poppinsStyle700Bold.copyWith(color: AppTheme.primaryPurple, fontSize: 18),
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: EdgeInsets.only(bottom: 100.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // FIXED: Edit Button (Goes back to the previous form step)
                                  _buildActionButton(
                                    label: "হ্যাঁ",
                                    isPrimary: true,
                                    onTap: () {
                                      Get.back();
                                      Get.back();
                                      Get.back();
                                      if(selectTottoType==1) Get.back();
                                    },
                                  ),
                                  SizedBox(width: 20),
                                  // Submit Button
                                  _buildActionButton(
                                    label: "না",
                                    isPrimary: false,
                                    color: Colors.green,
                                    onTap: () {
                                      surveyProvider.changeClickNoButtonFinally(true);
                                      // surveyProvider.submitForm();
                                      // debugPrint("Final Submition Successful");
                                      // // Get.offNamed(AppRoutes.listingSuccess);
                                      // Get.dialog(const ListingSuccessScreen(), barrierDismissible: false);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // Text(
                            //   "আপনার প্রদানকৃত সকল তথ্য সঠিক থাকলে 'সাক্ষাৎকার শেষ করুন' বাটনে ক্লিক করুন। কোন পরিবর্তনের প্রয়োজন হলে 'ব্যাক' বাটনে ক্লিক করুন।",
                            //   textAlign: TextAlign.center,
                            //   style: poppinsStyle500Medium.copyWith(height: 1.5, color: AppTheme.listingPlaceholderColor, fontSize: 13),
                            // ),
                          ],
                        ),
                      ),
                    ),
            ),

            // Action Buttons Group
            surveyProvider.isClickNoButtonFinally == true
                ? spaceZero
                : Padding(
                    padding: EdgeInsets.only(bottom: 100.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildActionButton(
                          label: "সাক্ষাৎকার শেষ করুন",
                          isPrimary: true,
                          isEnabled: surveyProvider.isClickNoButtonFinally,
                          fontSize: 14,
                          onTap: () {
                            surveyProvider.saveFormData(providerSaveData,(bool status) async {
                              if (status == true) {
                                Get.dialog(const ListingSuccessScreen(), barrierDismissible: false);
                                // Wait 2 seconds, then close dialog and navigate to dashboard
                                await Future.delayed(const Duration(seconds: 6));
                                if (Get.isDialogOpen ?? false) {
                                  Get.back(); // close the dialog
                                }
                                Get.offAllNamed(AppRoutes.dashboard);
                              }
                            }, true);

                            // surveyProvider.saveFormData();
                            // debugPrint("Final Submition Successful");
                            // // Get.offNamed(AppRoutes.listingSuccess);
                            // Get.dialog(const ListingSuccessScreen(), barrierDismissible: false);
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required bool isPrimary,
    required VoidCallback onTap,
    bool isEnabled = true,
    double fontSize = 16,
    Color color = AppTheme.listingButtonColor,
    Color textColor = Colors.white,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: isEnabled ? onTap : null,

      child: Container(
        // width: 330.w,
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 82.h,
        decoration: BoxDecoration(
          color: isPrimary && isEnabled
              ? AppTheme.listingButtonColor
              : !isPrimary && isEnabled
              ? color
              : Colors.grey,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isPrimary && isEnabled
                ? AppTheme.listingButtonColor
                : !isPrimary && isEnabled
                ? color
                : Colors.grey,
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: fontSize, fontWeight: FontWeight.w600, color: isPrimary ? Colors.white : textColor),
        ),
      ),
    );
  }

}
