import 'package:flutter/material.dart';
import 'package:vcs_client_app/Controllers/pet_controller.dart';

import '../Models/pet.dart';
import '../Repositories/pet_repository.dart';

class PetProvider with ChangeNotifier {
  // Dependencies
  var _petController = PetController(PetRepository());

  // States
  List<Pet> _pets = [];
  List<Pet> get pets => _pets;

  void fetchPets(int client) async {
    print("Provider Called");
    List<Pet> _temp = await _petController.myPets(client);
    _pets = _temp;
    notifyListeners();
  }
}
