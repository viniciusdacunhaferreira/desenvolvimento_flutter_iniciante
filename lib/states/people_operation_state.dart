abstract class PeopleOperationState {}

class IdlePeopleOperationState extends PeopleOperationState {}

class SuccessPeopleOperationState extends PeopleOperationState {
  SuccessPeopleOperationState(this.message);

  final String message;
}

class ErrorPeopleOperationState extends PeopleOperationState {
  ErrorPeopleOperationState(this.error);

  final Exception error;
}
