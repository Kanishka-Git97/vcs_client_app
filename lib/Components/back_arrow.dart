import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key, required this.onPress}) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 20),
        height: 30,
        width: 30,
        child: IconButton(
            onPressed: onPress,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
            )),
      ),
    );
  }
}
