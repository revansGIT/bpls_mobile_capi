import 'dart:developer';

import 'package:bpls_mobile/features/auth/presentation/login_screen.dart';
import 'package:get/get.dart';
import 'package:bpls_mobile/datasource/model/base/error_response.dart';
import 'package:dio/dio.dart';
import 'package:bpls_mobile/helper/global.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.unknown:
              errorDescription = "Connection to API server failed due to internet connection";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 405:
                  errorDescription = "You have already accessed";
                  break;
                case 404:
                  // print('ememmemememm ememe,  ${error.response!.data['value']['message']}');
                  errorDescription = '404 Not Found';
                  // errorDescription = error.response!.data['value']['message'];
                  break;
                case 401:
                  errorDescription = error.response!.data['message'];
                  resetStorage();
                  // Get.snackbar('Message', errorDescription);
                  Get.offAll(() => LoginScreen());
                  break;
                case 400:
                case 500:
                case 503:
                  log(error.response!.data.toString());
                  if (error.response!.data['message'] != null) {
                    errorDescription = error.response!.data['message'];
                  } else {
                    errorDescription = error.response!.data['error'];
                  }

                  break;
                case 422:
                  errorDescription = error.response!.data['message'];
                  break;
                default:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.error.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription = "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            case DioExceptionType.badCertificate:
              errorDescription = "Bad certificate";
              break;
            default:
              errorDescription = "Unexpected error occured";
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
