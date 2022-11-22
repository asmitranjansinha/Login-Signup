import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/login_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:login_signup/widgets/app_buttons.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
                  SizedBox(
                    height: 250,
                    child: Lottie.asset(
                        'assets/images/85795-man-and-woman-say-hi.json',
                        fit: BoxFit.contain),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'Hello!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ArcaMajora3-Bold'),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'How are you doing today?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fox&Cat'),
                  ),
                  const SizedBox(height: 120.0),
                  AppButton(
                      txt: "L O G I N",
                      func: () {
                        Get.to(() => const LoginPage());
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  AppButton(
                      txt: "S I G N  U P",
                      func: () {
                        Get.to(() => const SignUp());
                      }),
                ],
              )),
            ),
          ),
        ));
  }
}
