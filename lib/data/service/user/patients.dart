import 'dart:developer';

import 'package:ayurved/core/constants/api_const.dart';
import 'package:ayurved/data/model/user/patient_list.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientsService {
  String url = ApiConst.patientListUrl;
  Dio dio = Dio();

  Future<List<PatientModel>?> patientsService() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          sendTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      );
      log('Patients Get Successgully');
      if (response.statusCode == 200) {
           final data = response.data['patient'] as List;
      log("Patients Found: ${data.length}");
      return data.map((e) => PatientModel.fromJson(e)).toList();
      }
    } catch (e) {
      log('patients Not Avalilable service');
      throw Exception('Patients Service Failed:$e');
    }
    return null;
  }
}
