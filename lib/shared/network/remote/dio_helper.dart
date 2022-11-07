import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;



  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: false,
      ),
    );
  }

  static Future<dynamic> getData({
    required String url,
    Map <String,dynamic> ?query,


  }) async
  {return await dio.get(url, queryParameters: query,);

  }

}