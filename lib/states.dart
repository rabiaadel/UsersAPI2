import 'package:flutter/material.dart';

class states {
  final String text;
  final int count;
  final Color color;

  states({required this.text, required this.count, required this.color});

  @override
  String toString() {
    return 'states(text: $text, count: $count, color: $color)';
  }
}
