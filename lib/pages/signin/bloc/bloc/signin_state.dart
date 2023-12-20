part of 'signin_bloc.dart';

class SigninState {
  final String email;
  final String password;
  const SigninState({this.email = "", this.password = ""});
  SigninState cpyWith({String? email, String? password}) {
    return SigninState(
        email: email ?? this.email, password: password ?? this.password);
  }
}

// final class SigninInitial extends SigninState {}
