import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Screens/Auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isConfirmChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 50,
                      child:
                          Image(image: AssetImage('assets/images/image.png')),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'For Veterinary Consultation Solution',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Center(
                        child: Stack(
                          children: const [
                            SizedBox(
                              height: 75,
                              width: 75,
                              child: CircleAvatar(
                                radius: 80.0,
                                backgroundImage:
                                    AssetImage('assets/images/sampleuser.webp'),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Icon(
                                Icons.add_circle_rounded,
                                color: Colors.teal,
                                size: 28.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text('Sign up to join Community'),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextField(
                      hintTxt: 'Full Name', lableTxt: 'Name', mode: false),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextField(
                      hintTxt: 'example@email.com',
                      lableTxt: 'Email',
                      mode: false),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextField(
                      hintTxt: 'Enter Strong Password',
                      lableTxt: 'Password',
                      mode: true),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextField(
                      hintTxt: 'Confirm your Password',
                      lableTxt: 'Confirm Password',
                      mode: true),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _isConfirmChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isConfirmChecked = value!;
                            });
                          }),
                      const Text(
                        'Agree to the Terms and Privacy Policy',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      height: 50,
                      btnColor: Colors.green,
                      fontColor: Colors.white,
                      fontSize: 15,
                      btnText: 'Sign Up',
                      onPress: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Have an account?',
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
                                      builder: (context) => loginScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
