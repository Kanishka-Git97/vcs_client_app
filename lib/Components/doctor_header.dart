//import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vcs_client_app/Models/doctor.dart';

import 'back_arrow.dart';
import 'custom_icon_button.dart';

class DoctorHeader extends StatelessWidget {
  const DoctorHeader({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 234, 234, 234)),
      height: 275,
      width: double.infinity,
      child: Column(
        children: [
          BackArrow(onPress: () {
            Navigator.pop(context);
          }),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
              height: 90,
              width: 90,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.memory(
                    Base64Decoder().convert(doctor.img.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12),
            child: SizedBox(
              child: Text(
                doctor.title.toString() +
                    " " +
                    doctor.firstName.toString() +
                    " " +
                    doctor.lastName.toString(),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
