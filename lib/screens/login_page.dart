// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/screens/intro_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:login_signup/widgets/app_buttons.dart';
import 'package:login_signup/widgets/input_field.dart';
import 'package:login_signup/widgets/reset_password.dart';
import 'package:login_signup/widgets/snack_bar.dart';
import 'package:lottie/lottie.dart';

import '../widgets/social_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
  }

  Future logIn() async {
    try {
      setState(() {
        _controller.forward();
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      log("message");
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message, Colors.black38);
      setState(() {
        _controller.stop();
      });
    }
  }

  Future loginGoogle() async {
    try {
      setState(() {
        _controller.forward();
      });
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      print(FirebaseAuth.instance.signInWithCredential(credential));
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      setState(() {
        _controller.stop();
      });
      log(e.message.toString());
      rethrow;
    }
  }

  Future loginFB() async {
    try {
      setState(() {
        _controller.forward();
      });
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      print(FirebaseAuth.instance.signInWithCredential(facebookAuthCredential));
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      setState(() {
        _controller.stop();
      });
      log(e.message.toString());
      rethrow;
    } on Exception catch (e) {
      setState(() {
        _controller.stop();
      });
      log(e.toString());
      rethrow;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF6A359C),
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
                          Get.offAll(const IntroPage());
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white60,
                        ),
                      ),
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ArcaMajora3-Bold'),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 200,
                      child: Lottie.asset(
                          "assets/images/113519-cyber-security.json",
                          controller: _controller)),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      InputField(
                        icon: Icons.mail_lock_outlined,
                        hintxt: 'Mail',
                        obscureText: false,
                        fieldcontroller: _emailController,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        icon: Icons.lock_open_outlined,
                        hintxt: "Password",
                        obscureText: true,
                        fieldcontroller: _passwordController,
                        type: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 22),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: GestureDetector(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ResetPassword();
                                });
                          },
                          child: Container(
                            height: 20,
                            width: 125,
                            decoration: BoxDecoration(
                                color: Colors.purple[300],
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: Text(
                                "forgot password ?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Fox&Cat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      AppButton(txt: "L O G I N", func: logIn),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Container(
                    height: 20,
                    width: 172,
                    decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "first time here ?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fox&Cat',
                              color: Colors.white70),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(const SignUp());
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Fox&Cat'),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text("----------  OR  ----------",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'koliko')),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButtons(
                        img: "assets/images/google.png",
                        ontap: loginGoogle,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      SocialButtons(
                        img: "assets/images/facebook.png",
                        ontap: loginFB,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const SocialButtons(
                        img: "assets/images/twitter.png",
                        ontap: null,
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
