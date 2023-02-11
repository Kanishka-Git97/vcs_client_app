import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/doctor_header.dart';
import 'package:vcs_client_app/Components/map_box.dart';
import 'package:vcs_client_app/Components/time_card.dart';
import 'package:vcs_client_app/Controllers/pet_controller.dart';
import 'package:vcs_client_app/Models/doctor.dart';
import 'package:vcs_client_app/Models/lat_long.dart';
import 'package:vcs_client_app/Provider/pet_provider.dart';
import 'package:vcs_client_app/Repositories/pet_repository.dart';
import 'package:vcs_client_app/Screens/User/appointment_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Models/pet.dart';
import '../Main/main_panel.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key, required this.doctor}) : super(key: key);
  final Doctor doctor;
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  // Fetch Clinic Information

  @override
  Widget build(BuildContext context) {
    var _petController = PetController(PetRepository());
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DoctorHeader(
            doctor: widget.doctor,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                    'Veterinarian Duties & Responsibilities. Veterinarians provide medical care for animals. The primary responsibilities of a veterinarian include: 2 ﻿. Advising clients on care of their pets. Administering immunizations. Conducting physical examinations. Providing emergency care. Performing surgery and dental procedures.'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Available at',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      TimeCard(
                        title: 'Mon-Fri',
                        info: '8.30 AM - 10.00 PM',
                        color: Colors.lightGreen,
                        fontColor: Colors.white,
                      ),
                      TimeCard(
                        title: 'Sat-Sun',
                        info: '9.30 AM - 08.00 PM',
                        color: Colors.lightGreen,
                        fontColor: Colors.white,
                      ),
                      TimeCard(
                        title: 'Holiday',
                        info: 'Not Available',
                        color: Colors.redAccent,
                        fontColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(widget.doctor.address.toString()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAlias,
                  child: MapBox(
                    locations: [
                      LatLong(latitude: 5.954920, longitude: 80.554956)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    height: 50.0,
                    btnColor: Colors.blueAccent,
                    fontColor: Colors.white,
                    fontSize: 15.0,
                    btnText: 'Assign Doctor',
                    onPress: () {
                      _showDialog(context, widget.doctor, _petController);
                    }),
                const SizedBox(
                  height: 7,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Future _showDialog(
      BuildContext context, Doctor doctor, PetController petController) async {
    var pets = Provider.of<PetProvider>(context, listen: false).pets;

    final selectedValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Your Pet for Assign'),
          children: pets.map((e) {
            return SimpleDialogOption(
              child: Text(e.name.toString()),
              onPressed: () async {
                Pet pet = e;
                pet.doctor = doctor.id;
                // Process Update Pet Profile with new Doctor

                var response = await petController.updatePet(pet);
                if (response) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPanel()));
                } else {
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                      msg: "Something went wrong",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
            );
          }).toList(),
          // children: <Widget>[
          //   SimpleDialogOption(
          //     child: Text('Option 1'),
          //     onPressed: () => Navigator.pop(context, 'Option 1'),
          //   ),
          //   SimpleDialogOption(
          //     child: Text('Option 2'),
          //     onPressed: () => Navigator.pop(context, 'Option 2'),
          //   ),
          //   SimpleDialogOption(
          //     child: Text('Option 3'),
          //     onPressed: () => Navigator.pop(context, 'Option 3'),
          //   ),
          // ],
        );
      },
    );
  }
}
