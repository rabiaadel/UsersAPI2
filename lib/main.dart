import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/splashScreen.dart';
import 'package:untitled1/task_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EXCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cubit Task',
        home: Splashscreen(),
      ),
    );
  }
}
