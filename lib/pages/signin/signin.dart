import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_signup/common/values/colors.dart';
import 'package:login_and_signup/pages/common_widgets.dart';
import 'package:login_and_signup/pages/signin/bloc/bloc/signin_bloc.dart';
import 'package:login_and_signup/pages/signin/signin_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
      return Container(
        width: double.infinity,
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: buildAppBar("Log In", context),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: resuableText(
                          "Or use your email account to login", 14.sp)),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        resuableText("Email", 14.sp),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildtextformfield("login", "Email", "Enter your email",
                            Icons.email, "user", (value) {
                          context.read<SigninBloc>().add(EmailEvent(value));
                        }),
                        resuableText("Password", 14.sp),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildtextformfield(
                            "login",
                            "Email",
                            "Enter your password",
                            Icons.lock,
                            "password", (value) {
                          context.read<SigninBloc>().add(PasswordEvent(value));
                        }),
                        forgetPassword(),
                        loginAndSignupbutton(
                            "log In",
                            (AppColors.primaryElement),
                            AppColors.primaryElementText,
                            "login", () {
                          SignInController(context: context)
                              .handleSignin("email");
                        }),
                        loginAndSignupbutton(
                            "Sign Up",
                            Colors.white,
                            AppColors.primarySecondaryElementText,
                            "signup", () {
                          Navigator.of(context).pushNamed('/register');
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
