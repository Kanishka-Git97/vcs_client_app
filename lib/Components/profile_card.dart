import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  String _title;
  String _firstName;
  var _image;

  ProfileCard(this._image, this._firstName, this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 160,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 110,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _title + '. ' + _firstName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 51, 51, 51),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 4,
            top: 5,
            child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    //color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.network(
                    _image,
                    fit: BoxFit.cover,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
