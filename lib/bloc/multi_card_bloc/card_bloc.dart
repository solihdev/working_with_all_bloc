import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/bloc/multi_card_bloc/card_event.dart';
import 'package:work_with_all_blocks/bloc/multi_card_bloc/card_state.dart';
import 'package:work_with_all_blocks/data/models/my_response/my_response.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';

class MultiCardBloc extends Bloc<MultiCardsEvent, MultiCardsState> {
  MultiCardBloc({required this.cardRepo}) : super(InitialCardsState()) {
    on<FetchAllCards>(_fetchAllCars);
  }

  final CardRepo cardRepo;

  _fetchAllCars(FetchAllCards event, Emitter<MultiCardsState> emit) async {
    emit(LoadCardsInProgress());

    MyResponse myResponse = await cardRepo.getAllCards();

    if (myResponse.error.isEmpty) {
      emit(LoadCardsInSuccess(cards: myResponse.data));
    } else {
      emit(LoadCardInFailure(errorText: myResponse.error));
    }
  }
}
