import 'package:bonus_app_admin/config/my_interseptors.dart';
import 'package:dio/dio.dart';

class MyDio{
  final Dio _dio = Dio();
  MyDio(){
    _dio.interceptors.add(MyInterceptor());
  }
  Dio dio(){
    return _dio;
  }
}