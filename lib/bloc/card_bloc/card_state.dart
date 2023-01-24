import 'package:work_with_all_blocks/data/models/card_model/card_model.dart';

abstract class CardsState {}

class InitialCardsState extends CardsState {}

class LoadCardsInProgress extends CardsState {}

class LoadCardsInSuccess extends CardsState {
  LoadCardsInSuccess({required this.cards});

  final List<CardDate> cards;
}

class LoadCardInFailure extends CardsState {
  LoadCardInFailure({required this.errorText});

  final String errorText;
}
