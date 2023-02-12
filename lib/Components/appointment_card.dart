import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import '../Models/appointment.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});
  final Appointment appointment;

  String _dateFormatter(String input) {
    String timeStamp = input;
    DateTime date = DateTime.parse(timeStamp);
    var formater = DateFormat('dd MMM yyyy, E');
    String dateOnly = formater.format(date).toString();
    return dateOnly;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _dateFormatter(appointment.date.toString()),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          Icon(
            Icons.av_timer_outlined,
            color: Color(0xff7C8385),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            appointment.time.toString(),
          )
        ],
      ),
    );
  }
}
