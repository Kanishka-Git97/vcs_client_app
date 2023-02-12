import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(226, 235, 235, 235),
          ),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'Search for consultation'),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blueAccent,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
