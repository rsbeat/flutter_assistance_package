import 'package:dartz/dartz.dart';
import 'package:flutter_assistant_package/data/model/gift_model.dart';
import 'package:flutter_assistant_package/network/failures.dart';
import 'package:flutter_assistant_package/network/safe_api_call.dart';
import 'package:flutter_assistant_package/network/urls_request.dart';
import 'package:flutter_assistant_package/utils/enums.dart';

import 'package:injectable/injectable.dart';

abstract class IGiftRepository {
  Future<Either<Failure, GiftModel>> get({
    String idOrSlug = '',
    List<Map<String, dynamic>> byWith = const [],
  });

  Future<Either<Failure, GiftModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  });

  Future<Either<Failure, GiftModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  });
}

@Injectable(as: IGiftRepository)
class GiftRepository extends IGiftRepository with SafeApiCall {
  final RestClient restClient;

  GiftRepository(this.restClient);

  @override
  Future<Either<Failure, GiftModel>> get({String idOrSlug = '', List<Map<String, dynamic>> byWith = const []}) async {
    final either = await call(restClient.getGift(idOrSlug, byWith));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, GiftModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  }) async {
    final either = await call(restClient.listGift(byWith, keyValues, perPage, orderByEnum.toString()));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, GiftModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  }) async {
    final either = await call(restClient.searchGift(keyword, columns, byWith, perPage));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }
}
