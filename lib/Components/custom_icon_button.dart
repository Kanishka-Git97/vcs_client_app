import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.icon,
      required this.color,
      required this.onPress})
      : super(key: key);

  //final double padding;
  final double height;
  final double width;
  final Icon icon;
  final VoidCallback onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircleAvatar(
        foregroundColor: color,
        child: IconButton(
          onPressed: onPress,
          icon: icon,
        ),
      ),
    );
  }
}
