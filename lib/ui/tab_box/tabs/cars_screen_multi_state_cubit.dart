import 'package:flutter/material.dart';

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
    );
  }
}
