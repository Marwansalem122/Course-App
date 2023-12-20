import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_signup/common/values/constant.dart';
import 'package:login_and_signup/common/widgets/flutter_toast.dart';
import 'package:login_and_signup/global.dart';
import 'package:login_and_signup/pages/signin/bloc/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  void handleSignin(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SiginBloc>(context)
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to Fill Email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to Fill Password");
          return;
        }
        try {
          final UserCredential credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to Verified email account");
            return;
          }
          // else {
          //   // ignore: use_build_context_synchronously
          //   Navigator.of(context)
          //       .pushNamedAndRemoveUntil("/application", (route) => false);
          // }
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }

          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            // toastInfo(msg: "You are user in this app");
            Global.storageServices
                .setString(AppConstants.STORAGE_USEE_TOKEN_KEY, "123456789");
            // ignore: use_build_context_synchronously
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/applicationpage", (route) => false);
            return;
          } else {
            //we have error from firebaseflutterfire configure --project=ulearning-app-e33f1
            toastInfo(msg: "Currently you are not user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          print("Firebase Authentication Error: ${e.code}");
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email.");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user.");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email address formate is Wrong");
            return;
          } else if (e.code == "invalid-credential") {
            toastInfo(msg: "Wrong on your email or password");
          }
        }
      }
    } catch (e) {
      //
    }
  }
}
