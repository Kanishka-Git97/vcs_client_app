import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hintTxt,
    required this.lableTxt,
    required this.mode,
    this.controller,
    this.onChange,
    this.onInputType,
  }) : super(key: key);

  final String hintTxt;
  final String lableTxt;

  final bool mode;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final TextInputType? onInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 234, 232, 232),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.onInputType,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: widget.lableTxt,
              hintText: widget.hintTxt,
              hintStyle: const TextStyle(
                fontSize: 15,
              ),
              suffixIcon: IconButton(
                onPressed: () =>
                    setState(() => isHiddenPassword = !isHiddenPassword),
                icon: Icon(
                    isHiddenPassword ? Icons.visibility : Icons.visibility_off),
                color: widget.mode
                    ? const Color.fromARGB(255, 96, 96, 96)
                    : Colors.transparent,
              )),
          obscureText: widget.mode ? isHiddenPassword : false,
        ),
      ),
    );
  }
}
