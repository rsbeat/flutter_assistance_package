import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_assistant/data/model/auth_type_model.dart';
import 'package:flutter_assistant/data/model/otp_model.dart';
import 'package:flutter_assistant/data/model/register_model.dart';
import 'package:flutter_assistant/data/model/user_me_model.dart';
import 'package:flutter_assistant/injector.dart';
import 'package:flutter_assistant/network/failures.dart';
import 'package:flutter_assistant/network/safe_api_call.dart';
import 'package:flutter_assistant/network/urls_request.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthRepository {
  Future<Either<Failure, RegisterModel>> login({required String authMethod, required String input});

  Future<Either<Failure, RegisterModel>> register({required String authMethod, required String input});

  Future<Response> logOut();

  Future<Either<Failure, OTPModel>> verifyOTP({required String authMethod, required String input, required String otp});

  Future<Response> sendOTP();

  Future<Either<Failure, AuthTypeModel>> authType();

  Future<Either<Failure, UserMeModel>> userMe();
}

@Injectable(as: IAuthRepository)
class AuthRepository extends IAuthRepository with SafeApiCall {
  final RestClient restClient;

  AuthRepository(this.restClient);

  @override
  Future<Either<Failure, AuthTypeModel>> authType() async {
    final either = await call(restClient.authType());
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Response> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterModel>> login({required String authMethod, required String input}) async {
    final either = await call(
      restClient.login(
        {
          'auth_method': authMethod,
          'input': input,
        },
      ),
    );
    return either.fold(
      (l) => left(l),
      (r) {
        return right(r!);
      },
    );
  }

  @override
  Future<Either<Failure, RegisterModel>> register({required String authMethod, required String input}) async {
    final either = await call(
      restClient.register(
        {
          'auth_method': authMethod,
          'input': input,
        },
      ),
    );
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Response> sendOTP() {
    // TODO: implement sendOTP
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserMeModel>> userMe() async {
    final either = await call(
      restClient.userMe(),
    );
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, OTPModel>> verifyOTP({required String authMethod, required String input, required String otp}) async {
    final either = await call(
      restClient.verifyOTP(
        {
          'auth_method': authMethod,
          'input': input,
          'otp': otp,
        },
      ),
    );
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }
}
