import 'package:bpls_mobile/core/theme/theme.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {

        if(storage.containsKey(AppConstant.tokenSharedData)){
          // Get.offNamed(AppRoutes.screenCal);
          Get.offNamed(AppRoutes.dashboard);
        }else{
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    saveData();
     _navigateToNextScreen();
  }


  void saveData() async {
    // providerSaveData.resetSharedData();
    await providerSaveData.initPrefs();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: SizedBox()),
                FractionallySizedBox(widthFactor: 0.20, child: Image.asset('assets/images/national_logo.png', fit: BoxFit.contain)),

                SizedBox(height: 12.h),

                // Main project title
                Text(
                  'ফসলের ক্ষতি ও অপচয় নিরূপণ জরিপ-২০২৬',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 40.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark, height: 1.79, letterSpacing: -0.04 * 40.sp),
                ),

                Expanded(child: SizedBox()),

                // For public welfare
                Text(
                  'জনস্বার্থে',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 32.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark),
                ),

                SizedBox(height: 12.h),

                // BBS logo (smaller)
                FractionallySizedBox(widthFactor: 0.15, child: Image.asset('assets/images/bbs_logo.png', fit: BoxFit.contain)),

                SizedBox(height: 12.h),

                // BBS title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    'বাংলাদেশ পরিসংখ্যান ব্যুরো (বিবিএস)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Noto Sans Bengali', fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppTheme.textDark, height: 1.2),
                  ),
                ),

                SizedBox(height: 55.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
