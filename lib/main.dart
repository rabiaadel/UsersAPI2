import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Page.dart';
import 'package:untitled1/Testcubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cubit Task',
        home: Testpage(),
      ),
    );
  }
}
