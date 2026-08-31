
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient():dio = Dio(
    BaseOptions(
      baseUrl: '',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: { 
      'Content-Type': 'application/json',
      }
    )
  );
}