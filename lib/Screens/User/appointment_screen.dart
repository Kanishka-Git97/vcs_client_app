import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:vcs_client_app/Components/custom_button.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  bool _isConsultationChecked = false;
  bool _isTreatmentChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Arrange Appointment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                //color: Colors.grey,
                child: SfCalendar(
                  view: CalendarView.month,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'What Do you want ?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Consultation',
                          style: TextStyle(fontSize: 15),
                        ),
                        Checkbox(
                            value: _isConsultationChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isConsultationChecked = value!;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Treatment',
                          style: TextStyle(fontSize: 15),
                        ),
                        Checkbox(
                            value: _isTreatmentChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isTreatmentChecked = value!;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        height: 50,
                        btnColor: Colors.blueAccent,
                        fontColor: Colors.white,
                        fontSize: 15.0,
                        btnText: 'Next',
                        onPress: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
