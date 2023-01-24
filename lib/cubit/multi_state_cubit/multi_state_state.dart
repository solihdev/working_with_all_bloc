abstract class MultiStateState {}

class MultiStateInitial extends MultiStateState {}

class GettingDateInProgress extends MultiStateState {}

class GettingDateInFailure extends MultiStateState {
  String error;

  GettingDateInFailure({
    required this.error,
  });
}

class GettingDateInSuccess extends MultiStateState {
  List cards;

  GettingDateInSuccess({
    required this.cards,
  });
}
