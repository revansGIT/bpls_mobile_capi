import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/utils/app_constant.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 250;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    globalLogger.d("--> ${options.method}  ${options.path}");
    globalLogger.d("Headers: ${options.headers.toString()}");
    globalLogger.d("Query Parameters: ${options.data.toString()}");
    globalLogger.d("<-- END HTTP");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    globalLogger.d("<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        globalLogger.d(responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      globalLogger.d(response.data.toString());
    }

    globalLogger.d("<-- END HTTP");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    globalLogger.d("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    super.onError(err, handler);
  }
}

class TokenInterceptor extends Interceptor {
  final Dio dio;

  TokenInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.unknown) {
      // No internet connection
      // Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      //     SwipeablePageRoute(
      //       canOnlySwipeFromEdge: true,
      //       backGestureDetectionWidth: 10,
      //       builder: (BuildContext ctx) {
      //         return NoInternetOrDataScreen(isNoInternet: true);
      //       },
      //     ),
      //     (route) => false);
    } else if (err.response!.statusCode == 401) {
      // Call the refresh token function
      // Retry the request with the new token
      final opts = Options(method: err.requestOptions.method, headers: {...err.requestOptions.headers, 'Authorization': 'Bearer ${await _getToken()}'});

      final cloneReq = await dio.request(err.requestOptions.path, options: opts, data: err.requestOptions.data, queryParameters: err.requestOptions.queryParameters);

      return handler.resolve(cloneReq);
    }
    return handler.next(err);
  }

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(AppConstant.tokenSharedData);
  }
}
