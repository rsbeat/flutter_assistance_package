import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_assistant/data/model/cms_model.dart';
import 'package:flutter_assistant/network/failures.dart';
import 'package:flutter_assistant/network/safe_api_call.dart';
import 'package:flutter_assistant/network/urls_request.dart';
import 'package:flutter_assistant/utils/enums.dart';
import 'package:injectable/injectable.dart';



abstract class ICMSRepository {
  Future<Either<Failure, CMSModel>> get({
    String idOrSlug = '',
    List<Map<String, dynamic>> byWith = const [],
  });

  Future<Either<Failure, CMSModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  });

  Future<Either<Failure, CMSModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  });

  Future<Either<Failure, CMSModel>> signal(
    int postId,
    String type,
    String myValue,
  );
}

@Injectable(as: ICMSRepository)
class CMSRepository extends ICMSRepository with SafeApiCall {
  final RestClient restClient;

  CMSRepository(this.restClient);

  @override
  Future<Either<Failure, CMSModel>> get({String idOrSlug = '', List<Map<String, dynamic>> byWith = const []}) async {
    final either = await call(restClient.getCms(idOrSlug, byWith));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, CMSModel>> list({
    List<Map<String, dynamic>> byWith = const [],
    List<Map<String, dynamic>> keyValues = const [],
    int perPage = 20,
    OrderByEnum orderByEnum = OrderByEnum.LATEST,
  }) async {
    final either = await call(restClient.listCms(byWith, keyValues, perPage, orderByEnum.toString()));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, CMSModel>> search({
    String keyword = '',
    List<Map<String, dynamic>> columns = const [],
    List<Map<String, dynamic>> byWith = const [],
    int perPage = 20,
  }) async{
    final either = await call(restClient.searchCms(keyword, columns, byWith, perPage));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }

  @override
  Future<Either<Failure, CMSModel>> signal(int postId, String type, String myValue) async{
    final either = await call(restClient.signalCms(postId, type, myValue));
    return either.fold(
          (l) => left(l),
          (r) => right(r!),
    );
  }
}
