import 'package:flutter/foundation.dart';

class Appointment {
  final int id;
  final String name;
  final String phoneNumber;
  final String time;
  final String created;
  final String timeZone;
  final bool confirmed;
  final int companyId;
  final String unitType;
  final String email;
  final String dateOfBirth;
  final String testType;
  final String gender;
  final String address;
  final String city;
  final String zip;

  Appointment(
      {this.id,
      @required this.name,
      @required this.phoneNumber,
      @required this.time,
      this.created,
      @required this.timeZone,
      @required this.confirmed,
      @required this.companyId,
      this.unitType,
      this.email,
      this.dateOfBirth,
      this.testType,
      this.gender,
      this.address,
      this.city,
      this.zip});
}
