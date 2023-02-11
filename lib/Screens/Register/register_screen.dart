import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Screens/Auth/login_screen.dart';
import 'package:vcs_client_app/Screens/Register/account_setup_screen.dart';
import 'package:vcs_client_app/Screens/Register/location_setup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcs_client_app/Utils/image_utility.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isConfirmChecked = true;
  String imgString = sampleUser;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _mobileController = TextEditingController();

    // Handle Image Picker
    _imagePicker() async {
      String output;
      ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {
        output = ImageUtility.base64String(await img!.readAsBytes());

        setState(() {
          imgString = output;
        });
      });
    }

    // Handle Form Submission
    handleFormSubmit() {
      // validate the form details
      if (_firstNameController.text.isNotEmpty ||
          _lastNameController.text.isNotEmpty ||
          _mobileController.text.isNotEmpty ||
          _emailController.text.isNotEmpty ||
          _passwordController.text.isNotEmpty ||
          _confirmPasswordController.text.isNotEmpty) {
        // validate mobile Number
        if (_mobileController.text.length != 10) {
          // Show error message
          Fluttertoast.showToast(msg: "Invalid mobile number");
        }
        // validate Password
        if (_passwordController.text != _confirmPasswordController.text) {
          // SHow Erro Message
          print(_passwordController.text);
          Fluttertoast.showToast(
              msg: "Password Did not match",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.orangeAccent,
              textColor: Colors.white,
              fontSize: 16.0);
          return print("Password Did not match");
        }
        if (_passwordController.text.length > 6) {
          Fluttertoast.showToast(
              msg: "Please Enter Strong Password",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.orangeAccent,
              textColor: Colors.white,
              fontSize: 16.0);
          return print("Please Enter Strong Password");
        }
        // define User Model
        Customer _user = Customer(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            mobile: _mobileController.text,
            password: _passwordController.text,
            img: imgString);
        // redirect to the location page
        print(_user.toJson());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LocationSetupScreen(
                      user: _user,
                    )));
      } else {
        // Show Error Message
        Fluttertoast.showToast(
            msg: "Required Details Are Missing",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // return print("Required Details Are Missing");
      }
    }

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
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(5),
                                child: Image.memory(
                                  Base64Decoder().convert(imgString),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: _imagePicker,
                                child: Icon(
                                  Icons.add_circle_rounded,
                                  color: Colors.teal,
                                  size: 28.0,
                                ),
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
                  CustomTextField(
                    hintTxt: 'First Name',
                    lableTxt: 'First Name',
                    mode: false,
                    controller: _firstNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintTxt: 'Last Name',
                    lableTxt: 'Last Name',
                    mode: false,
                    controller: _lastNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintTxt: 'Mobile Number',
                    lableTxt: 'Mobile Number',
                    mode: false,
                    controller: _mobileController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintTxt: 'example@email.com',
                    lableTxt: 'Email',
                    mode: false,
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintTxt: 'Enter Strong Password',
                    lableTxt: 'Password',
                    mode: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintTxt: 'Confirm your Password',
                    lableTxt: 'Confirm Password',
                    mode: true,
                    controller: _confirmPasswordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //         value: _isConfirmChecked,
                  //         onChanged: (bool? value) {
                  //           setState(() {
                  //             _isConfirmChecked = value!;
                  //           });
                  //         }),
                  //     const Text(
                  //       'Agree to the Terms and Privacy Policy',
                  //       style: TextStyle(fontSize: 12),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      height: 50,
                      btnColor: Colors.green,
                      fontColor: Colors.white,
                      fontSize: 15,
                      btnText: 'Next',
                      onPress: handleFormSubmit),
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
                          text: ' Login Here',
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
                  const SizedBox(
                    height: 10,
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
