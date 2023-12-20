import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_signup/common/values/colors.dart';
import 'package:login_and_signup/pages/common_widgets.dart';
import 'package:login_and_signup/pages/register/bloc/register_bloc.dart';
import 'package:login_and_signup/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        width: double.infinity,
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: buildAppBar("Sign Up", context),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: resuableText(
                          "Enter your details below & free sigin up", 14.sp)),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        resuableText("User name", 14.sp),
                        SizedBox(
                          height: 2.h,
                        ),
                        buildtextformfield(
                            "signup",
                            "User name",
                            "Enter your user name",
                            Icons.person,
                            "user", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserNameEvent(value));
                        }),
                        resuableText("Email", 14.sp),
                        SizedBox(
                          height: 2.h,
                        ),
                        buildtextformfield("signup", "Email",
                            "Enter your email", Icons.email, "user", (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                        resuableText("Password", 14.sp),
                        SizedBox(
                          height: 2.h,
                        ),
                        buildtextformfield(
                            "signup",
                            "password",
                            "Enter your password",
                            Icons.lock,
                            "password", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordEvent(value));
                        }),
                        resuableText("Confirm Password", 14.sp),
                        SizedBox(
                          height: 2.h,
                        ),
                        buildtextformfield(
                            "signup",
                            "repassword",
                            "Re-Enter your Password",
                            Icons.lock,
                            "password", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(RePasswordEvent(value));
                        }),
                      ],
                    ),
                  ),
                  Container(
                    //  color: Colors.amber,
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment,
                      mainAxisAlignment: MainAxisAlignment
                          .start, // Align children at the start (left)
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          // side: MaterialStateBorderSide.resolveWith(
                          //       (states) => BorderSide(width: width*0.002, color: Colors.white),
                          // ),
                          //checkColor: Colors.white,
                          value: check,
                          onChanged: (value) {
                            setState(() {
                              check = value!;
                            });
                          },
                          checkColor: AppColors.primaryBackground,
                          activeColor: AppColors.primaryElement,
                          // materialTapTargetSize: MaterialTapTargetSize
                          //     .shrinkWrap, // Reduces extra padding
                          // visualDensity:
                          //     VisualDensity(horizontal: -4, vertical: -4),
                        ),
                        resuableText(
                            "By creating an account you have to agree\n with our  &    ",
                            10.sp),
                      ],
                    ),
                  ),
                  loginAndSignupbutton("Sign Up", (AppColors.primaryElement),
                      AppColors.primaryElementText, "signup", () {
                    RegisterController(context: context).handelEmailRegister();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
