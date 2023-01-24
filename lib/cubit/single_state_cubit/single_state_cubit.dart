import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_with_all_blocks/data/models/my_response/my_response.dart';
import 'package:work_with_all_blocks/data/models/status/data_status.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';

part 'single_state_state.dart';

class SingleStateCubit extends Cubit<CubitSingleState> {
  SingleStateCubit({required this.cardRepo}) : super(CubitSingleState());

  CardRepo cardRepo;

  getData() async {
    emit(CubitSingleState(status: Status.LOADING));

    MyResponse myResponse = await cardRepo.getAllCards();
    if (myResponse.error == '') {
      emit(state.copyWith(card: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.ERROR));
    }
  }
}
