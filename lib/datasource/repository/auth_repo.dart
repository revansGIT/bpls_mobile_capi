import 'package:bpls_mobile/datasource/data_source_helper.dart';
import 'package:bpls_mobile/datasource/model/base/api_response.dart';
import 'package:bpls_mobile/datasource/model/payload_model.dart';
import 'package:bpls_mobile/datasource/remote/dio/dio_client.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login(String email, String password) async {
    return handleApiCall(() => dioClient.post(AppConstant.login, data: {'email': email, 'password': password, 'deviceId': uuid.v6(), 'appVersion': '${dotenv.env['APP_VERSION']}'}));
  }

  Future<ApiResponse> submitForm(PayloadModel payloadMoel) async {
    return handleApiCall(() => dioClient.post(AppConstant.submitForm,
        data: {"uuid": uuid.v6(), "survey_code": "FOOD_LOSS", "form_version": "1.0.0", "payload": payloadMoel.toJson()}));
  }

  Future<ApiResponse> countByType() async {
    return handleApiCall(() => dioClient.get(AppConstant.countByType));
  }

  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    await storage.put(AppConstant.tokenSharedData, token);
  }
}
