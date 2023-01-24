part of 'single_state_cubit.dart';

class CubitSingleState extends Equatable {
  Status? status;
  String? error;
  List? card;

  CubitSingleState({
    this.status,
    this.error,
    this.card,
  });

  CubitSingleState copyWith({
    Status? status,
    String? error,
    List? card,
  }) {
    return CubitSingleState(
      status: status ?? this.status,
      error: error ?? this.error,
      card: card ?? this.card,
    );
  }

  @override
  List<Object?> get props => [status, error, card];
}
