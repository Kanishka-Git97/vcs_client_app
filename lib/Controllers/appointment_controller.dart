import 'package:vcs_client_app/Models/appointment.dart';
import 'package:vcs_client_app/Repositories/appointment_service.dart';

class AppointmentController {
  final AppointmentService appointmentService;
  AppointmentController(this.appointmentService);

  Future<String> addAppointment(Appointment appointment) {
    return appointmentService.addAppointment(appointment);
  }

  Future<List<Appointment>> getAppointments(int user) {
    return appointmentService.getAppointments(user);
  }
}
