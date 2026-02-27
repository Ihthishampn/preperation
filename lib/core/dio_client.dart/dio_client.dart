import 'package:dio/dio.dart';
import 'package:inter/core/api/end_points.dart';

class DioClientnew {
  final Dio dio;

  DioClientnew()
    : dio = Dio(
        BaseOptions(
          headers: {"Content-type": "application/json"},
          baseUrl: EndPoints().baseUrlAuth,
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      );
}
