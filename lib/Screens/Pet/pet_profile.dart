import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vcs_client_app/Components/chat_bubble.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Controllers/certification_controller.dart';
import 'package:vcs_client_app/Controllers/doctor_controller.dart';
import 'package:vcs_client_app/Controllers/pet_controller.dart';
import 'package:intl/intl.dart';
import 'package:vcs_client_app/Models/certificate.dart';
import 'package:vcs_client_app/Models/doctor.dart';
import 'package:vcs_client_app/Screens/Search/search_screen.dart';

import 'dart:math';

import '../../Models/medical.dart';
import '../../Models/pet.dart';
import '../../Models/weight.dart';
import '../../Repositories/certification_repository.dart';
import '../../Repositories/doctor_repository.dart';
import '../../Repositories/pet_repository.dart';
import '../Appointment/appointment.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key, required this.pet});

  final Pet pet;
  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  // Dependencies
  var _petController = PetController(PetRepository());
  var _doctorController = DoctorController(DoctorRepository());
  var _certificationController =
      CertificationController(CertificationRepository());

  // Varibles
  List<Medical> comments = [];
  List<Weight> weights = [];
  Widget doctorSection = Container();

  // Fetch Comments
  _fetchDetails(Pet pet) async {
    List<Medical> _temp;
    List<Weight> _tempWeight;
    _temp =
        await _petController.fetchComments(int.parse(widget.pet.id.toString()));
    setState(() {
      comments = _temp;
    });
    _tempWeight =
        await _petController.fetchWeights(int.parse(widget.pet.id.toString()));
    setState(() {
      weights = _tempWeight;
    });
  }

  _handleCertificateRequest() async {
    print("certificate request");
    Certificate certificate = Certificate(
        doctor: widget.pet.doctor,
        client: widget.pet.client,
        pet: widget.pet.id,
        date: DateTime.now().toString(),
        status: 'Pending');
    var response = await _certificationController.add(certificate);
    if (response == "true") {
      // Success
      Fluttertoast.showToast(
          msg:
              "Successfully Requested Veterinary Will Send Certificate to your Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      // error
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.orangeAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // Doctor Section
  _doctorSection(Pet pet) async {
    Widget doctorSection;
    if (pet.doctor != 0) {
      // Process Doctor Details
      Doctor doctor = Doctor();
      doctor = await _doctorController.getDoctor(pet.doctor!);
      doctorSection = Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 2)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  clipBehavior: Clip.antiAlias,
                  child: Image.memory(
                    Base64Decoder().convert(doctor.img.toString()),
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.redAccent,
                    // image: DecorationImage(
                    //   image: NetworkImage(location.image.toString()),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Todo: Get Data from Provider or Previous Screen
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                doctor.title.toString() +
                                    " " +
                                    doctor.firstName.toString() +
                                    " " +
                                    doctor.lastName.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Row(children: [
                                Icon(Icons.location_on),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(doctor.address.toString())
                              ]),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AppointmentScreen(
                                                doctor: doctor,
                                                pet: widget.pet,
                                              )));
                                },
                                child:
                                    const CircleAvatar(child: Icon(Icons.add))),
                          ),
                        ],
                      ),
                      // RatingPanel(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () => _handleCertificateRequest(),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.verified_user_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      "Request Medical Certification",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
            ))
      ]);
    } else {
      // Process Add Doctor Section
      doctorSection = Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[100],
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Opps!, Please Assign Veterniarin for your Pet",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite),
                    Text("Assign Veterninarian")
                  ],
                ))
          ],
        ),
      );
    }
    setState(() {
      this.doctorSection = doctorSection;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchDetails(widget.pet);
    _doctorSection(widget.pet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 8,
          child: SizedBox(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 80,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (() => Navigator.pop(context)),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  pinned: true,
                  elevation: 3,
                  backgroundColor: Colors.white,
                  expandedHeight: 400,
                  flexibleSpace: FlexibleSpaceBar(
                    background: widget.pet.img == null
                        ? Image.network(
                            'https://th.bing.com/th/id/R.4e128a9c0a99fd305114f16594b44633?rik=MYIvaEopMQlkqQ&pid=ImgRaw&r=0',
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          )
                        : Image.memory(
                            Base64Decoder().convert(widget.pet.img.toString()),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                  ),
                  bottom: PreferredSize(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.pet.name.toString(),
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff3C4143),
                                                  fontWeight: FontWeight.w600)),
                                          Text(widget.pet.type.toString(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff3C4143),
                                              )),
                                        ],
                                      ),
                                      Text(widget.pet.breed.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff3C4143),
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      preferredSize: const Size.fromHeight(0)),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Medical History",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 160,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: comments.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ChatBubble(
                                    message: comments[index].comment.toString(),
                                    isMe: false,
                                    time: comments[index].date.toString());
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Growing Chart",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          height: 300,
                          width: double.infinity,
                          child: BarChart(
                            BarChartData(
                              titlesData: FlTitlesData(
                                show: true,
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: weights
                                  .map((e) => BarChartGroupData(
                                        x: DateFormat('yyyy/MM/dd')
                                            .parse(e.date!)
                                            .month
                                            .toInt(),
                                        barRods: [
                                          BarChartRodData(
                                              color: Colors.blueAccent,
                                              width: 16,
                                              toY: e.weight!.toDouble())
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Doctor Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        doctorSection,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
