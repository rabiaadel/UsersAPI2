import 'package:bloc/bloc.dart';

import '../AuthModel/AuthModel.dart';
import '../Data/AuthData.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthData authData = AuthData();

  register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async {
    emit(AuthLoading());
    AuthModel model = await authData.register(
      name: name,
      email: email,
      phone: phone,
      nationalId: nationalId,
      gender: gender,
      password: password,
    );

    emit(AuthAddSuccess(model));
  }
}
