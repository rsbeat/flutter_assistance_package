library flutter_assistant_package;

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assistant_package/data/model/auth_type_model.dart';
import 'package:flutter_assistant_package/data/model/otp_model.dart';
import 'package:flutter_assistant_package/data/model/register_model.dart';
import 'package:flutter_assistant_package/data/model/user_me_model.dart';
import 'package:flutter_assistant_package/data/repo/auth_repository.dart';
import 'package:flutter_assistant_package/injector.dart';
import 'package:flutter_assistant_package/network/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

class FlutterAssistant {
  final repo = locator<IAuthRepository>();
  FlutterAssistant();
  final saveData = locator<AssistantSaveData>();

  Future init({required String appToken, required String baseURL}) async {
    // final saveData = await locator<AssistantSaveData>();
    await saveData._setDataToPref(appToken: appToken, baseURL: baseURL);
  }

  Future<Either<Failure, AuthTypeModel>> authType() async {
    final response = await repo.authType();
    return response;
  }

  Future<Either<Failure, UserMeModel>> userMe() async {
    final response = await repo.userMe();
    return response;
  }

  Future<Either<Failure, RegisterModel>> login({required String authMethod, required String input}) async {
    final response = await repo.login(authMethod: authMethod, input: input);

    // saveData._setLoginToken(
    //     token:
    //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzYm9yaGFuaSIsImp0aSI6Ijg1YWNmMjljLTA3NWYtNDE4ZC04M2NjLTZjOTI4ZjgxMzcxNyIsImVtYWlsIjoic2JvcmhhbmlAZ21haWwuY29tIiwidWlkIjoiYTMwMWY3ZjItNWE3OC00YjQwLWE4ZjktMTRmZDIzN2E3MzYzIiwiZXhwIjoxODMyMjI0MzYxLCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.2Y37vUMInEK60OC5NyoXR9bFxWBQzVLyqaqblQ3k_V8");

    return response;
  }

  Future<Either<Failure, RegisterModel>> register({required String authMethod, required String input}) async {
    final response = await repo.register(authMethod: authMethod, input: input);
    return response;
  }

  Future<Either<Failure, OTPModel>> verifyOTP({required String authMethod, required String input, required String otp}) async {
    final response = await repo.verifyOTP(authMethod: authMethod, input: input, otp: otp);
    response.fold((l) => debugPrint(l.toString()), (r) => saveData._setLoginToken(token: r.data!.token!));
    return response;
  }
}

@singleton
class AssistantSaveData {
  Future _setDataToPref({required String appToken, required String baseURL}) async {
    final pref = locator<SharedPreferences>();
    // final pref = await SharedPreferences.getInstance();

    await pref.setString("Token", appToken);
    await pref.setString("BaseURL", baseURL);
  }

  void _setLoginToken({required String token}) async {
    final pref = locator<SharedPreferences>();
    // final pref = await SharedPreferences.getInstance();
    pref.setString("UserToken", token);
  }
}
