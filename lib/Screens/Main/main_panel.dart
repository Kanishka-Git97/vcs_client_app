import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Provider/appointment_provider.dart';
import 'package:vcs_client_app/Provider/pet_provider.dart';
import 'package:vcs_client_app/Provider/user_provider.dart';
import 'package:vcs_client_app/Screens/Appointment/my_appointments.dart';
import 'package:vcs_client_app/Screens/Home/home_screen.dart';
import 'package:vcs_client_app/Screens/Pet/pets_screen.dart';
import 'package:vcs_client_app/Screens/Search/search_screen.dart';
import 'package:vcs_client_app/Screens/User/profile_screen.dart';

class MainPanel extends StatefulWidget {
  const MainPanel({super.key});

  @override
  State<MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  // Bottom Navigation Screens
  final List<Widget> _screens = [
    const SearchScreen(),
    const PetsScreen(),
    const MyAppointmentScreen(),
    const ProfileScreen()
  ];

  // States
  int _currentIndex = 0;
  Customer user = Customer();

  // Handle Screens
  void _handleScreens(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = context.watch<UserProvider>().user;

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _handleScreens,
          selectedItemColor: const Color(0xff2687A4),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? const Icon(Icons.home)
                    : const Icon(
                        Icons.home_outlined,
                        color: Color(0xff2687A4),
                      ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? const Icon(Icons.pets)
                    : const Icon(
                        Icons.pets_outlined,
                        color: Color(0xff2687A4),
                      ),
                label: 'Pets'),
            BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? const Icon(Icons.video_chat)
                    : const Icon(
                        Icons.video_chat_outlined,
                        color: Color(0xff2687A4),
                      ),
                label: 'Appointments'),
            BottomNavigationBarItem(
                icon: Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.memory(
                      Base64Decoder().convert(user.img.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                label: 'Profile'),
          ]),
    );
  }
}
