import 'package:dio/dio.dart';
import '../domain/network_repository.dart';
import '../clients/dio_client.dart';
import '../models/result.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final Dio _dio = DioProvider.instance;

  @override
  Future<Result<Response>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return Result.success(response);
    } on DioException catch (e) {
      return Result.failure(_mapDioError(e));
    } catch (e) {
      return Result.failure('Error inesperado: $e');
    }
  }

  @override
  Future<Result<Response>> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Result.success(response);
    } on DioException catch (e) {
      return Result.failure(_mapDioError(e));
    } catch (e) {
      return Result.failure('Error inesperado: $e');
    }
  }

  String _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Tiempo de conexión agotado';
      case DioExceptionType.receiveTimeout:
        return 'Tiempo de respuesta agotado';
      case DioExceptionType.badResponse:
        return 'Error en la respuesta: ${e.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Petición cancelada';
      default:
        return 'Error desconocido: ${e.message}';
    }
  }
}
