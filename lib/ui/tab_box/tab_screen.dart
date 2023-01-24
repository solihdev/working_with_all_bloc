import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/cubit/connectivity/connectivity_cubit.dart';
import 'package:work_with_all_blocks/ui/card_screen.dart';
import 'package:work_with_all_blocks/ui/no_internet/no_internet_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  _init(){
    print("INTERNET TURNED ON CALL ANY API");
  }
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    List pages=[
      const CardScreen(),
      Container(),
      Container(),
      Container(),
    ];
    return BlocListener<ConnectivityCubit,ConnectivityState>(listener: (context,state){
      if(state.connectivityResult==ConnectivityResult.none){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NoInternetPage(voidCallback: _init)));
      }
    },child: Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          currentPage=value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.block),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.block),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin),label: ""),
        ],
      ),
    ),);
  }
}
