import 'package:dio/dio.dart';
import 'package:link_assignment/data/remote/logging_interceptors.dart';
import 'package:link_assignment/utils/constants.dart';

class ApiClient {

  static const int CONNECT_TIMEOUT_TIME = 30000;
  static const int RECEIVE_TIMEOUT_TIME = 30000;
  static Dio? client;

  static Dio? getInstance() {
    if (client == null) {
      client = Dio();
      client!.options.baseUrl = Constants.BASE_URL;
      client!.options.connectTimeout = CONNECT_TIMEOUT_TIME;
      client!.options.receiveTimeout = RECEIVE_TIMEOUT_TIME;
      client!.options.headers['Accept'] = 'application/json';
      client!.options.contentType = 'application/json';
      //client!.options.headers['Authorization'] = 'Bearer 171a70zza0i61k645epd061xdndus704';
      client!.options.followRedirects = false;
      client!.interceptors.add(LoggingInterceptor());
    }
    return client;
  }
}
