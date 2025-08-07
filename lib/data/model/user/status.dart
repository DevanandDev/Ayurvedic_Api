import 'package:ayurved/data/model/user/patient_list.dart';

class statusModel {
 
  bool? status;
  String? message;
  List<PatientModel>? patient;

  statusModel({this.status, this.message, this.patient});

  factory statusModel.fromJson(Map<String, dynamic> json) {
    return statusModel(
      status: json['status'],
      message: json['message'],
      patient: (json['patient'] as List?)?.map((e) => PatientModel.fromJson(e)).toList(),
    );
  }
}


