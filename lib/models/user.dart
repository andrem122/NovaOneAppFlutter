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
      {this.id,
      this.userId,
      this.password,
      this.lastLogin,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.dateJoined,
      this.isPaying,
      this.wantsSms,
      this.wantsEmailNotifications,
      this.phoneNumber,
      this.customerType});

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
}
