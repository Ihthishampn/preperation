import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient() : dio = Dio(BaseOptions(

headers: {"Content-type":"application/json"},


connectTimeout: Duration(seconds: 10),
receiveTimeout: Duration(seconds: 10),
sendTimeout: Duration(seconds: 10),
baseUrl: "https://fakestoreapi.com/",


  ));
}


