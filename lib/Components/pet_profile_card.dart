import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Controllers/pet_controller.dart';
import 'package:vcs_client_app/Models/pet.dart';
import 'package:vcs_client_app/Screens/Pet/pet_profile.dart';

import '../Models/medical.dart';
import '../Repositories/pet_repository.dart';

class PetProfileCard extends StatefulWidget {
  PetProfileCard({Key? key, required this.pet}) : super(key: key);

  final Pet pet;

  @override
  State<PetProfileCard> createState() => _PetProfileCardState();
}

class _PetProfileCardState extends State<PetProfileCard> {
  // PetProfileCard(this.pet);
  var _petController = PetController(PetRepository());

  List<Medical> comments = [];

  // Fetch Comments of the Dog
  _fetchComments(Pet pet) async {
    List<Medical> _comments;
    _comments =
        await _petController.fetchComments(int.parse(pet.id.toString()));
    setState(() {
      comments = _comments;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchComments(widget.pet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.cyan[50],
      ),
      height: 150,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: widget.pet.img == null
                          ? Image.memory(
                              Base64Decoder().convert(samplePet),
                              fit: BoxFit.cover,
                            )
                          : Image.memory(
                              Base64Decoder()
                                  .convert(widget.pet.img.toString()),
                              fit: BoxFit.cover,
                            )),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pet.name.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.pet.breed.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PetProfile(pet: widget.pet)));
                        },
                        child: Icon(Icons.more),
                      )),
                )
              ],
            ),
            Chip(
                elevation: 0,
                avatar: CircleAvatar(
                  child: Text(comments.length.toString()),
                ),
                padding: EdgeInsets.all(8.0),
                backgroundColor: Color.fromARGB(255, 223, 221, 221),
                label: Text(
                  comments.length == 0
                      ? "No any Comments"
                      : comments[comments.length - 1].comment.toString(),
                )),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
