import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Controllers/pet_controller.dart';
import 'package:vcs_client_app/Models/pet.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Provider/pet_provider.dart';
import 'package:vcs_client_app/Provider/user_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Components/custom_dropdown.dart';
import '../../Constant/constant.dart';
import '../../Repositories/pet_repository.dart';
import '../../Utils/image_utility.dart';
import '../Main/main_panel.dart';

class PetRegistrationScreen extends StatefulWidget {
  const PetRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<PetRegistrationScreen> createState() => _PetRegistrationScreenState();
}

class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
  // Variables
  String? _selectedSex;
  String? _selectedType;
  final List<dynamic> _sexList = [
    {"value": "Male", 'label': "Male"},
    {"value": "Female", 'label': "Female"},
  ];
  final List<dynamic> _petTypeList = [
    {"value": "Dog", 'label': "Dog"},
    {"value": "Cat", 'label': "Cat"},
    {"value": "Fish", 'label': "Fish"},
    {"value": "Bird", 'label': "Bird"},
    {"value": "Reptile", 'label': "Reptile"},
    {"value": "Small animal", 'label': "Small animal"},
  ];
  String imgString = samplePet;
  // TextEditing Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();

  // Dependencies
  var _petController = PetController(PetRepository());

  // Handle Image Picker
  _imagePicker() async {
    String output;
    ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {
      output = ImageUtility.base64String(await img!.readAsBytes());

      setState(() {
        imgString = output;
      });
    });
  }

  // handle Pet Registration
  _handlePetRegistration(Customer user, BuildContext ctx) async {
    Pet _pet = Pet();
    int _userId;
    if (user.id != null) {
      _userId = user.id!;
    } else {
      _userId = 0;
    }
    if (_nameController.text.isNotEmpty ||
        _dobController.text.isNotEmpty ||
        _breedController.text.isNotEmpty ||
        _selectedSex != null ||
        _selectedType != null) {
      // Process
      _pet.name = _nameController.text;
      _pet.dob = _dobController.text;
      _pet.breed = _breedController.text;
      _pet.sex = _selectedSex;
      _pet.type = _selectedType;
      _pet.doctor = 0;
      _pet.client = user.id;
      _pet.img = imgString;

      print(_pet.toJson());
      // todo: send to the server
      var response = await _petController.register(_pet);
      if (response == 'true') {
        // process
        ctx.read<PetProvider>().fetchPets(_userId);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MainPanel()));
      } else {
        // error
        Fluttertoast.showToast(
            msg: "Something went wrong Please try again",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      // error
      Fluttertoast.showToast(
          msg: "Required Details Are Missing",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Customer _user = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          //height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                'assets/images/cover.jpg',
              ),
              repeat: ImageRepeat.repeat,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2), BlendMode.modulate),
            ),
          ),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'ADD YOUR PET',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'For Veterinary Consultation Solution',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.memory(
                                      Base64Decoder().convert(imgString),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: _imagePicker,
                                    child: Icon(
                                      Icons.add_circle_rounded,
                                      color: Colors.teal,
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('Register your Pet for the Consulting'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hintTxt: 'Pet Name',
                        lableTxt: 'Name',
                        mode: false,
                        controller: _nameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hintTxt: 'yyyy/mm/dd',
                        lableTxt: 'Date of Birth',
                        mode: false,
                        onInputType: TextInputType.datetime,
                        controller: _dobController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const CustomTextField(
                      //     hintTxt: 'Sex', lableTxt: 'Sex', mode: false),

                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        hintTxt: 'Breed',
                        lableTxt: 'Animal Breed',
                        mode: false,
                        controller: _breedController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 234, 232, 232),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: FormHelper.dropDownWidget(
                            context,
                            'Sex',
                            _selectedSex,
                            _sexList,
                            (onChangedVal) {
                              setState(() {
                                _selectedSex = onChangedVal;
                              });
                            },
                            (onValidate) {},
                            borderColor: Colors.transparent,
                            borderRadius: 12,
                            optionLabel: "label",
                            optionValue: "value",
                            hintFontSize: 15,
                            borderFocusColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 234, 232, 232),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: FormHelper.dropDownWidget(
                            context,
                            'Animal Type',
                            _selectedType,
                            _petTypeList,
                            (onChangedVal) {
                              setState(() {
                                _selectedType = onChangedVal;
                              });
                            },
                            (onValidate) {},
                            borderColor: Colors.transparent,
                            borderRadius: 12,
                            optionLabel: "label",
                            optionValue: "value",
                            hintFontSize: 15,
                            borderFocusColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          height: 50,
                          btnColor: Colors.green,
                          fontColor: Colors.white,
                          fontSize: 15,
                          btnText: 'Register Pet',
                          onPress: () =>
                              _handlePetRegistration(_user, context)),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
