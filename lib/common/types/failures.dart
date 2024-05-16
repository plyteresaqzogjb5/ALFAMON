abstract class Failure {
  String get message;
}

class InvalidDataFailure extends Failure {
  @override
  final String message;

  InvalidDataFailure({required this.message});
}

class InvalidException implements Exception {
  final Object response;
  InvalidException({required this.response});
}

class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure({this.statusCode});

  @override
  String get message {
    switch (statusCode) {
      case -3:
        return 'Internet Connection Error';
      case 403:
        return 'Forbidden';
      default:
        return 'Response Error';
    }
  }
}
