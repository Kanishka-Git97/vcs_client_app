import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcs_client_app/Screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      title: 'Flutter Demo',
      home: AnimatedSplashScreen.withScreenFunction(
        splash: 'assets/images/image.png',
        splashIconSize: 500,
        screenFunction: () async {
          return loginScreen();
        },
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromARGB(255, 233, 230, 230),
      ),
    );
  }
}
