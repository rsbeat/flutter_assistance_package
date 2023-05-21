import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_assistant/injector.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() async {
  locator.init();
}

@module
abstract class SharedModel {
  @singleton
  Future<SharedPreferences> shared() async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }
}
