import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/task_state.dart';

class EXCubit extends Cubit<EX> {
  EXCubit() : super(initial());
  int counter = 0;
  String imagePath = 'images/Mine.jpg';
  String message = 'Default';

  changeBackground(String imagePath, String message) {
    this.imagePath = imagePath;
    this.message = message;
    emit(Background(ImagePath: imagePath, message: message));
  }

  plus() {
    counter = counter + 1;
    emit(Counter(counter: counter));
  }

  reset() {
    counter = 0;
    emit(Counter(counter: counter));
  }
}
