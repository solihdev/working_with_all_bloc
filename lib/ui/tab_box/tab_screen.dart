import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/cubit/connectivity/connectivity_cubit.dart';
import 'package:work_with_all_blocks/ui/tab_box/tabs/card_screen_multi_state_bloc.dart';
import 'package:work_with_all_blocks/ui/no_internet/no_internet_screen.dart';
import 'package:work_with_all_blocks/ui/tab_box/tabs/card_screen_single_state_cubit.dart';
import 'package:work_with_all_blocks/ui/tab_box/tabs/card_screen_with_single_bloc.dart';

import 'tabs/cars_screen_multi_state_cubit.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  _init() {
    print("INTERNET TURNED ON CALL ANY API");
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = const [
      CardScreenWithMultiBloc(),
      CardScreenWithSingleStateBloc(),
      CardScreenWithMultiStateCubit(),
      CardScreenWithSingleStateCubit(),
    ];
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoInternetScreen(voidCallback: _init)));
        }
      },
      child: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            currentPage = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_alert_rounded), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: ""),
          ],
        ),
      ),
    );
  }
}
