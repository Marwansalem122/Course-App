import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_signup/counterapp/bloc/counter_bloc.dart';
import 'package:login_and_signup/pages/register/bloc/register_bloc.dart';
import 'package:login_and_signup/pages/signin/bloc/bloc/signin_bloc.dart';
import 'package:login_and_signup/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allblocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SigninBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => RegisterBloc(),
        ),
      ];
}
