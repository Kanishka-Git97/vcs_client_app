import 'package:flutter/material.dart';
import 'package:vcs_client_app/Components/custom_button.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({Key? key}) : super(key: key);

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  bool _isSinhalaChecked = true;
  bool _isEnglishChecked = false;
  bool _isTamilChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/sampleuser.webp'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hi, Sample Name',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Please Select your preferred language to facilitate communication.',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/Conversation-512.webp'),
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: _isSinhalaChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isSinhalaChecked = value!;
                              });
                            }),
                        Text('සිංහල'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _isEnglishChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isEnglishChecked = value!;
                              });
                            }),
                        Text('English'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _isTamilChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isTamilChecked = value!;
                              });
                            }),
                        Text('Tamil'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              CustomButton(
                  height: 50,
                  btnColor: Colors.blue,
                  fontColor: Colors.white,
                  fontSize: 15,
                  btnText: 'Next',
                  onPress: () {})
            ],
          ),
        ),
      )),
    );
  }
}
