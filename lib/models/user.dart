import 'package:equatable/equatable.dart';

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
      {required this.id,
      required this.userId,
      required this.password,
      required this.lastLogin,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.dateJoined,
      required this.isPaying,
      required this.wantsSms,
      required this.wantsEmailNotifications,
      required this.phoneNumber,
      required this.customerType});

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
  factory User.fromJson({required Map<String, dynamic> json}) {
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

  /// Converts the user object to a JSON map
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'password': password,
      'lastLogin': lastLogin,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dateJoined': dateJoined,
      'isPaying': isPaying,
      'wantsSms': wantsSms,
      'wantsEmailNotifications': wantsEmailNotifications,
      'phoneNumber': phoneNumber,
      'customerType': customerType,
    };
  }
}
