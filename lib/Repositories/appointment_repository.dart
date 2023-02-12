import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Models/appointment.dart';
import 'package:vcs_client_app/Repositories/appointment_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentRepository implements AppointmentService {
  @override
  Future<String> addAppointment(Appointment appointment) async {
    var url = Uri.parse('$baseUrl/appointment/apply');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(appointment));
    if (response.statusCode == 200) {
      if (response.body == "Time Slot are Already Reserved") {
        return "Time Slot are Already Reserved";
      } else {
        return "true";
      }
    } else {
      return "Error";
    }
  }

  @override
  Future<List<Appointment>> getAppointments(int user) async {
    List<Appointment> res = [];
    var url = Uri.parse('$baseUrl/appointment/get');
    var data = {"id": user};
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      for (var appointment in result) {
        res.add(Appointment.fromJson(appointment));
      }
    }
    return res;
  }
}
