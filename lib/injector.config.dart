// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_assistant_package/data/repo/auth_repository.dart'
    as _i8;
import 'package:flutter_assistant_package/data/repo/badge_repository.dart'
    as _i9;
import 'package:flutter_assistant_package/data/repo/card_repository.dart'
    as _i11;
import 'package:flutter_assistant_package/data/repo/cms_repository.dart'
    as _i10;
import 'package:flutter_assistant_package/data/repo/comment_repository.dart'
    as _i12;
import 'package:flutter_assistant_package/data/repo/coupon_repository.dart'
    as _i13;
import 'package:flutter_assistant_package/data/repo/gift_repository.dart'
    as _i14;
import 'package:flutter_assistant_package/data/repo/survery_repository.dart'
    as _i15;
import 'package:flutter_assistant_package/data/repo/term_repository.dart'
    as _i16;
import 'package:flutter_assistant_package/flutter_assistant_package.dart'
    as _i3;
import 'package:flutter_assistant_package/injector.dart' as _i17;
import 'package:flutter_assistant_package/network/base_network_module.dart'
    as _i18;
import 'package:flutter_assistant_package/network/network_info.dart' as _i5;
import 'package:flutter_assistant_package/network/urls_request.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AssistantSaveData>(_i3.AssistantSaveData());
    gh.lazySingleton<_i4.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i5.NetworkInfo>(() => _i5.NetworkInfoImpl());
    gh.lazySingleton<_i6.RestClient>(
        () => networkModule.restClient(gh<_i4.Dio>()));
    gh.singletonAsync<_i7.SharedPreferences>(() => registerModule.prefs);
    gh.factory<_i8.IAuthRepository>(
        () => _i8.AuthRepository(gh<_i6.RestClient>()));
    gh.factory<_i9.IBadgeRepository>(
        () => _i9.BadgeRepository(gh<_i6.RestClient>()));
    gh.factory<_i10.ICMSRepository>(
        () => _i10.CMSRepository(gh<_i6.RestClient>()));
    gh.factory<_i11.ICardRepository>(
        () => _i11.CardRepository(gh<_i6.RestClient>()));
    gh.factory<_i12.ICommentRepository>(
        () => _i12.CommentRepository(gh<_i6.RestClient>()));
    gh.factory<_i13.ICouponRepository>(
        () => _i13.CouponRepository(gh<_i6.RestClient>()));
    gh.factory<_i14.IGiftRepository>(
        () => _i14.GiftRepository(gh<_i6.RestClient>()));
    gh.factory<_i15.ISurveyRepository>(
        () => _i15.SurveyRepository(gh<_i6.RestClient>()));
    gh.factory<_i16.ITermsRepository>(
        () => _i16.TermsRepository(gh<_i6.RestClient>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}

class _$NetworkModule extends _i18.NetworkModule {}
