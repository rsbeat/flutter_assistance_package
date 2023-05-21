import 'package:dartz/dartz.dart';
import 'package:flutter_assistant/data/model/badge_model.dart';
import 'package:flutter_assistant/data/model/gift_model.dart';
import 'package:flutter_assistant/data/model/terms_model.dart';
import 'package:flutter_assistant/network/failures.dart';
import 'package:flutter_assistant/network/safe_api_call.dart';
import 'package:flutter_assistant/network/urls_request.dart';
import 'package:flutter_assistant/utils/enums.dart';
import 'package:injectable/injectable.dart';

abstract class ITermsRepository {
  Future<Either<Failure, TermsModel>> get({
    List<Map<String, dynamic>> byWith = const [],
  });

  Future<Either<Failure, TermsModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  });

  Future<Either<Failure, TermsModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  });
}

@Injectable(as: ITermsRepository)
class TermsRepository extends ITermsRepository with SafeApiCall {
  final RestClient restClient;

  TermsRepository(this.restClient);

  @override
  Future<Either<Failure, TermsModel>> get({List<Map<String, dynamic>> byWith = const []}) async {
    final either = await call(restClient.getTerm(byWith));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, TermsModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  }) async {
    final either = await call(restClient.termList(keyValues, orderByEnum.toString(), byWith, perPage));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, TermsModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  }) async {
    final either = await call(restClient.termSearch(keyword, columns, byWith, perPage));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }
}
