import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/card_event.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/card_bloc.dart';
import 'package:work_with_all_blocks/bloc/card_bloc/card_state.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardBloc(
          cardRepo: context.read<CardRepo>()
      )..add(FetchAllCards()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Cards Screen",
            style: TextStyle(color: Colors.black),
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
              return Expanded(
                child: ListView.builder(
                  itemCount: state.cards.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black54,
                      ),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(state.cards[index].bankName,style: TextStyle(fontSize: 30,color: Colors.white),),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                color: Colors.white,
                                child: Image.network(state.cards[index].iconImage),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}