import '../AuthModel/AuthModel.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthAddSuccess extends AuthState {
  final AuthModel model;

  AuthAddSuccess(this.model);
}

final class AuthLoading extends AuthState {}
