import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/home_page.dart';
import 'package:login_signup/screens/intro_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:login_signup/widgets/app_buttons.dart';
import 'package:login_signup/widgets/input_field.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const route = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        'LOGIN !',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                GoogleFonts.montserratAlternates().fontFamily),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                      height: 200,
                      child: Lottie.asset(
                          "assets/images/113519-cyber-security.json")),
                  const SizedBox(
                    height: 40,
                  ),
                  const InputField(
                    icon: Icons.mail_lock_outlined,
                    hintxt: 'Mail',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputField(
                    icon: Icons.lock_open_outlined,
                    hintxt: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 22),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "forgot password ?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.lato().fontFamily),
                    ),
                  ),
                  const SizedBox(height: 22),
                  AppButton(
                      txt: "L O G I N",
                      route: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.route, (route) => false);
                      }),
                  const SizedBox(height: 130),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "first time here ?",
                        style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, SignUp.route, (route) => false);
                        },
                        child: Text(
                          "Sign Up",
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
