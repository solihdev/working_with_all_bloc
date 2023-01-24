import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/bloc/multi_card_bloc/card_bloc.dart';
import 'package:work_with_all_blocks/bloc/single_state_bloc/single_state_bloc.dart';
import 'package:work_with_all_blocks/cubit/connectivity/connectivity_cubit.dart';
import 'package:work_with_all_blocks/cubit/multi_state_cubit/multi_state_cubit.dart';
import 'package:work_with_all_blocks/cubit/single_state_cubit/single_state_cubit.dart';
import 'package:work_with_all_blocks/data/api_service/api_service.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';
import 'package:work_with_all_blocks/ui/card_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => ApiService(),
          )
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => SingleStateBloc(
              cardRepo: CardRepo(
                apiService: ApiService(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => MultiCardBloc(
              cardRepo: CardRepo(
                apiService: ApiService(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => SingleStateCubit(
              cardRepo: CardRepo(
                apiService: ApiService(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => MultiStateCubit(
              cardRepo: CardRepo(
                apiService: ApiService(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ConnectivityCubit(),
          ),
        ], child: const MyApp()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Working with All Blocs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CardScreen(),
    );
  }
}
