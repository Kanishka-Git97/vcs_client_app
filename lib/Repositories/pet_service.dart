import '../Models/medical.dart';
import '../Models/pet.dart';
import '../Models/weight.dart';

abstract class PetService {
  Future<List<Pet>> fetchPets(int client);
  Future<List<Medical>> fetchComments(int pet);
  Future<String> register(Pet pet);
  Future<List<Weight>> fetchWeight(int pet);
  Future<bool> updatePet(Pet pet);
}
