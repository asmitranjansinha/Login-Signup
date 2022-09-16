import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/utils/routes.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            const SizedBox(
              height: 80.0,
            ),
            Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_khtt8ejx.json',
                fit: BoxFit.contain),
            const SizedBox(
              height: 90.0,
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
            const SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 13),
                  shape: const StadiumBorder()),
              child: Text(
                'L O G I N',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontFamily: GoogleFonts.robotoSlab().fontFamily),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signupRoute, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 13),
                  shape: const StadiumBorder()),
              child: Text(
                'S I G N U P',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontFamily: GoogleFonts.robotoSlab().fontFamily),
              ),
            )
          ],
        ),
      ),
    );
  }
}
