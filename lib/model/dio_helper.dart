import 'package:dio/dio.dart';
import 'constant.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      "content-type": "application/json",
      "accept": "application/json",
    }));
  }

  static getData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {"Authorization": "Bearer ${token ?? ''} "};
    Response response = await dio.get(url, data: data, queryParameters: query);
    return response;
  }

  static postData({
    String? token,
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {"Authorization": "Bearer ${token ?? ''} "};
    var response = await dio.post(url, data: data, queryParameters: query);
    return response.data;
  }
  //
  // static deleteData({
  //   required String url,
  //   required Map<String, dynamic> data,
  // }) async {
  //   var response = await dio.delete(url, data: data);
  //   return response.data;
  // }
}
