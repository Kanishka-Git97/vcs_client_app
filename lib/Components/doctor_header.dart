//import 'dart:html';

import 'package:flutter/material.dart';

import 'back_arrow.dart';
import 'custom_icon_button.dart';

class DoctorHeader extends StatelessWidget {
  const DoctorHeader({Key? key, required this.profileImg, required this.name})
      : super(key: key);

  final String profileImg;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 234, 234, 234)),
      height: 275,
      width: double.infinity,
      child: Column(
        children: [
          BackArrow(onPress: () {}),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 90,
            width: 90,
            child: CircleAvatar(
              backgroundImage: NetworkImage(profileImg),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12),
            child: SizedBox(
              child: Text(
                'Dr. Sandini Kaveesha',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: CustomIconButton(
                    height: 45,
                    width: 45,
                    icon: const Icon(Icons.chat),
                    color: Colors.blue,
                    onPress: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: CustomIconButton(
                    height: 45,
                    width: 45,
                    icon: const Icon(Icons.video_call),
                    color: Colors.black,
                    onPress: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: CustomIconButton(
                    height: 45,
                    width: 45,
                    icon: const Icon(Icons.call),
                    color: Colors.red,
                    onPress: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: CustomIconButton(
                    height: 45,
                    width: 45,
                    icon: const Icon(Icons.record_voice_over_rounded),
                    color: Colors.green,
                    onPress: () {}),
              ),
            ],
          )
        ],
      ),
    );
  }
}
