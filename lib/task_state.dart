sealed class EX {}

class initial extends EX {}

class Background extends EX {
  final String ImagePath;
  final String message;

  Background({required this.ImagePath, required this.message});
}

class Counter extends EX {
  final int counter;

  Counter({required this.counter});
}
