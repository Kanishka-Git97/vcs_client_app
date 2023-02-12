import 'package:vcs_client_app/Models/certificate.dart';
import 'package:vcs_client_app/Repositories/certification_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Constant/constant.dart';

class CertificationRepository implements CertificationService {
  @override
  Future<String> add(Certificate certificate) async {
    print(certificate.toJson());
    var url = Uri.parse('$baseUrl/certificate/add');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(certificate));
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (response.body == "true") {
        return "true";
      } else {
        print(response.body);
        return "false";
      }
    } else {
      return "false";
    }
  }
}
