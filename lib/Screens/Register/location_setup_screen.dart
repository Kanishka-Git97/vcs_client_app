import 'package:flutter/material.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Screens/Home/home_screen.dart';

class LocationSetupScreen extends StatefulWidget {
  const LocationSetupScreen({Key? key}) : super(key: key);

  @override
  State<LocationSetupScreen> createState() => _LocationSetupScreenState();
}

class _LocationSetupScreenState extends State<LocationSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SizedBox(
                      height: 100,
                      child: Image(
                        image: AssetImage('assets/images/location-pin.webp'),
                      ),
                    ),
                    Text(
                      'Setup Your Location',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Set your location to find veterinarian around you.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    height: 50,
                    btnColor: Colors.blue,
                    fontColor: Colors.white,
                    fontSize: 15,
                    btnText: 'Use Current Location',
                    onPress: () {}),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Or',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                    hintTxt: 'Search Location',
                    lableTxt: 'Location',
                    mode: false),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: const Text('Map'),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 239, 239, 239),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    height: 50,
                    btnColor: Colors.green,
                    fontColor: Colors.white,
                    fontSize: 15,
                    btnText: 'Done',
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
