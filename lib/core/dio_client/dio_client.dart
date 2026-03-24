import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: "https://fakestoreapi.com/",

          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          sendTimeout: Duration(seconds: 10),

          headers: {"Content-Type": "application/json"},
        ),
      );
}
