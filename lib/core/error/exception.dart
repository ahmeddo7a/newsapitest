import 'error_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel? errorMessageModel;
  final SimpleErrorMessage? simpleErrorMessage;
  const ServerException({ this.errorMessageModel, this.simpleErrorMessage});
}

class LocalDatabaseException implements Exception{
  final String message;
  const LocalDatabaseException(this.message);
}