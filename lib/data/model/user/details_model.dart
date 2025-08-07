
class PatientDetailsModel {
  int? id;
  String? male;
  String? female;
  int? patient;
  dynamic treatment;
  String? treatmentName;

  PatientDetailsModel({
    this.id,
    this.male,
    this.female,
    this.patient,
    this.treatment,
    this.treatmentName,
  });

  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) {
    return PatientDetailsModel(
      id: json['id'],
      male: json['male'],
      female: json['female'],
      patient: json['patient'],
      treatment: json['treatment'],
      treatmentName: json['treatment_name'],
    );
  }
}