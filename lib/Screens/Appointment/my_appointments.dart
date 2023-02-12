import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vcs_client_app/Components/appointment_card.dart';

import 'package:vcs_client_app/Provider/appointment_provider.dart';
import 'package:intl/intl.dart';
import '../../Models/appointment.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({super.key});

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    List<Appointment> _upcomingAppointments =
        context.watch<AppointmentProvider>().upcoming;

    List<Appointment> _history = context.watch<AppointmentProvider>().history;
    print(_history.length);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.grey),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            "Appointment Details",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff383D3C)),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color.fromARGB(255, 163, 163, 163)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        tabs: const [
                          Tab(
                            text: "Upcoming",
                          ),
                          Tab(
                            text: "History",
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: TabBarView(children: [
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                            children: List.generate(
                                _upcomingAppointments.length,
                                (index) => Container(
                                      margin: const EdgeInsets.all(8.0),
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: CircleAvatar(
                                                    child:
                                                        Icon(Icons.video_call),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _dateFormatter(
                                                          _upcomingAppointments[
                                                                  index]
                                                              .date
                                                              .toString()),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(_upcomingAppointments[
                                                            index]
                                                        .time
                                                        .toString()),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Text(
                                                _upcomingAppointments[index]
                                                    .remark
                                                    .toString()),
                                          )
                                        ],
                                      ),
                                    ))),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              _history.length,
                              (index) => Container(
                                    margin: const EdgeInsets.all(8.0),
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _dateFormatter(
                                                        _history[index]
                                                            .date
                                                            .toString()),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  Text(_history[index]
                                                      .time
                                                      .toString()),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(_history[index]
                                              .remark
                                              .toString()),
                                        )
                                      ],
                                    ),
                                  )),
                        ),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  String _dateFormatter(String input) {
    String timeStamp = input;
    DateTime date = DateTime.parse(timeStamp);
    var formater = DateFormat('dd MMM yyyy, E');
    String dateOnly = formater.format(date).toString();
    return dateOnly;
  }
}
