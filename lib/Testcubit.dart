import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/states.dart';

class TestCubit extends Cubit<states> {
  var newText;

  TestCubit()
    : super(states(text: 'This is my app', count: 1, color: Colors.black));

  ButtonFunction() {
    final newCount = state.count + 1;
    final newText = state.text == 'This is my app'
        ? 'This is my app $newCount'
        : 'This is my app';
    final newColor = state.color == Colors.black ? Colors.red : Colors.black;
    emit(states(text: newText, count: newCount, color: newColor));
  }
}
