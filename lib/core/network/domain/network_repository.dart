import 'package:dio/dio.dart';
import 'package:cat_lover_app/core/network/models/result.dart';

abstract class NetworkRepository {
  Future<Result<Response<dynamic>>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Result<Response<dynamic>>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
