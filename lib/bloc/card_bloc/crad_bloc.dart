import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/card_event.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/crad_state.dart';
import 'package:work_with_all_blocks/data/models/my_response/my_response.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';

class CardBloc extends Bloc<CardsEvent, CardsState> {
  CardBloc({required this.cardRepo}) : super(InitialCardsState()) {
    on<FetchAllCards>(_fetchAllCars);
  }

  final CardRepo cardRepo;

  _fetchAllCars(FetchAllCards event, Emitter<CardsState> emit) async {
    emit(LoadCardsInProgress());

    MyResponse myResponse = await cardRepo.getAllCards();

    if (myResponse.error.isEmpty) {
      emit(LoadCardsInSuccess(cards: myResponse.data));
    } else {
      emit(LoadCardInFailure(errorText: myResponse.error));
    }
  }
}
