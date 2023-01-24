import 'package:bloc/bloc.dart';
import 'package:work_with_all_blocks/bloc/single_state_bloc/single_state_state.dart';
import 'package:work_with_all_blocks/data/models/my_response/my_response.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';
import '../../data/models/status/data_status.dart';

part 'single_state_event.dart';

class SingleStateBloc extends Bloc<SingleCardEvent, SingleState> {
  SingleStateBloc({required this.cardRepo}) : super(SingleState()) {
    on<SingleCardEvent>(getData);
  }

  final CardRepo cardRepo;

  getData(SingleCardEvent event, emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await cardRepo.getAllCards();
    if (myResponse.error == "") {
      emit(state.copyWith(cards: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.ERROR));
    }
  }
}
