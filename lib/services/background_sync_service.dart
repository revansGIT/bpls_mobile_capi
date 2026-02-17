// import 'dart:convert';
//
// import 'package:bpls_mobile/datasource/model/payload_model.dart';
// import 'package:bpls_mobile/datasource/repository/auth_repo.dart';
// import 'package:bpls_mobile/helper/global.dart';
// import 'package:bpls_mobile/utils/app_constant.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get_it/get_it.dart';
// import 'package:workmanager/workmanager.dart';
//
// final sl = GetIt.instance;
//
// const String _taskName = 'backgroundSyncTask';
//
// class BackgroundSyncService {
//   // Initialize Workmanager. Call this from main() once.
//   static void initialize() {
//     Workmanager().initialize(_callbackDispatcher, isInDebugMode: false);
//   }
//
//   // Register periodic task. Android minimum period is 15 minutes.
//   static void registerPeriodicSync() {
//     Workmanager().registerPeriodicTask(
//       'sync_saved_payloads',
//       _taskName,
//       frequency: const Duration(minutes: 15),
//       existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
//       constraints: Constraints(networkType: NetworkType.connected),
//     );
//   }
//
//   // Save failed submission to storage (khana list by default). We store as JSON map.
//   static Future<void> saveFailedSubmission(PayloadModel payload, {bool isOrganization = false}) async {
//     final key = isOrganization ? AppConstant.savedPayloadList : AppConstant.savedPayloadListKhana;
//     List<dynamic>? list = storage.get(key);
//     list = list ?? [];
//
//     // Add payload json
//     list.add(payload.toJson());
//     await storage.put(key, list);
//
//     // increment last saved number counter
//     int last = storage.get(AppConstant.lastSavedNumber) ?? 0;
//     await storage.put(AppConstant.lastSavedNumber, last + 1);
//   }
//
//   static Future<List<PayloadModel>> _loadSavedPayloads({required bool isOrganization}) async {
//     final key = isOrganization ? AppConstant.savedPayloadList : AppConstant.savedPayloadListKhana;
//     final List<dynamic>? raw = storage.get(key);
//     if (raw == null) return [];
//     final List<PayloadModel> result = [];
//     for (var item in raw) {
//       try {
//         if (item is Map) {
//           result.add(PayloadModel.fromJson(item));
//         } else if (item is String) {
//           result.add(PayloadModel.fromJson(jsonDecode(item)));
//         } else if (item is Map<String, dynamic>) {
//           result.add(PayloadModel.fromJson(item));
//         }
//       } catch (e) {
//         // skip malformed
//       }
//     }
//
//     // dedupe by timeStamp if available
//     final seen = <String>{};
//     final deduped = <PayloadModel>[];
//     for (var p in result) {
//       final id = p.timeStamp ?? jsonEncode(p.toJson());
//       if (!seen.contains(id)) {
//         deduped.add(p);
//         seen.add(id);
//       }
//     }
//     return deduped;
//   }
//
//   static Future<void> _persistPayloads(List<PayloadModel> list, {required bool isOrganization}) async {
//     final key = isOrganization ? AppConstant.savedPayloadList : AppConstant.savedPayloadListKhana;
//     final List<dynamic> raw = list.map((p) => p.toJson()).toList();
//     await storage.put(key, raw);
//   }
//
//   // Try to submit a payload using AuthRepo from DI. Return true on success.
//   static Future<bool> _trySubmit(PayloadModel payload) async {
//     try {
//       final authRepo = sl<AuthRepo>();
//       final response = await authRepo.submitForm(payload);
//       return response.response.statusCode == 200;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   // Process saved payloads: check connectivity, try to submit and remove successes.
//   static Future<void> processSavedPayloads() async {
//     final conn = await Connectivity().checkConnectivity();
//     if (conn == ConnectivityResult.none) return;
//
//     // process khana
//     final khanaList = await _loadSavedPayloads(isOrganization: false);
//     final remainingKhana = <PayloadModel>[];
//     for (var p in khanaList) {
//       final ok = await _trySubmit(p);
//       if (!ok) remainingKhana.add(p);
//     }
//     await _persistPayloads(remainingKhana, isOrganization: false);
//
//     // process organization
//     final orgList = await _loadSavedPayloads(isOrganization: true);
//     final remainingOrg = <PayloadModel>[];
//     for (var p in orgList) {
//       final ok = await _trySubmit(p);
//       if (!ok) remainingOrg.add(p);
//     }
//     await _persistPayloads(remainingOrg, isOrganization: true);
//   }
// }
//
// // Workmanager callback dispatcher
// void _callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     await BackgroundSyncService.processSavedPayloads();
//     return Future.value(true);
//   });
// }
