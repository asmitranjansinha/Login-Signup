import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/screens/login_page.dart';
import 'package:login_signup/screens/sign_up.dart';
import 'package:login_signup/widgets/app_buttons.dart';
import 'package:login_signup/widgets/social_icon.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  static const route = 'intro_page';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                'Hello !',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.robotoSlab().fontFamily),
              ),
              const SizedBox(height: 1.0),
              const Text(
                'How are you doing today?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80.0),
              AppButton(
                  txt: "L O G I N",
                  route: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.route, (route) => false);
                  }),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                  txt: "S I G N U P",
                  route: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SignUp.route, (route) => false);
                  }),
              const SizedBox(height: 30),
              const Text("_________________________",
                  style: TextStyle(color: Colors.white)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SocialButtons(img: "assets/images/google.png"),
                  SizedBox(
                    width: 30,
                  ),
                  SocialButtons(img: "assets/images/facebook.png"),
                  SizedBox(
                    width: 30,
                  ),
                  SocialButtons(img: "assets/images/twitter.png")
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
