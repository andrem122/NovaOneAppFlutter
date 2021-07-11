import 'package:equatable/equatable.dart';

class Lead extends Equatable {
  final int? id;
  final String name;
  final String? phoneNumber;
  final String? email;
  final String dateOfInquiry;
  final String? renterBrand;
  final int companyId;
  final String? sentTextDate;
  final String? sentEmailDate;
  final bool filledOutForm;
  final bool madeAppointment;
  final String companyName;

  Lead(
      {this.id,
      required this.name,
      this.phoneNumber,
      this.email,
      required this.dateOfInquiry,
      this.renterBrand,
      required this.companyId,
      this.sentTextDate,
      this.sentEmailDate,
      required this.filledOutForm,
      required this.madeAppointment,
      required this.companyName});

  factory Lead.fromJson({required Map<String, dynamic> json}) {
    return Lead(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      dateOfInquiry: json['dateOfInquiry'],
      renterBrand: json['renterBrand'],
      companyId: json['companyId'],
      sentTextDate: json['sentTextDate'],
      sentEmailDate: json['sentEmailDate'],
      filledOutForm: json['filledOutForm'],
      madeAppointment: json['madeAppointment'],
      companyName: json['companyName'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        email,
        dateOfInquiry,
        renterBrand,
        companyId,
        sentTextDate,
        sentEmailDate,
        filledOutForm,
        madeAppointment,
        companyName
      ];
}
