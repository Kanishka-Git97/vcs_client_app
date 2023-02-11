import 'package:flutter/material.dart';
import 'package:vcs_client_app/Controllers/appointment_controller.dart';
import 'package:vcs_client_app/Models/user.dart';

import '../Models/appointment.dart';
import '../Repositories/appointment_repository.dart';

class AppointmentProvider with ChangeNotifier {
  // Depencies
  var _appointmentController = AppointmentController(AppointmentRepository());

  // States
  List<Appointment> _anchor = [];
  List<Appointment> get anchor => _anchor;
  List<Appointment> _upcoming = [];
  List<Appointment> get upcoming => _upcoming;

  List<Appointment> _history = [];
  List<Appointment> get history => _history;

  void fetchAppointments(int user) async {
    var pending = "Pending";
    var completed = "Completed";
    List<Appointment> result =
        await _appointmentController.getAppointments(user);
    _anchor = result;
    _upcoming = result
        .where((element) => element.status!
            .toLowerCase()
            .contains(pending.toString().toLowerCase()))
        .toList();
    _history = result
        .where((element) => element.status!
            .toLowerCase()
            .contains(completed.toString().toLowerCase()))
        .toList();
    notifyListeners();
  }
}
