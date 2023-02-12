import 'package:vcs_client_app/Repositories/doctor_service.dart';

import '../Models/clinic.dart';
import '../Models/doctor.dart';

class DoctorController {
  final DoctorService doctorServices;
  DoctorController(this.doctorServices);

  Future<Doctor> getDoctor(int doctor) {
    return doctorServices.getDoctorById(doctor);
  }

  Future<List<Doctor>> getDoctorList() {
    return doctorServices.getDoctors();
  }

  Future<List<Clinic>> getClinicsList(int doctor) {
    return doctorServices.getClinics(doctor);
  }
}
