import 'package:vcs_client_app/Models/certificate.dart';
import 'package:vcs_client_app/Repositories/certification_service.dart';

class CertificationController {
  final CertificationService certificationService;
  CertificationController(this.certificationService);

  Future<String> add(Certificate certificate) {
    return certificationService.add(certificate);
  }
}
