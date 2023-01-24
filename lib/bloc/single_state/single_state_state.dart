// part of 'single_state_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:work_with_all_blocks/data/models/status/data_status.dart';

class SingleState extends Equatable {
  Status? status;
  String? error;
  List? cards;

  SingleState({
    this.status,
    this.error,
    this.cards,
  });

  SingleState copyWith({
    Status? status,
    String? error,
    List? cards,
  }) {
    return SingleState(
        error: error ?? this.error,
        cards: cards ?? this.cards,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, error, cards];
}
