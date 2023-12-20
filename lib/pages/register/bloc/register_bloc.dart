import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }
  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    print("Username: ${event.userName}");
    emit(state.cpyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
   // print("Email: ${event.email}");
    emit(state.cpyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
  //  print("Password: ${event.password}");
    emit(state.cpyWith(password: event.password));
  }

  void _repasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    //print("Repassword: ${event.repassword}");
    emit(state.cpyWith(repassword: event.repassword));
  }
}
