// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(const SigninState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    emit(state.cpyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    emit(state.cpyWith(password: event.password));
  }
}
