import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_weather/app/app.logger.dart';
import 'package:food_weather/core/constants/app_url.dart';

class APIService {
  final log = getLogger("APIService");
  late Dio dio;
  APIService() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppUrl.baseUrl,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  Future<dynamic> delete(
    String route,
    Map<String, List>? body,
  ) async {
    log.v("getting data fro $route");
    var response = await dio.patch(
      route,
      data: jsonEncode(body),
    );
    log.v("the data fro $route is ${response.data}");
    return response.data;
  }

  Future<dynamic> get({
    required String route,
    Map<String, String>? queryParameters,
  }) async {
    log.v("getting data fro $route");
    var response = await dio.get(route, queryParameters: queryParameters);
    log.v("the data fro $route is ${response.data}");
    return response.data;
  }

  Future<dynamic> patch(
    String route,
    Map<String, String> body,
  ) async {
    log.v("getting data fro $route");
    var response = await dio.patch(
      route,
      data: body,
    );
    log.v("the data fro $route is ${response.data}");
    return response.data;
  }

  Future<dynamic> post({
    required String route,
    required Map<String, dynamic> body,
  }) async {
    log.v("posting $body fro $route");
    var response = await dio.post(
      route,
      data: body,
    );
    log.v("posting ${response.data} fro $route");
    return response.data;
  }

  Future<dynamic> post2({
    required String route,
    required String body,
  }) async {
    log.v("posting $body fro $route");
    var response = await dio.post(
      route,
      data:jsonEncode(body),
    );
    log.v("posting ${response.data} from ${AppUrl.baseUrl}/$route");
    return response.data;
  }

  Future<dynamic> put(
    String route,
    Map<String, String> body,
  ) async {
    log.v("getting data fro $route");
    var response = await dio.put(
      route,
      data: body,
    );
    log.v("the data fro $route is ${response.data}");
    return response.data;
  }
}