import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_assistant/injector.dart';
import 'package:flutter_assistant/network/failures.dart';
import 'package:retrofit/retrofit.dart';
import 'network_info.dart';

mixin SafeApiCall {
  final NetworkInfo _networkInfo = locator<NetworkInfo>();

  Future<Either<Failure, T?>> call<T>(Future<HttpResponse<T>> apiCall) async {
    if (await _networkInfo.isConnected) {
      try {
        final httpResponse = await apiCall;
        return right(httpResponse.data);
      } on DioError catch (error) {
        print('error ---> ${error.response}');
        if (error.type == DioErrorType.badResponse) {
          final response = error.response;
          final json = response?.data;
          if (json is Map<String, dynamic>) {
            // final errorResponse = ErrorResponse.fromJson(json);
            return left(
              ServerFailure(message: 'خطای نامشخص'

                  // errorResponse.error.isEmpty == true
                  //     ? 'خطای نامشخص'
                  //     : errorResponse.error,
                  ),
            );
          } else {
            return left(const UnknownFailure(message: ''));
          }
        } else {
          return left(const UnknownFailure());
        }
      }
    } else {
      return left(const InternetFailure());
    }
  }
}
