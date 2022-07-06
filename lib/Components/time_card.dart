import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  const TimeCard(
      {Key? key,
      required this.title,
      required this.info,
      required this.color,
      required this.fontColor})
      : super(key: key);

  final String title;
  final String info;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      height: 50,
      width: 150,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: fontColor),
          ),
          Text(
            info,
            style: TextStyle(color: fontColor),
          )
        ],
      ),
    );
  }
}
