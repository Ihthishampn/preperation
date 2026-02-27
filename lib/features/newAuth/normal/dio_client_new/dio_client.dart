import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient() : dio = Dio(
BaseOptions(

baseUrl: "https://dummyjson.com/auth/",

connectTimeout: Duration(seconds: 10),
receiveTimeout: Duration(seconds: 10),

headers: {"Content-type":"apllication/json"}

)



  );
}
