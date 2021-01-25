import 'package:flutter/foundation.dart';

class Lead {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String dateOfInquiry;
  final String renterBrand;
  final int companyId;
  final String sentTextDate;
  final String sentEmailDate;
  final bool filledOutForm;
  final bool madeAppointment;
  final String companyName;

  Lead(
      {this.id,
      @required this.name,
      this.phoneNumber,
      this.email,
      @required this.dateOfInquiry,
      this.renterBrand,
      @required this.companyId,
      this.sentTextDate,
      this.sentEmailDate,
      @required this.filledOutForm,
      @required this.madeAppointment,
      @required this.companyName});
}
