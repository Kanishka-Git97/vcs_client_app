import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vcs_client_app/Components/pet_profile_card.dart';
import 'package:vcs_client_app/Provider/pet_provider.dart';
import 'package:vcs_client_app/Screens/Pet/pet_registration_screen.dart';

import '../../Models/pet.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Pet> pets = context.watch<PetProvider>().pets;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Pets",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Loyal companion, unconditional love",
                style: TextStyle(fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: List.generate(
                      pets.length,
                      (index) => PetProfileCard(
                            pet: pets[index],
                          )),
                ),
              )
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PetRegistrationScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
