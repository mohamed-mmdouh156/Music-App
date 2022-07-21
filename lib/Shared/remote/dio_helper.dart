
import 'package:dio/dio.dart';

class DioHelper{

  static Dio ?dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.musixmatch.com/ws/1.1/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/Json'
        }
      ) ,
    );
  }

  static Future<Response> getDate({
    required String url,
    Map <String,dynamic> ?query
  }) async
  {
    return await dio!.get(url,queryParameters: query) ;
  }

  static Future<Response> postDate({
    required String method,
    Map <String,dynamic> ?query,
    required Map<String,dynamic> data,
  }) async{
    return await dio!.post(method,queryParameters: query,data: data);
  }

}