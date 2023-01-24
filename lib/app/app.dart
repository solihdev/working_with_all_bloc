import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/data/api_service/api_service.dart';
import 'package:work_with_all_blocks/data/repositories/card_repository.dart';
import 'package:work_with_all_blocks/ui/card_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => CardRepo(apiService: ApiService()),
        child: const MyApp());
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
