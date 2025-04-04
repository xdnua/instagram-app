import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';

class ApiService {
  final Ref ref;
  static const _timeout = Duration(minutes: 3);
  late final Dio dio;
  late final routerService = ref.watch(AppService.router);

  ApiService(this.ref) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://67ea969e34bcedd95f63f453.mockapi.io/api/vi/',
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        sendTimeout: _timeout,
      ),
    );
  }

  Future<(Response?, Object?)> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return (response, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<(Response?, Object?)> post(String path, {Object? data}) async {
    try {
      final response = await dio.post(path, data: data);
      return (response, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<(Response?, Object?)> put(String path, {Object? data}) async {
    try {
      final response = await dio.put(path, data: data);

      return (response, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<(Response?, Object?)> delete(String path, {Object? data}) async {
    try {
      final response = await dio.delete(path, data: data);
      return (response, null);
    } catch (e) {
      return (null, e);
    }
  }
}
