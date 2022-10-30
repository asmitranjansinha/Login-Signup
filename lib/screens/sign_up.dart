// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/helper/helper_function.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/widgets/snack_bar.dart';
import 'package:lottie/lottie.dart';
import '../auth-database/auth_services.dart';
import '../widgets/app_buttons.dart';
import '../widgets/input_field.dart';
import 'intro_page.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const route = 'signup_page';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future signUp() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          await HelperFunction.saveUserLoggedInStatus(true);
          await HelperFunction.saveUserEmailSF(email);
          await HelperFunction.saveUserNameSF(fullName);
          log("signed in");
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.route, (route) => false);
        } else {
          showSnackBar(context, value, Colors.black45);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  String fullName = "";
  String email = "";
  String password = "";
  bool _isLoading = false;
  AuthService authService = AuthService();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Colors.purple,
            ))
          : Scaffold(
              backgroundColor: Colors.purple[200],
              body: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xFF552586),
                          Color(0xFF6A359C),
                          Color(0xFF804FB3),
                          Color(0xFF9969C7),
                        ])),
                    child: SafeArea(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, IntroPage.route, (route) => false);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white60,
                              ),
                            ),
                            Text(
                              'Sign Up Now !',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.montserratAlternates()
                                      .fontFamily),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                            height: 80,
                            child: Lottie.asset(
                                "assets/images/9308-welcome-screen-animation.json")),
                        const SizedBox(
                          height: 50,
                        ),
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                InputField(
                                  icon: Icons.perm_identity,
                                  hintxt: 'Name',
                                  obscureText: false,
                                  saveinput: fullName,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputField(
                                  icon: Icons.mail_lock_outlined,
                                  hintxt: 'Mail',
                                  obscureText: false,
                                  saveinput: email,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputField(
                                  icon: Icons.lock_open_outlined,
                                  hintxt: "Password",
                                  obscureText: true,
                                  saveinput: password,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputField(
                                    icon: Icons.lock,
                                    hintxt: "Confirm Password",
                                    obscureText: true),
                                const SizedBox(height: 40),
                                AppButton(
                                    txt: "S I G N  U P",
                                    route: () {
                                      signUp();
                                    }),
                              ],
                            )),
                        const SizedBox(height: 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "not the first time here ?",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, LoginPage.route, (route) => false);
                              },
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.lato().fontFamily),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                  )),
            ),
    );
  }
}
