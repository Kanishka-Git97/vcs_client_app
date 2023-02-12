import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Provider/user_provider.dart';
import 'package:vcs_client_app/Screens/Auth/onboard_screen.dart';
import 'package:vcs_client_app/Screens/Home/home_screen.dart';
import 'package:vcs_client_app/Screens/Main/main_panel.dart';
import 'package:vcs_client_app/Screens/Register/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Provider/doctor_provider.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<DoctorProvider>().setDoctors();
    // Text Editing Controller
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    // Handle Login
    _handleLogin() async {
      if (_usernameController.text.isNotEmpty ||
          _passwordController.text.isNotEmpty) {
        Provider.of<UserProvider>(context, listen: false)
            .login(_usernameController.text, _passwordController.text, context);
      } else {
        Fluttertoast.showToast(
            msg: "Required Details Are Missing",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logoicon.png'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Veterinary Consultation Solution',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomTextField(
                hintTxt: 'example@email.com',
                lableTxt: 'Email',
                mode: false,
                controller: _usernameController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintTxt: '',
                lableTxt: 'Password',
                mode: true,
                controller: _passwordController,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: TextButton(
                    onPressed: _handleLogin,
                    style: TextButton.styleFrom(
                        shadowColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Dont have an account?',
                        style: TextStyle(color: Colors.grey[600]),
                        children: [
                          TextSpan(
                            text: ' Register Here',
                            style: TextStyle(color: Colors.blueAccent),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: const [
        Center(
          child: Text(
            "Application Developed By Purna Kanishka",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        )
      ],
    );
  }
}
