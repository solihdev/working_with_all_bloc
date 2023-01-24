import 'package:work_with_all_blocks/data/models/card_model/card_model.dart';

abstract class MultiCardsState {}

class InitialCardsState extends MultiCardsState {}

class LoadCardsInProgress extends MultiCardsState {}

class LoadCardsInSuccess extends MultiCardsState {
  LoadCardsInSuccess({required this.cards});

  final List<CardDate> cards;
}

class LoadCardInFailure extends MultiCardsState {
  LoadCardInFailure({required this.errorText});

  final String errorText;
}
