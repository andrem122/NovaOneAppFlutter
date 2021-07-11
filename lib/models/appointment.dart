import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Appointment extends Equatable {
  final int? id;
  final String name;
  final String phoneNumber;
  final DateTime time;
  final DateTime? created;
  final String timeZone;
  final bool confirmed;
  final int companyId;
  final String? unitType;
  final String? email;
  final String? dateOfBirth;
  final String? testType;
  final String? gender;
  final String? address;
  final String? city;
  final String? zip;

  Appointment(
      {this.id,
      required this.name,
      required this.phoneNumber,
      required this.time,
      this.created,
      required this.timeZone,
      required this.confirmed,
      required this.companyId,
      this.unitType,
      this.email,
      this.dateOfBirth,
      this.testType,
      this.gender,
      this.address,
      this.city,
      this.zip});

  factory Appointment.fromJson({required Map<String, dynamic> json}) {
    return Appointment(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      time: DateFormat("yyyy-MM-dd HH:mm:ss zzz")
          .parseUTC(json['time'])
          .toLocal(),
      created: DateFormat("yyyy-MM-dd HH:mm:ss zzz")
          .parseUTC(json['created'])
          .toLocal(),
      timeZone: json['timeZone'],
      confirmed: json['confirmed'],
      companyId: json['companyId'],
      unitType: json['unitType'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      testType: json['testType'],
      gender: json['gender'],
      address: json['address'],
      city: json['city'],
      zip: json['zip'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        time,
        created,
        timeZone,
        confirmed,
        companyId,
        unitType,
        email,
        dateOfBirth,
        testType,
        gender,
        address,
        city,
        zip
      ];
}
