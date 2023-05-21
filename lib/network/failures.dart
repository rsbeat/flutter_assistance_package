import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? code;
  final String? errorKey;

  const Failure(this.message, {this.code, this.errorKey});

  @override
  List<Object?> get props => [message, code, errorKey];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({message, code, errorKey})
      : super(message, code: code, errorKey: errorKey);
}

class InternetFailure extends Failure {
  const InternetFailure({message = 'به اینترنت متصل شوید!'}) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure({message = 'در حال حاضر مشکلی پیش آمده است.'})
      : super(message);
}
