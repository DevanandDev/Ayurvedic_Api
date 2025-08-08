import 'package:ayurved/data/model/user/brach_model.dart';
import 'package:ayurved/data/model/user/details_model.dart';


class PatientModel {
  int? id;
  List<PatientDetailsModel>? patientdetailsSet; 
  BranchModel? branch;
  String? user;
  String? payment;
  String? name;
  String? phone;
  String? address;
  dynamic price;
  int? totalAmount;
  int? discountAmount;
  int? advanceAmount;
  int? balanceAmount;
  String? dateNdTime;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  PatientModel({
    this.id,
    this.patientdetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      patientdetailsSet: (json['patientdetails_set'] as List?)
          ?.map((e) => PatientDetailsModel.fromJson(e))
          .toList(),
      branch: json['branch'] != null
          ? BranchModel.fromJson(json['branch'])
          : null,
      user: json['user'],
      payment: json['payment'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      price: json['price'],
      totalAmount: json['total_amount'],
      discountAmount: json['discount_amount'],
      advanceAmount: json['advance_amount'],
      balanceAmount: json['balance_amount'],
      dateNdTime: json['date_nd_time'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
