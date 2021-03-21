import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final int id;
  final int userId;
  final String password;
  final String lastLogin;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String dateJoined;
  final bool isPaying;
  final bool wantsSms;
  final bool wantsEmailNotifications;
  final String phoneNumber;
  final String customerType;

  // Computed properties
  String get fullName {
    return '$firstName $lastName';
  }

  User(
      {@required this.id,
      @required this.userId,
      @required this.password,
      @required this.lastLogin,
      @required this.username,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.dateJoined,
      @required this.isPaying,
      @required this.wantsSms,
      @required this.wantsEmailNotifications,
      @required this.phoneNumber,
      @required this.customerType})
      : assert(id != null),
        assert(userId != null),
        assert(password != null),
        assert(lastLogin != null),
        assert(username != null),
        assert(firstName != null),
        assert(lastName != null),
        assert(email != null),
        assert(dateJoined != null),
        assert(isPaying != null),
        assert(wantsSms != null),
        assert(wantsEmailNotifications != null),
        assert(phoneNumber != null),
        assert(customerType != null);

  @override
  List<Object> get props => [
        id,
        userId,
        password,
        lastLogin,
        username,
        firstName,
        lastName,
        email,
        dateJoined,
        isPaying,
        wantsSms,
        wantsEmailNotifications,
        phoneNumber,
        customerType
      ];
  factory User.fromJson({@required Map<String, dynamic> json}) {
    assert(json != null);
    return User(
      id: json['id'],
      userId: json['userId'],
      password: json['password'],
      lastLogin: json['lastLogin'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      dateJoined: json['dateJoined'],
      isPaying: json['isPaying'],
      wantsSms: json['wantsSms'],
      wantsEmailNotifications: json['wantsEmailNotifications'],
      phoneNumber: json['phoneNumber'],
      customerType: json['customerType'],
    );
  }
}
