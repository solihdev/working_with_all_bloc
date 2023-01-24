import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/bloc/multi_card_bloc/card_bloc.dart';
import 'package:work_with_all_blocks/bloc/multi_card_bloc/card_event.dart';
import 'package:work_with_all_blocks/bloc/multi_card_bloc/card_state.dart';
import 'package:work_with_all_blocks/data/api_service/api_service.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  hexColor(String colorHexCode) {
    String colorNew = '0xff$colorHexCode';
    colorNew = colorNew.replaceAll("#", "");
    int colorInt = int.parse(colorNew);
    return colorInt;
  }

  hexCardNumber(String colorHexCode) {
    String colorNew = colorHexCode;
    colorNew = colorNew.replaceAll(" ", "  ");
    return colorNew;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MultiCardBloc(cardRepo: CardRepo(apiService: ApiService()))..add(FetchAllCards()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Cards Screen with MultiBloc",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
          ),
        ),
        body: BlocBuilder<MultiCardBloc, MultiCardsState>(
          builder: (context, state) {
            if (state is InitialCardsState) {
              return const Center(
                child: Text("Hali data yo"),
              );
            } else if (state is LoadCardsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCardsInSuccess) {
              return ListView.builder(
                itemCount: state.cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(hexColor(state.cards[index].colors.colorA)),
                              Color(hexColor(state.cards[index].colors.colorB)),
                            ])),
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.cards[index].bankName,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 18, top: 15),
                          child: Text(
                            hexCardNumber(state.cards[index].cardNumber,),
                            style: const TextStyle( fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
