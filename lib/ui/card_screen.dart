import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/card_event.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/card_bloc.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/card_state.dart';
import 'package:work_with_all_blocks/data/models/card_model/card_model.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  hexColor(String colorHexCode) {
    String colorNew = '0xff$colorHexCode';
    colorNew = colorNew.replaceAll("#", "");
    int colorint = int.parse(colorNew);
    return colorint;
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
          CardBloc(cardRepo: context.read<CardRepo>())..add(FetchAllCards()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cards Screen",
          ),
        ),
        body: BlocBuilder<CardBloc, CardsState>(
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
