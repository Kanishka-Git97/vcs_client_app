import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Screens/Auth/onboard_screen.dart';
import 'package:vcs_client_app/Screens/Register/register_screen.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
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
              const CustomTextField(
                  hintTxt: 'example@email.com', lableTxt: 'Email', mode: false),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                hintTxt: '',
                lableTxt: 'Password',
                mode: true,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
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
