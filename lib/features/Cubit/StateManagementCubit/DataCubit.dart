import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/DioData/Data.dart';
import 'DataStates.dart';

class UserCubit extends Cubit<UserState> {
  final UserData userData;

  UserCubit(this.userData) : super(UserInitial());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoading());
      final users = await userData.getAllUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
