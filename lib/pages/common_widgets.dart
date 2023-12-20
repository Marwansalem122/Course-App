import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_signup/common/values/colors.dart';

AppBar buildAppBar(String text, BuildContext context) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(5.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 2.0,
        )),
    leading: text == "Log In"
        ? Container()
        : IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
    title: Text(
      text,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _socialIcons("google", "googlebutton"),
      _socialIcons("apple", "applebutton"),
      _socialIcons("facebook", "facebookbutton"),
    ]),
  );
}

Widget _socialIcons(
  String iconName,
  String herotage,
) {
  return SizedBox(
    width: 45.w,
    height: 45.h,
    child: FloatingActionButton(
      heroTag: herotage,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: () {},
      elevation: 0,
      child: CircleAvatar(
        radius: 1000,
        backgroundImage: AssetImage("assets/icons/$iconName.png"),
        backgroundColor: Colors.white,
      ),
    ),
  );
}

Widget resuableText(String text, double fontsize) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: AppColors.primarySecondaryElementText,
          fontWeight: FontWeight.normal,
          fontSize: fontsize),
    ),
  );
}

Widget buildtextformfield(String fieldtype, String text, String hinttext,
    IconData iconName, String texttype, void Function(String value)? fun) {
  return Container(
    margin: EdgeInsets.only(bottom: fieldtype == "signup" ? 10.h : 20.h),
    width: 325.w,
    child: TextFormField(
      onChanged: (value) => fun!(value),
      obscureText: texttype == "password" ? true : false,
      autocorrect: false,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(17.0),
        hintText: hinttext,
        hintStyle: const TextStyle(color: AppColors.primaryThreeElementText),
        prefixIcon: Icon(iconName),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.primaryThreeElementText),
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.primaryThreeElementText),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}

Widget forgetPassword() {
  return Container(
      width: 120.w,
      height: 20.h,
      child: InkWell(
        onTap: () {},
        splashColor: AppColors.primaryBackground,
        child: Text(
          "Forget Password?",
          style: TextStyle(
              color: Colors.black54,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryElement,
              fontSize: 14.sp),
        ),
      ));
}

Widget loginAndSignupbutton(String nameButton, Color color, Color textcolor,
    String buttontype, void Function()? fun) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: buttontype == "login"
                ? Colors.transparent
                : AppColors.primaryFourElementText,
          )),
      margin: EdgeInsets.only(
          top: buttontype == "login" ? 50.h : 20.h,
          left: buttontype == "signup" ? 10.w : 0),
      width: 325.w,
      height: 50.h,
      child: TextButton(
        onPressed: fun,
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          nameButton,
          style: TextStyle(color: textcolor, fontSize: 16.sp),
        ),
      ));
}
