
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:link_assignment/utils/constants.dart';

import 'api_client.dart';
import 'get_response.dart';

class ApiCall {
  static void makeCall(String method, String apiName, Map<String, Object> body,
      GetResponse responseCallback,
      [bool isRetry = false]) {
    // AppSharedPref.getString(AppSharedPref.KEY_AUTH_KEY).then((value) {
    var dio = ApiClient.getInstance();

    switch (method) {
      case Constants.METHOD_GET:
        dio!.get(apiName, queryParameters: body).then((response) {
          print("data in resonse ${response.data}");
          responseCallback.getResponse(json.encode(response.data));
        }).catchError((err) {
          if (!isRetry && err is DioError && err.response != null && err.response!.statusCode == 401) {
            makeCall(method, apiName, body, responseCallback, true);
          } else {
            responseCallback.getResponse("{ \"success\":false"+
                "\"status\" : 0"+
                "\"statusCode\" : ${err.response!.statusCode}"+
                "\"message\":${err.response!.statusMessage}");
          }
        });
        break;

      case Constants.METHOD_POST:
        dio!.post(apiName, data: jsonEncode(body)).then((response) {
          print('data is ${response.data}');

          responseCallback.getResponse(json.encode(response.data));

        }).catchError((err) {

          if (!isRetry && err is DioError && err.response != null && err.response!.statusCode == 401) {
            makeCall(method, apiName, body, responseCallback, true);
          } else {
            responseCallback.getResponse("{ \"success\":false"+
                "\"status\" : 0"+
                "\"statusCode\" : ${err.response!.statusCode}"+
                "\"message\":${err.response!.statusMessage}");
          }
        });

        break;
    }
    // });
  }
}
