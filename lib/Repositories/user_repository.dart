import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Repositories/user_service.dart';

class UserRepository implements UserService {
  @override
  Future<String> register(Customer user) async {
    print(user.toJson());
    throw UnimplementedError();
  }
}
