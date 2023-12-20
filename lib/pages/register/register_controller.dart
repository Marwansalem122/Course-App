import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_signup/pages/register/bloc/register_bloc.dart';

import '../../common/widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  void handelEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.userName;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;
    if (username.isEmpty) {
      toastInfo(msg: "Username can't be Empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "You need to Fill Email address");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "You need to Fill Password");
      return;
    }
    if (repassword.isEmpty) {
      toastInfo(msg: "Your Password confirmation is Wrong");
      return;
    }
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            msg:
                "An email has been sent to your registered email to active Check your email box and click on the link");
        // ignore: use_build_context_synchronously
        // Navigator.of(context).pop();

        // Wait for the user to verify the email
        await credential.user!.reload();
        if (credential.user!.emailVerified) {
          // Navigate to the HomeScreen after successful verification
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamedAndRemoveUntil(
              "/applicationpage",//applicationpage
              (route) =>
                  false); // Replace HomeScreen with your actual home screen widget
        } else {
          toastInfo(msg: "Please verify your email before accessing the app.");
        }

        return;
      } else {
        toastInfo(msg: "Currently you are not user of this app");
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email address formate is Wrong");
        return;
      }
    }
  }
}
