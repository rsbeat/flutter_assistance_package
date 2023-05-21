import 'package:dartz/dartz.dart';
import 'package:flutter_assistant/data/model/badge_model.dart';
import 'package:flutter_assistant/network/failures.dart';
import 'package:flutter_assistant/network/safe_api_call.dart';
import 'package:flutter_assistant/network/urls_request.dart';
import 'package:flutter_assistant/utils/enums.dart';
import 'package:injectable/injectable.dart';

abstract class IBadgeRepository {

  Future<Either<Failure, BadgeModel>> get({
    String idOrSlug = '',
    List<Map<String, dynamic>> byWith = const [],
  });

  Future<Either<Failure, BadgeModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  });

  Future<Either<Failure, BadgeModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  });

}

@Injectable(as: IBadgeRepository)
class BadgeRepository extends IBadgeRepository with SafeApiCall {
  final RestClient restClient;

  BadgeRepository(this.restClient);


  @override
  Future<Either<Failure, BadgeModel>> get({String idOrSlug = '', List<Map<String, dynamic>> byWith = const []}) async {
    final either = await call(restClient.getBadge(idOrSlug, byWith));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, BadgeModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  }) async {
    final either = await call(restClient.listBadge(byWith, keyValues, perPage, orderByEnum.toString()));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, BadgeModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  }) async{
    final either = await call(restClient.searchBadge(keyword, columns, byWith, perPage));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }

}