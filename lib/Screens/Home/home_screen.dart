import 'package:flutter/material.dart';
import 'package:vcs_client_app/Components/profile_card.dart';

import 'package:vcs_client_app/Components/search_bar.dart';
import 'package:vcs_client_app/Components/side_navigation.dart';

import '../../Models/doctor_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const NavBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Find Your Desired\nVeterinary',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromARGB(255, 38, 38, 38),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 65, right: 30),
              child: SearchBar(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                'Popular Doctors',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            buildProfileList(),
          ],
        ),
      )),
    );
  }

  buildProfileList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          ProfileCard(
              'https://www.pngkit.com/png/detail/10-100458_female-doctor-png-picture-indian-lady-doctor-png.png',
              'Sandini',
              'Dr'),
          ProfileCard(
              'https://freepngimg.com/thumb/nurse/7-2-nurse-picture-thumb.png',
              'Kavee',
              'Dr'),
          ProfileCard(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZiZ8We6BRxzquy1x3mCqO7I9JBz8Aj1RSYA&usqp=CAU',
              'Waruni',
              'Dr'),
          ProfileCard(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMvSaTaxuUJDpvvYYeMj-yoC6dmvM2tkSkBQ&usqp=CAU',
              'Senuri',
              'Dr'),
          ProfileCard(
              'https://cdn.picpng.com/doctors_and_nurses/doctors-and-nurses-image-32724.png',
              'Omalka',
              'Dr'),
        ]),
      ),
    );
  }
}