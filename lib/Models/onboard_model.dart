import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: 'assets/images/sammy-23.png',
    text: "Digital Veterinary Clinic",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pulvinar dui et erat convallis dapibus. Duis dolor mauris, bibendum non purus nec, finibus accumsan lectus. Nulla malesuada laoreet erat. In arcu nunc, egestas at erat ut, tristique pellentesque augue.",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'assets/images/clip-1033.png',
    text: "Digital Veterinary Clinic",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pulvinar dui et erat convallis dapibus. Duis dolor mauris, bibendum non purus nec, finibus accumsan lectus. Nulla malesuada laoreet erat. In arcu nunc, egestas at erat ut, tristique pellentesque augue.",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'assets/images/Veterinary-pana.png',
    text: "Digital Veterinary Clinic",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pulvinar dui et erat convallis dapibus. Duis dolor mauris, bibendum non purus nec, finibus accumsan lectus. Nulla malesuada laoreet erat. In arcu nunc, egestas at erat ut, tristique pellentesque augue.",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
];
