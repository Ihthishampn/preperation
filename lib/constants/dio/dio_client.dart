import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          headers: {  "Content-type": "application/json",},
          baseUrl: "https://jsonplaceholder.typicode.com/",
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          sendTimeout: Duration(seconds: 10),
        ),
      );
}
