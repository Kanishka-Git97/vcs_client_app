import 'package:flutter/material.dart';

import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/doctor_header.dart';
import 'package:vcs_client_app/Components/time_card.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DoctorHeader(
              profileImg:
                  'https://www.pngkit.com/png/detail/10-100458_female-doctor-png-picture-indian-lady-doctor-png.png',
              name: 'Dr. Sandini Kaveesha'),
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
                const Text(
                    'Suzy Queue 4455 Landing Lange, APT 4 Louisville, KY 40018-1234'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    height: 50.0,
                    btnColor: Colors.blueAccent,
                    fontColor: Colors.white,
                    fontSize: 15.0,
                    btnText: 'Make Appointment',
                    onPress: () {}),
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
}
