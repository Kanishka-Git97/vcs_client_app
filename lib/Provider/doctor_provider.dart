import 'package:flutter/material.dart';
import 'package:vcs_client_app/Controllers/doctor_controller.dart';
import 'package:vcs_client_app/Models/doctor.dart';
import 'package:vcs_client_app/Repositories/doctor_repository.dart';

enum HomeState { Initial, Loading, Loaded, Error }

class DoctorProvider with ChangeNotifier {
  // Dependecies
  var _doctorController = DoctorController(DoctorRepository());

  // States
  List<Doctor> _anchor = [];
  List<Doctor> _doctors = [];
  List<Doctor> get doctors => _doctors;

  HomeState _homeState = HomeState.Initial;
  HomeState get homeState => _homeState;

  Future<List<Doctor>> setDoctors() async {
    _homeState = HomeState.Loading;
    try {
      _homeState = HomeState.Loaded;
      final result = await _doctorController.getDoctorList();
      _anchor = result;
      _doctors = result;
    } catch (e) {
      _homeState = HomeState.Error;
    }
    notifyListeners();
    return _doctors;
  }

  void searchDoctors(keyword) async {
    _homeState = HomeState.Loading;
    try {
      _homeState = HomeState.Loaded;
      final result = _anchor
          .where((element) => element.address!
              .toLowerCase()
              .contains(keyword.toString().toLowerCase()))
          .toList();
      _doctors = result;
    } catch (e) {
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  bool sortingSlug = false;
  void sort() {
    sortingSlug = !sortingSlug;
    if (sortingSlug == false) {
      _doctors.sort(
          (a, b) => a.onlineFee.toString().compareTo(b.onlineFee.toString()));
    } else {
      _doctors.sort(
          (a, b) => b.onlineFee.toString().compareTo(a.onlineFee.toString()));
    }
    notifyListeners();
  }
}
