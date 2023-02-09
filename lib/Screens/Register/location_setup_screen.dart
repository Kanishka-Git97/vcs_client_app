import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Controllers/user_controller.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Models/lat_long.dart';
import 'package:vcs_client_app/Screens/Home/home_screen.dart';

import '../../Components/map_box.dart';
import '../../Repositories/user_repository.dart';

class LocationSetupScreen extends StatefulWidget {
  const LocationSetupScreen({Key? key, required this.user}) : super(key: key);

  final Customer user;

  @override
  State<LocationSetupScreen> createState() => _LocationSetupScreenState();
}

class _LocationSetupScreenState extends State<LocationSetupScreen> {
  // Dependencies
  var _userController = UserController(UserRepository());

  // Controllers
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  // states
  var map = null;

  // Handling Map
  _mapHandler() {
    print("Run MapHandler");
    if (_latitudeController.text.isNotEmpty ||
        _longitudeController.text.isNotEmpty) {
      print("Have Locations");
      // Handler with latitude and longitude
      List<LatLong> locations = [];
      var location = LatLong(
          latitude: double.parse(_latitudeController.text),
          longitude: double.parse(_longitudeController.text));
      locations.add(location);

      return MapBox(
        locations: [location],
      );
    } else {
      // handler with out latitude and longitude
      var location = LatLong(latitude: 5.95492, longitude: 80.554956);
      return MapBox(
        locations: [location],
      );
    }
  }

  // Handle User Registration
  _handleRegister() async {
    if (_addressController.text.isNotEmpty ||
        _latitudeController.text.isNotEmpty ||
        _longitudeController.text.isNotEmpty) {
      widget.user.address = _addressController.text;
      widget.user.latitude = double.parse(_latitudeController.text);
      widget.user.longitude = double.parse(_longitudeController.text);
      widget.user.registerVia = "App";
      widget.user.referral = 0;

      var _response = await _userController.register(widget.user);
      print(widget.user.toJson());
    }
  }

  @override
  void initState() {
    super.initState();
    map = _mapHandler();
  }

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
                Text(
                  "Hi, ${widget.user.firstName}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Setup Your Location',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                CustomTextField(
                  hintTxt: 'Home Address',
                  lableTxt: 'Address',
                  mode: false,
                  controller: _addressController,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintTxt: 'Longitude',
                        lableTxt: 'Longitude',
                        mode: false,
                        controller: _longitudeController,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: CustomTextField(
                        hintTxt: 'Latitude',
                        lableTxt: 'Latitude',
                        mode: false,
                        controller: _latitudeController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // CustomButton(
                //     height: 50,
                //     btnColor: Colors.grey,
                //     fontColor: Colors.white,
                //     fontSize: 15,
                //     btnText: 'Show On Map',
                //     onPress: () => setState(() {
                //           map = _mapHandler();
                //         })),
                // const SizedBox(
                //   height: 15,
                // ),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: map,
                  clipBehavior: Clip.antiAlias,
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
                    btnText: 'Register',
                    onPress: _handleRegister),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
