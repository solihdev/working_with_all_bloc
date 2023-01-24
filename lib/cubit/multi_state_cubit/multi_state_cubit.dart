import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/cubit/multi_state_cubit/multi_state_state.dart';
import 'package:work_with_all_blocks/data/models/my_response/my_response.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';

class MultiStateCubit extends Cubit<MultiStateState> {
  MultiStateCubit({required this.cardRepo}) : super(MultiStateInitial());

  CardRepo cardRepo;

  getData() async {
    emit(GettingDateInProgress());
    MyResponse myResponse = await cardRepo.getAllCards();

    if (myResponse.error == "") {
      emit(GettingDateInSuccess(cards: myResponse.data));
    } else {
      emit(GettingDateInFailure(error: myResponse.error));
    }
  }
}
