import 'package:ayurved/core/constants/api_const.dart';
import 'package:ayurved/data/model/user/patient_list.dart';
import 'package:dio/dio.dart';

class PatientsService {
  String url =ApiConst.patientListUrl;
  Dio dio=Dio();

  Future<PatientModel?> patientsService()async{
    try {
      final response = await dio.get(url,options: Options(
        sendTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10)
      ));
      if (response.statusCode == 200) {
        return PatientModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Patients Service Failed:$e');
    }
    return null;
  }
}


