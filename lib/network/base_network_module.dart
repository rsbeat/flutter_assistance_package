import 'package:dio/dio.dart';

import 'package:flutter_assistant_package/injector.dart';
import 'package:flutter_assistant_package/network/urls_request.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(BaseOptions());
    return dio
      ..interceptors.addAll(
        [
          QueuedInterceptorsWrapper(
            onRequest: (options, handler) async {
              // final pref = locator<SharedPreferences>();
              final pref = await locator.getAsync<SharedPreferences>();
              // final pref = await SharedPreferences.getInstance();
              options.headers['Authorization'] = "Bearer ${pref.getString("UserToken")}";
              options.headers['accept-language'] = "fa";
              return handler.next(options);
            },
            onError: (e, handler) async {
              if (e.response != null) {
                final statusCode = e.response?.statusCode;
                print(statusCode);
                if (statusCode == 401) {
                } else {
                  return handler.next(e);
                }
              } else {
                return handler.next(e);
              }
            },
          ),
        ],
      );
  }

  @lazySingleton
  Future<RestClient> restClient(Dio dio) async {
    // final pref = locator<SharedPreferences>();
    final pref = await locator.getAsync<SharedPreferences>();
    final test = pref.getString("BaseURL");
    return RestClient(
      dio,
      baseUrl: pref.getString("BaseURL") ?? "",
    );
  }
}
