import 'package:dartz/dartz.dart';
import 'package:flutter_assistant_package/data/model/comment_model.dart';
import 'package:flutter_assistant_package/network/failures.dart';
import 'package:flutter_assistant_package/network/safe_api_call.dart';
import 'package:flutter_assistant_package/network/urls_request.dart';

import 'package:injectable/injectable.dart';

abstract class ICommentRepository {
  Future<Either<Failure, CommentModel>> getComments({required String type, required int id, int perPage = 20});
}

@Injectable(as: ICommentRepository)
class CommentRepository extends ICommentRepository with SafeApiCall {
  final RestClient restClient;

  CommentRepository(this.restClient);

  @override
  Future<Either<Failure, CommentModel>> getComments({required String type, required int id, int perPage = 20}) async {
    final either = await call(restClient.getComments(type, id, perPage));
    return either.fold(
      (l) => left(l),
      (r) => right(r!),
    );
  }
}
