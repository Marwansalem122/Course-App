import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_signup/common/values/colors.dart';
// ignore: depend_on_referenced_packages
import 'common/routes/routes.dart';
import '../../global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allblocproviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              //will make backgroundcolor for action in navigationbar ...etc not grey
              splashColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: Colors.white)),
      //    home: const Welcome(), //const Welcome(),

          onGenerateRoute: AppPages.generateRouteSettings,
        //  initialRoute: AppRoutes.INITIAL,
        ),
      ),
    );
  }
}
