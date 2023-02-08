import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcs_client_app/Screens/Auth/login_screen.dart';

import 'package:vcs_client_app/Screens/Auth/onboard_screen.dart';
import 'package:vcs_client_app/Screens/Pet/pet_registration_screen.dart';
import 'package:vcs_client_app/Screens/Register/account_setup_screen.dart';
import 'package:vcs_client_app/Screens/Register/location_setup_screen.dart';
import 'package:vcs_client_app/Screens/Register/register_screen.dart';
import 'package:vcs_client_app/Screens/User/appointment_screen.dart';
import 'package:vcs_client_app/Screens/User/doctor_screen.dart';
import 'package:vcs_client_app/Screens/Home/home_screen.dart';
import 'package:vcs_client_app/Screens/User/payment_screen.dart';

int? isViewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
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
        screenFunction: () async {
          //return isViewed != 0 ? OnBoard() : loginScreen();
          return RegisterScreen();
          //return loginScreen();
          // return DoctorScreen();
          //return AppointmentScreen();
          //return PaymentScreen();
        },
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromARGB(255, 233, 230, 230),
      ),
    );
  }
}
