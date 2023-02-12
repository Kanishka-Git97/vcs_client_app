import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Repositories/user_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository implements UserService {
  @override
  Future<String> register(Customer user) async {
    print(user.toJson());
    var url = Uri.parse('$baseUrl/client/register');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()));
    return response.statusCode.toString();
  }

  @override
  Future<Customer> login(String username, String password) async {
    Customer user;
    var url = Uri.parse('$baseUrl/user/login');
    var data = {'username': username, 'password': password};

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      user = Customer.fromJson(result['data']);
    } else {
      user = Customer();
    }
    return user;
  }

  @override
  Future<String> update(Customer customer) async {
    var url = Uri.parse('$baseUrl/client/update');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(customer.toJson()));
    return response.statusCode.toString();
  }
}
