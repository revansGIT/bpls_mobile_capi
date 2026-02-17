import 'package:dio/dio.dart';
import 'package:bpls_mobile/datasource/model/base/api_response.dart';
import 'package:bpls_mobile/datasource/remote/exception/api_error_handler.dart';

Future<ApiResponse> handleApiCall(Future<Response> Function() apiCall) async {
  Response response = Response(requestOptions: RequestOptions(path: ''));
  try {
    response = await apiCall();
    return ApiResponse.withSuccess(response);
  } catch (e) {
    return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
  }
}
