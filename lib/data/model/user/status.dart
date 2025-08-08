import 'package:ayurved/data/model/user/patient_list.dart';

class StatusModel {
 
  bool? status;
  String? message;
  List<PatientModel>? patient;

  StatusModel({required this.status, this.message,required this.patient});

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      status: json['status'],
      message: json['message'],
      patient: (json['patient'] as List?)?.map((e) => PatientModel.fromJson(e)).toList(),
    );
  }
}


