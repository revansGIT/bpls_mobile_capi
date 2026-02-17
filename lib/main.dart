// lib/main.dart

import 'package:bpls_mobile/business_logic/provider/alu_provider.dart';
import 'package:bpls_mobile/business_logic/provider/amon_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/auth_provider.dart';
import 'package:bpls_mobile/business_logic/provider/boro_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cal_provider.dart';
import 'package:bpls_mobile/business_logic/provider/carp_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cingri_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cow_provider.dart';
import 'package:bpls_mobile/business_logic/provider/dashboard_provider.dart';
import 'package:bpls_mobile/business_logic/provider/dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/helper_provider.dart';
import 'package:bpls_mobile/business_logic/provider/hen_provider.dart';
import 'package:bpls_mobile/business_logic/provider/location_helper_provider.dart';
import 'package:bpls_mobile/business_logic/provider/mango_provider.dart';
import 'package:bpls_mobile/business_logic/provider/mosur_provider.dart';
import 'package:bpls_mobile/business_logic/provider/peyaj_provider.dart';
import 'package:bpls_mobile/business_logic/provider/save_data_provider.dart';
import 'package:bpls_mobile/business_logic/provider/sorisha_provider.dart';
import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/core/theme/theme.dart';
// Routes and Bindings
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'business_logic/provider/aus_dhan_provider.dart';
import 'di_container.dart' as di;
import 'helper/helper.dart';

List<CameraDescription> cameras = [];
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: ".env");
  await di.init();
  // await initializeDateFormatting();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('myBox');

  // SyncService.initialize();
  // optionally register here or from provider startBackgroundSync()
  // SyncService.registerBackgroundSync();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<DashboardProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<LocationHelperProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SurveyProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<HelperProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SaveDataProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AmonDhanProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<BoroDhanProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AusDhanProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<DhanProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CalProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<MosurProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SorishaProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<MangoProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CarpProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CingriProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CowProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<HenProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AluProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<PeyajProvider>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    // 1. Initialize ScreenUtil
    return ScreenUtilInit(
      designSize: const Size(960, 1440),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FLW CAPI',
          theme: AppTheme.lightTheme,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          defaultTransition: Transition.cupertino,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
