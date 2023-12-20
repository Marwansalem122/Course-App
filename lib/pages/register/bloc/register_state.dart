part of 'register_bloc.dart';

class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String repassword;
  const RegisterState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.repassword = "",
  });

  RegisterState cpyWith(
      {String? userName, String? email, String? password, String? repassword}) {
    return RegisterState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        repassword: password ?? this.repassword);
  }
}
