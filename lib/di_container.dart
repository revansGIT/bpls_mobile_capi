import 'package:bpls_mobile/business_logic/logic/dashboard_business_logic.dart';
import 'package:bpls_mobile/business_logic/provider/alu_provider.dart';
import 'package:bpls_mobile/business_logic/provider/amon_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/auth_provider.dart';
import 'package:bpls_mobile/business_logic/provider/boro_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cal_provider.dart';
import 'package:bpls_mobile/business_logic/provider/carp_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cingri_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cow_provider.dart';
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
import 'package:bpls_mobile/datasource/fetch_data/dashboard_fetch_data.dart';
import 'package:bpls_mobile/datasource/repository/auth_repo.dart';
import 'package:bpls_mobile/datasource/repository/dashboard_repo.dart';
import 'package:bpls_mobile/services/connectivity_service.dart';
import 'package:bpls_mobile/services/location_service.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic/provider/aus_dhan_provider.dart';
import 'business_logic/provider/dashboard_provider.dart';
import 'datasource/remote/dio/dio_client.dart';
import 'datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External - Initialize SharedPreferences first
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  // Core
  sl.registerLazySingleton(() => ConnectivityService());
  sl.registerLazySingleton(() => LocationService(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl(), connectivityService: sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton<DashboardRepo>(() => DashboardRepoFetchData(dioClient: sl()));
  sl.registerLazySingleton<DashboardProvider>(() => DashboardBusinessLogic(repository: sl<DashboardRepo>()));
  // Provider
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => LocationHelperProvider());
  sl.registerFactory(() => SurveyProvider(sl()));
  sl.registerFactory(() => HelperProvider());
  sl.registerFactory(() => AmonDhanProvider());
  sl.registerFactory(() => AusDhanProvider());
  sl.registerFactory(() => BoroDhanProvider());
  sl.registerFactory(() => CalProvider());
  sl.registerFactory(() => DhanProvider());
  sl.registerFactory(() => MosurProvider());
  sl.registerFactory(() => SorishaProvider());
  sl.registerFactory(() => MangoProvider());
  sl.registerFactory(() => CarpProvider());
  sl.registerFactory(() => CingriProvider());
  sl.registerFactory(() => CowProvider());
  sl.registerFactory(() => HenProvider());
  sl.registerFactory(() => AluProvider());
  sl.registerFactory(() => PeyajProvider());
  sl.registerFactory(() => SaveDataProvider(authRepo: sl(),prefs:  sl()));
}
