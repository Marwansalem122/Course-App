import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_signup/pages/application/application_page.dart';
import 'package:login_and_signup/pages/application/bloc/application_bloc.dart';
import 'package:login_and_signup/pages/register/bloc/register_bloc.dart';
import 'package:login_and_signup/pages/register/register.dart';
import 'package:login_and_signup/pages/signin/bloc/bloc/signin_bloc.dart';
import 'package:login_and_signup/pages/signin/signin.dart';
import 'package:login_and_signup/pages/welcome/welcome.dart';

import '../../pages/welcome/bloc/welcome_bloc.dart';
import 'names.dart';
import '../../global.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGNIN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SigninBloc())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => ApplicationBloc())),
    ];
  }

  //return all BlocProviders
  static List<dynamic> allblocproviders(BuildContext context) {
    List<BlocProvider> blocproviders = [];
    for (var bloc in routes()) {
      blocproviders.add(bloc.bloc);
    }
    return blocproviders;
  }
  //a model that cover entire screen as we click an Navigator object

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        //  print("first log");
        //print(result.first.route);
        bool devicefirstopen = Global.storageServices.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && devicefirstopen) {
          bool isloggedin = Global.storageServices.getIsLoggedIn();
          if (isloggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          //   print("second log");
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        //onboarding screen
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    // print("valid route : ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify blocproviders and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}
