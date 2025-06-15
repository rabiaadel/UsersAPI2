import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Testcubit.dart';
import 'package:untitled1/states.dart';

class Testpage extends StatelessWidget {
  const Testpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, states>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Cubit Task',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          backgroundColor: Colors.blue[50],
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                state.text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Container(color: state.color, height: 100, width: 100),
              Text(
                state.count.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              ElevatedButton(
                onPressed: context.read<TestCubit>().ButtonFunction,
                child: Text('Press'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
