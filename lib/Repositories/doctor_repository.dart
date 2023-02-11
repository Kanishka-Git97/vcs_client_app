import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Models/clinic.dart';
import 'package:vcs_client_app/Models/doctor.dart';
import 'package:vcs_client_app/Repositories/doctor_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorRepository implements DoctorService {
  @override
  Future<Doctor> getDoctorById(int doc) async {
    Doctor doctor = Doctor();
    print(doc);
    var data = {"id": doc};
    var url = Uri.parse('$baseUrl/doctor/find');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      doctor = Doctor.fromJson(json.decode(response.body));
      print(doctor.toJson());
      return doctor;
    } else {
      return doctor;
    }
  }

  @override
  Future<List<Doctor>> getDoctors() async {
    List<Doctor> res = [];
    var url = Uri.parse('$baseUrl/doctor/all');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      for (var doctor in result) {
        res.add(Doctor.fromJson(doctor));
      }
    }
    return res;
  }

  @override
  Future<List<Clinic>> getClinics(int doctor) async {
    List<Clinic> res = [];
    var data = {"id": doctor};
    var url = Uri.parse('$baseUrl/clinic/get');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      for (var doctor in result) {
        res.add(Clinic.fromJson(doctor));
      }
    }
    print(res.length);
    return res;
  }
}
