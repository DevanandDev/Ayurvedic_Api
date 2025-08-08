import 'package:ayurved/data/model/user/patient_list.dart';
import 'package:ayurved/data/service/user/patients.dart';
import 'package:flutter/material.dart';

class PatientsProvider extends ChangeNotifier {
  PatientsService service = PatientsService();
  List<PatientModel> patient = [];
  bool isload = false;

  Future<void> getPatientProvider() async {
    isload = true;
    notifyListeners();
    try {
      final response = await service.patientsService();
      patient = response?.patient ?? [];
    } catch (e) {
      throw Exception('Patients Not Get :$e');
    } finally {
      isload = false;
      notifyListeners();
    }
  }
}
