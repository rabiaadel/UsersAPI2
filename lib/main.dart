import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Test.dart';
import 'features/Auth/Cubit/auth_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (context) => AuthCubit(), child: TestScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}
