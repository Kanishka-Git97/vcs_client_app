import 'package:vcs_client_app/Models/appointment.dart';

abstract class AppointmentService {
  Future<String> addAppointment(Appointment appointment);
  Future<List<Appointment>> getAppointments(int user);
}
