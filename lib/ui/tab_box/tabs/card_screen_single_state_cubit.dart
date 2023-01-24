import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/cubit/single_state_cubit/single_state_cubit.dart';
import 'package:work_with_all_blocks/data/models/status/data_status.dart';
import 'package:work_with_all_blocks/utils/my_utils.dart';

class CardScreenWithSingleStateCubit extends StatelessWidget {
  const CardScreenWithSingleStateCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Cards Screen with Single State Cubit",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: BlocBuilder<SingleStateCubit, CubitSingleState>(
        builder: (context, state) {
          if (state.status == Status.ERROR) {
            return Center(child: Text(state.error.toString()));
          }
          if (state.status == Status.SUCCESS) {
            return ListView.builder(
              itemCount: state.card!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(hexColor(state.card![index].colors.colorA)),
                            Color(hexColor(state.card![index].colors.colorB)),
                          ])),
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.card![index].bankName,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 18, top: 15),
                        child: Text(
                          hexCardNumber(
                            state.card![index].cardNumber,
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
          if (state.status == Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download_for_offline_outlined),
        onPressed: () {
          context.read<SingleStateCubit>().getData();
        },
      ),
    );
  }
}
