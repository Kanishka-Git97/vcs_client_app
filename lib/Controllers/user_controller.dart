import 'package:vcs_client_app/Models/user.dart';
import '../Repositories/user_service.dart';

class UserController {
  final UserService userService;
  UserController(this.userService);

  Future<String> register(Customer customer) {
    return userService.register(customer);
  }

  Future<Customer> login(String username, String password) {
    return userService.login(username, password);
  }

  Future<String> update(Customer customer) {
    return userService.update(customer);
  }
}
