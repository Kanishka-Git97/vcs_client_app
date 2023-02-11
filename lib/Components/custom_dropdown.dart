import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.hintTxt,
    required this.lableTxt,
    required this.items,
    this.controller,
  }) : super(key: key);

  final String hintTxt;
  final String lableTxt;
  final List<dynamic> items;
  final TextEditingController? controller;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedValue;

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
        child: InputDecorator(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: widget.lableTxt,
            hintText: widget.hintTxt,
            hintStyle: const TextStyle(
              fontSize: 15,
            ),
          ),
          child: DropdownButton<String>(
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(
                value: item['value'].toString(),
                child: Text(item['label'].toString()),
              );
            }).toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
