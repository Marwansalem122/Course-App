import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_signup/common/values/colors.dart';
import 'package:login_and_signup/pages/application/bloc/application_bloc.dart';

import 'apllication_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          body: buildpage(state.index),
          bottomNavigationBar: Container(
            width: 366.w,
            height: 65.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.h),
                  topLeft: Radius.circular(20.h)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.primaryFourElementText.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              // border: Border(top: BorderSide(color: Colors.grey))
            ),
            child: BottomNavigationBar(
                // backgroundColor: AppColors.primaryBackground,
                currentIndex: state.index,
                onTap: (value) {
                  context
                      .read<ApplicationBloc>()
                      .add(TrigerApplicationEvent(value));
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: bottomtabs),
          ),
        )),
      );
    });
  }
}
