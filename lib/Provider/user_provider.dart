import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcs_client_app/Constant/constant.dart';
import 'package:vcs_client_app/Controllers/user_controller.dart';
import 'package:vcs_client_app/Models/user.dart';
import 'package:vcs_client_app/Repositories/user_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Screens/Main/main_panel.dart';
import 'appointment_provider.dart';
import 'pet_provider.dart';

class UserProvider with ChangeNotifier {
  // Dependencies
  var _userController = UserController(UserRepository());

  // States
  Customer _user = Customer(img: sampleUser);
  Customer get user => _user;

  void login(String username, String password, BuildContext context) async {
    Customer response = await _userController.login(username, password);
    _user = response;
    if (response.id != null || response.id != 0) {
      Provider.of<PetProvider>(context, listen: false)
          .fetchPets(int.parse(_user.id.toString()));
      Provider.of<AppointmentProvider>(context, listen: false)
          .fetchAppointments(int.parse(_user.id.toString()));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainPanel()));
    } else {
      Fluttertoast.showToast(
          msg: "Required Details Are Missing",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    notifyListeners();
  }

  void setUser(Customer user) {
    _user = user;
    notifyListeners();
  }
}
