import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_all_blocks/app/app.dart';
import 'package:work_with_all_blocks/app/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp( const App());
}
