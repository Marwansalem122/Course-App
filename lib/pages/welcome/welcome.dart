import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_signup/common/values/colors.dart';
import 'package:login_and_signup/pages/welcome/bloc/welcome_bloc.dart';

import '../../common/values/constant.dart';
import '../../global.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pagecontroller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 360.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pagecontroller,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          pagecontroller,
                          1,
                          context,
                          "Next",
                          "First See Learning",
                          "Forget about a for of paper all Knowledge\n",
                          "assets/images/reading.png"),
                      _page(
                          pagecontroller,
                          2,
                          context,
                          "Next",
                          "Connect With Everyone",
                          "Always Keep in Touch with your Tutor & Friends. let's get Connected ",
                          "assets/images/boy.png"),
                      _page(
                          pagecontroller,
                          3,
                          context,
                          "Get Started",
                          "Always Fascinated Learning",
                          "Anywhere, anytime. The Time is at your discretion so Study whenever you want",
                          "assets/images/man.png"),
                    ],
                  ),
                  Positioned(
                    bottom: 110.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _page(PageController pageController, int index, BuildContext context,
    String buttonname, String title, String subtitle, String imagepath) {
  return Column(
    children: [
      SizedBox(
        height: 260.w,
        width: 345.w,
        child: Image.asset(
          imagepath,
          fit: BoxFit.cover,
        ),
      ),
      Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal),
      ),
      Container(
        margin: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subtitle,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          } else {
            Global.storageServices
                .setBool(AppConstants.STORAGE_DEVICE_OPEN_TIME, true);
            print(
                "====================the value is ${Global.storageServices.getDeviceFirstOpen()}");
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/signIn', (Route<dynamic> route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1))
              ]),
          child: Center(
            child: Text(
              buttonname,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      )
    ],
  );
}
