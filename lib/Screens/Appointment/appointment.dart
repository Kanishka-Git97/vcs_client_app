import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:vcs_client_app/Components/custom_button.dart';
import 'package:vcs_client_app/Components/custom_text_field.dart';
import 'package:vcs_client_app/Controllers/doctor_controller.dart';
import 'package:vcs_client_app/Models/appointment.dart';
import 'package:vcs_client_app/Models/clinic.dart';
import 'package:vcs_client_app/Models/doctor.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Provider/user_provider.dart';
import 'package:vcs_client_app/Repositories/doctor_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcs_client_app/Screens/Main/main_panel.dart';

import '../../Controllers/appointment_controller.dart';
import '../../Models/pet.dart';
import '../../Provider/appointment_provider.dart';
import '../../Repositories/appointment_repository.dart';

List<String> times = [
  "9.30 AM",
  "10.00 AM",
  "10.30 AM",
  "11.00 AM",
  "11.30 AM",
  "1.00 PM",
  "1.30 PM",
  "2.00 PM",
  "2.30 PM",
  "3.00 PM"
];

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key, required this.doctor, required this.pet});
  final Doctor doctor;
  final Pet pet;
  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  // Dependency injection
  var _doctorController = DoctorController(DoctorRepository());
  var _appointmentController = AppointmentController(AppointmentRepository());

  // Variables
  List<Clinic> clinics = [];
  int selectedClinic = 0;
  int selectedTime = -1;
  Clinic _clinic = Clinic();
  String _time = "";
  String _selectedDate = "";
  final TextEditingController _reasonController = TextEditingController();
  //Fetch Clinics
  _fetchClinics(Doctor doctor) async {
    var response = await _doctorController.getClinicsList(doctor.id!.toInt());

    setState(() {
      clinics = response;
      _clinic = response[0];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchClinics(widget.doctor);
  }

  // handle Appointment Submit
  _handleAppointmentSubmit(Customer user) async {
    if (_selectedDate.isNotEmpty ||
        _reasonController.text.isNotEmpty ||
        _time.isNotEmpty) {
      // Process the Appointment
      Appointment appointment = Appointment(
          date: _selectedDate,
          time: _time,
          type: "Online",
          status: "Pending",
          doctor: widget.doctor.id,
          client: user.id,
          clinic: _clinic.id,
          remark: _reasonController.text);
      // Send to the Server
      var response = await _appointmentController.addAppointment(appointment);
      if (response == "Time Slot are Already Reserved") {
        Fluttertoast.showToast(
            msg: "Time Slot are already reserved",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Provider.of<AppointmentProvider>(context, listen: false)
            .fetchAppointments(int.parse(user.id.toString()));
        Fluttertoast.showToast(
            msg: "Appointment Successfully Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPanel()));
      }
    } else {
      // Error
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
    Customer user = context.watch<UserProvider>().user;
    print('find:${clinics.length}');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Make your Appointment",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff383D3C)),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  width: double.infinity - 50,
                  //color: Colors.grey,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 0.5,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Veterinary',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.doctor.firstName.toString() +
                                " " +
                                widget.doctor.lastName.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(widget.doctor.title.toString())
                        ],
                      ),
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.memory(
                              Base64Decoder()
                                  .convert(widget.doctor.img.toString()),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Choose the Nearest Clinic",
                        style: TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                clinics.length,
                                (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedClinic = index;
                                          _clinic = clinics[index];
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: selectedClinic == index
                                              ? Colors.redAccent
                                              : Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Row(children: [
                                          const Icon(
                                            Icons.pets,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                clinics[index].name.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                clinics[index]
                                                    .address
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          )
                                        ]),
                                      ),
                                    )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Book your Date",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: double.infinity,
                        height: 250,
                        child: SfDateRangePicker(
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs args) {
                            _onSelectionChanged(args, context);
                          },
                          selectableDayPredicate: (DateTime dateTime) {
                            if (dateTime.isBefore(DateTime.now())) {
                              return false;
                            } else {
                              return true;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const Text("Select Appointment Time"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            times.length,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTime = index;
                                      _time = times[index];
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: selectedTime == index
                                          ? Colors.redAccent
                                          : Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(children: [
                                      const Icon(
                                        Icons.av_timer,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            times[index].toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                )),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        hintTxt: 'Describe Reason',
                        lableTxt: 'Reason',
                        mode: false,
                        controller: _reasonController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 10, left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(28, 179, 179, 179),
                          spreadRadius: 3)
                    ]),
                width: double.infinity,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                            height: 50,
                            btnColor: Colors.blueAccent,
                            fontColor: Colors.white,
                            fontSize: 18,
                            btnText:
                                'Pay For Appointment LKR ${widget.doctor.onlineFee.toString()}',
                            onPress: () => _handleAppointmentSubmit(user))),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _onSelectionChanged(
      DateRangePickerSelectionChangedArgs args, BuildContext context) {
    var selectedDate =
        DateTime.parse(args.value.toString()).toString().substring(0, 10);
    setState(() {
      _selectedDate = selectedDate;
    });
  }
}
