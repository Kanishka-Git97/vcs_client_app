import 'package:vcs_client_app/Repositories/pet_service.dart';

import '../Models/medical.dart';
import '../Models/pet.dart';
import '../Models/weight.dart';

class PetController {
  final PetService petService;
  PetController(this.petService);

  Future<List<Pet>> myPets(int client) {
    return petService.fetchPets(client);
  }

  Future<List<Medical>> fetchComments(int pet) {
    return petService.fetchComments(pet);
  }

  Future<String> register(Pet pet) {
    return petService.register(pet);
  }

  Future<List<Weight>> fetchWeights(int pet) {
    return petService.fetchWeight(pet);
  }

  Future<bool> updatePet(Pet pet) {
    return petService.updatePet(pet);
  }
}
