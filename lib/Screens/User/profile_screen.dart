import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Components/map_box.dart';
import 'package:vcs_client_app/Controllers/user_controller.dart';
import 'package:vcs_client_app/Models/lat_long.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Provider/user_provider.dart';
import 'package:vcs_client_app/Repositories/user_repository.dart';
import 'package:vcs_client_app/Screens/Auth/login_screen.dart';

import '../../Constant/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Customer user = context.watch<UserProvider>().user;

    // Dependecy Inject
    var _userController = UserController(UserRepository());

    final TextEditingController _firstNameController =
        TextEditingController(text: user.firstName);
    final TextEditingController _lastNameController =
        TextEditingController(text: user.lastName);
    final TextEditingController _mobilePhoneController =
        TextEditingController(text: user.mobile);
    final TextEditingController _addressController =
        TextEditingController(text: user.address);
    final TextEditingController _latitudeController =
        TextEditingController(text: user.latitude.toString());
    final TextEditingController _longitudeController =
        TextEditingController(text: user.longitude.toString());

    // Handle Profile Update
    _handleProfileUpdate(Customer user) async {
      if (_firstNameController.text.isNotEmpty) {
        user.firstName = _firstNameController.text;
      }
      if (_lastNameController.text.isNotEmpty) {
        user.lastName = _lastNameController.text;
      }
      if (_mobilePhoneController.text.isNotEmpty) {
        user.mobile = _mobilePhoneController.text;
      }
      if (_addressController.text.isNotEmpty) {
        user.address = _addressController.text;
      }
      if (_latitudeController.text.isNotEmpty) {
        user.latitude = double.parse(_latitudeController.text);
      }
      if (_longitudeController.text.isNotEmpty) {
        user.longitude = double.parse(_longitudeController.text);
      }

      // Update Server
      var response = await _userController.update(user);
      print(response);
      if (response == "200") {
        setState(() {
          context.read<UserProvider>().setUser(user);
          user = user;
        });
      } else {
        Fluttertoast.showToast(
            msg: "Something is went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.grey),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "My Profile",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff383D3C)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: user.img == null || user.img.toString() == "none"
                      ? Image.memory(
                          Base64Decoder().convert(sampleUser),
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          Base64Decoder().convert(user.img.toString()),
                          fit: BoxFit.cover),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.redAccent,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.firstName.toString() +
                          ' ' +
                          user.lastName.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12,
                        ),
                        Text(user.address.toString())
                      ],
                    ),
                    Text(
                      " " + user.email.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call_end_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  user.mobile.toString(),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => loginScreen()),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Sign Out",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: MapBox(
                        locations: [
                          LatLong(
                              latitude: user.latitude,
                              longitude: user.longitude)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Update My Profile",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintTxt: 'First Name',
                      lableTxt: 'First Name',
                      mode: false,
                      controller: _firstNameController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintTxt: 'Last Name',
                      lableTxt: 'Last Name',
                      mode: false,
                      controller: _lastNameController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintTxt: 'Mobile Number',
                      lableTxt: 'Mobile Number',
                      mode: false,
                      onInputType: TextInputType.phone,
                      controller: _mobilePhoneController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintTxt: 'Home Address',
                      lableTxt: 'Address',
                      mode: false,
                      onInputType: TextInputType.streetAddress,
                      controller: _addressController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintTxt: 'Latitude',
                      lableTxt: 'Latitude Cordinate',
                      mode: false,
                      onInputType: TextInputType.number,
                      controller: _latitudeController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintTxt: 'Longitude',
                      lableTxt: 'Longitude Cordinate',
                      mode: false,
                      onInputType: TextInputType.number,
                      controller: _longitudeController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        height: 50,
                        btnColor: Colors.blueAccent,
                        fontColor: Colors.white,
                        fontSize: 18,
                        btnText: 'Update Information',
                        onPress: () => _handleProfileUpdate(user)),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
