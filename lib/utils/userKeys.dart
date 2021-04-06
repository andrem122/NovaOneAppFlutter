/// Keys used to store values for the user
///
/// Follows the singleton pattern and properties can be accessed
/// by accessing the instance property in the class
class UserKeys {
  static final UserKeys instance = UserKeys._internal();
  UserKeys._internal();

  final String userLoggedIn = 'user_login_status';
  final String userPassword = 'user_password';
  final String userUserName = 'user_username';
}
