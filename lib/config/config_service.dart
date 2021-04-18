import 'package:dio/dio.dart';

import '../main.dart';

class ConfigService {
  var dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.baseUrl = '';
        options.receiveTimeout = 15000;
        options.connectTimeout = 15000;
        options.followRedirects = false;
        options.validateStatus = (status) {
          return status < 500;
        };
        return options;
      }),
    );
  Response response;
}
