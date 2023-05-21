import 'package:dartz/dartz.dart';
import 'package:flutter_assistant/data/model/badge_model.dart';
import 'package:flutter_assistant/data/model/coupon_model.dart';
import 'package:flutter_assistant/network/failures.dart';
import 'package:flutter_assistant/network/safe_api_call.dart';
import 'package:flutter_assistant/network/urls_request.dart';
import 'package:flutter_assistant/utils/enums.dart';
import 'package:injectable/injectable.dart';

abstract class ICouponRepository {

  Future<Either<Failure, CouponModel>> get({
    String idOrSlug = '',
    List<Map<String, dynamic>> byWith = const [],
  });

  Future<Either<Failure, CouponModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  });

  Future<Either<Failure, CouponModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  });

}

@Injectable(as: ICouponRepository)
class CouponRepository extends ICouponRepository with SafeApiCall {
  final RestClient restClient;

  CouponRepository(this.restClient);


  @override
  Future<Either<Failure, CouponModel>> get({String idOrSlug = '', List<Map<String, dynamic>> byWith = const []}) async {
    final either = await call(restClient.getCoupon(idOrSlug, byWith));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, CouponModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  }) async {
    final either = await call(restClient.listCoupon(byWith, keyValues, perPage, orderByEnum.toString()));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, CouponModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  }) async{
    final either = await call(restClient.searchCoupon(keyword, columns, byWith, perPage));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }

}