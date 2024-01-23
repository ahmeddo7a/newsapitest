import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final Map<String, dynamic> response;

  const ErrorMessageModel(
      {
        required this.response});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      response: json,
    );
  }

  @override
  List<Object?> get props => [
    response
    // messageList,
    //secondMessage
  ];
}

class SimpleErrorMessage extends Equatable {
  final String response;

  const SimpleErrorMessage(
      {
        required this.response});

  factory SimpleErrorMessage.fromJson(String json) {
    return SimpleErrorMessage(
      response: json,
    );
  }

  @override
  List<Object?> get props => [
    response
    // messageList,
    //secondMessage
  ];
}