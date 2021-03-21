extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

/// Checks if the password is at least 6 characters long and is alphanumeric
extension PasswordValidator on String {
  bool isValidPassword() {
    return this.length > 6 &&
        RegExp(".*[A-Za-z].*").hasMatch(this) &&
        RegExp(".*[0-9].*").hasMatch(this) &&
        RegExp("[A-Za-z0-9]*").hasMatch(this);
  }
}
