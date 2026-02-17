import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:bpls_mobile/datasource/remote/dio/logging_interceptor.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/services/connectivity_service.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final String baseUrl;
  late LoggingInterceptor? loggingInterceptor;
  late SharedPreferences? sharedPreferences;
  final ConnectivityService connectivityService;

  Dio dio = Dio();
  String token = '';
  Dio dio1 = Dio();

  DioClient(this.baseUrl, Dio dioC, {this.loggingInterceptor, this.sharedPreferences, required this.connectivityService}) {
    token = storage.get(AppConstant.tokenSharedData) ?? "";
    dio = dioC;
    dio1 = dioC;
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration(minutes: 3)
      ..options.receiveTimeout = Duration(minutes: 3)
      ..httpClientAdapter = IOHttpClientAdapter()
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8', "Accept": "application/json", 'Authorization': 'Bearer $token'};
    dio.interceptors.add(loggingInterceptor!);
    // dio.interceptors.add(TokenInterceptor(dio));
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Response> get(String uri, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) async {
    try {
      if (!connectivityService.isConnected) {
        Fluttertoast.showToast(
          msg: 'নেটওয়ার্ক সংযোগ নেই। অনুগ্রহ করে ইন্টারনেট সংযোগ পরীক্ষা করুন।',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFD32F2F),
          textColor: const Color(0xFFFFFFFF),
        );
        throw SocketException('No network connection');
      }
      var response = await dio.get(uri, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
      return response;
    } on DioException catch (e) {
      globalLogger.d('DIO ERROR: $e');
      rethrow;
    } catch (e) {
      globalLogger.d('ERROR: $e');
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (!connectivityService.isConnected) {
        Fluttertoast.showToast(
          msg: 'নেটওয়ার্ক সংযোগ নেই। অনুগ্রহ করে ইন্টারনেট সংযোগ পরীক্ষা করুন।',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFD32F2F),
          textColor: const Color(0xFFFFFFFF),
        );
        throw SocketException('No network connection');
      }
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      globalLogger.d('DIO ERROR: $e');
      rethrow;
    } catch (e) {
      globalLogger.d('ERROR: $e');
      rethrow;
    }
  }

  Future<Response> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (!connectivityService.isConnected) {
        Fluttertoast.showToast(
          msg: 'নেটওয়ার্ক সংযোগ নেই। অনুগ্রহ করে ইন্টারনেট সংযোগ পরীক্ষা করুন।',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFD32F2F),
          textColor: const Color(0xFFFFFFFF),
        );
        throw SocketException('No network connection');
      }
      var response = await dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      globalLogger.d('DIO ERROR: $e');
      rethrow;
    } catch (e) {
      globalLogger.d('ERROR: $e');
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (!connectivityService.isConnected) {
        Fluttertoast.showToast(
          msg: 'নেটওয়ার্ক সংযোগ নেই। অনুগ্রহ করে ইন্টারনেট সংযোগ পরীক্ষা করুন।',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFD32F2F),
          textColor: const Color(0xFFFFFFFF),
        );
        throw SocketException('No network connection');
      }
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      globalLogger.d('DIO ERROR: $e');
      rethrow;
    } catch (e) {
      globalLogger.d('ERROR: $e');
      rethrow;
    }
  }

  Future<Response> delete(String uri, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      if (!connectivityService.isConnected) {
        Fluttertoast.showToast(
          msg: 'নেটওয়ার্ক সংযোগ নেই। অনুগ্রহ করে ইন্টারনেট সংযোগ পরীক্ষা করুন।',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFD32F2F),
          textColor: const Color(0xFFFFFFFF),
        );
        throw SocketException('No network connection');
      }
      var response = await dio.delete(uri, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      globalLogger.d('DIO ERROR: $e');
      rethrow;
    } catch (e) {
      globalLogger.d('ERROR: $e');
      rethrow;
    }
  }
}
