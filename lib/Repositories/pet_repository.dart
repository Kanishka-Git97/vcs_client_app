import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Models/medical.dart';
import 'package:vcs_client_app/Models/pet.dart';
import 'package:vcs_client_app/Models/weight.dart';
import 'package:vcs_client_app/Repositories/pet_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PetRepository implements PetService {
  @override
  Future<List<Pet>> fetchPets(int client) async {
    List<Pet> pets = [];
    var data = {"client": client};
    var url = Uri.parse('$baseUrl/pet/mypets');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    List<dynamic> myPets = json.decode(response.body);
    for (var pet in myPets) {
      pets.add(Pet.fromJson(pet));
    }
    return pets;
  }

  @override
  Future<List<Medical>> fetchComments(int pet) async {
    List<Medical> comments = [];
    var data = {"pet": pet};
    var url = Uri.parse('$baseUrl/medical/getall');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    List<dynamic> _temp = json.decode(response.body);
    for (var pet in _temp) {
      comments.add(Medical.fromJson(pet));
    }
    return comments;
  }

  @override
  Future<String> register(Pet pet) async {
    var url = Uri.parse('$baseUrl/pet/register');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(pet.toJson()));
    if (response.statusCode == 200) {
      return 'true';
    } else {
      return 'false';
    }
  }

  @override
  Future<List<Weight>> fetchWeight(int pet) async {
    List<Weight> weights = [];
    var data = {"pet": pet};
    var url = Uri.parse('$baseUrl/weight/getall');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    List<dynamic> _temp = json.decode(response.body);
    for (var weight in _temp) {
      weights.add(Weight.fromJson(weight));
    }
    return weights;
  }

  @override
  Future<bool> updatePet(Pet pet) async {
    var url = Uri.parse('$baseUrl/pet/update');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(pet.toJson()));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
    // throw UnimplementedError();
  }
}
