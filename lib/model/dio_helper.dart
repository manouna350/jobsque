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
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {"Authorization": "Bearer ${token ?? ""} "};
    Response response =
        await dio.get(endPoint, data: data, queryParameters: query);
    return response;
  }

  static postData({
    String? token,
    required String endPoint,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {"Authorization": "Bearer $token "};
    var response = await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
    );
    return response.data;
  }

  static deleteData({
    required String endPoint,
    required Map<dynamic, dynamic> data,
  }) async {
    var response = await dio.delete(endPoint, data: data);
    return response.data;
  }
}
