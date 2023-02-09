import 'package:vcs_client_app/Models/user.dart';

abstract class UserService {
  Future<String> register(Customer user);
}
