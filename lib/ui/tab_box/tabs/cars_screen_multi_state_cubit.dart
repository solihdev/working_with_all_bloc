import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/cubit/multi_state_cubit/multi_state_cubit.dart';
import 'package:work_with_all_blocks/cubit/multi_state_cubit/multi_state_state.dart';
import 'package:work_with_all_blocks/utils/my_utils.dart';

class CardScreenWithMultiStateCubit extends StatelessWidget {
  const CardScreenWithMultiStateCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Cards Screen with Multi State Cubit",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: BlocBuilder<MultiStateCubit, MultiStateState>(
        builder: (context, state) {
          if (state is GettingDateInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GettingDateInFailure) {
            return const Center(child: Text("Error!"));
          }
          if (state is GettingDateInSuccess) {
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
                          hexCardNumber(
                            state.cards[index].cardNumber,
                          ),
                          style: const TextStyle(
                              fontSize: 14,
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download_for_offline_outlined),
        onPressed: () {
          context.read<MultiStateCubit>().getData();
        },
      ),
    );
  }
}
