import 'package:vcs_client_app/Models/clinic.dart';
import 'package:vcs_client_app/Models/doctor.dart';
import 'package:vcs_client_app/Repositories/doctor_repository.dart';

abstract class DoctorService {
  Future<Doctor> getDoctorById(int doctor);
  Future<List<Doctor>> getDoctors();
  Future<List<Clinic>> getClinics(int doctor);
}
