import 'package:vcs_client_app/Models/certificate.dart';

abstract class CertificationService {
  Future<String> add(Certificate certificate);
}
