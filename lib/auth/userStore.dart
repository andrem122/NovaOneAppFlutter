import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novaone/utils/utils.dart';

/// A class to help us throw errors when items are not found in flutter secure storage
class MissingItemException implements Exception {
  final String message;
  const MissingItemException({@required this.message});

  @override
  String toString() {
    return 'MissingItemException: $message';
  }
}

class UserStore extends Equatable {
  final FlutterSecureStorage storage;

  UserStore({@required this.storage});

  /// Encrypts and store the user password on the device
  ///
  /// Takes in the [password] and [username] to store
  Future<void> storeCredentials(
      {@required String password, @required String username}) async {
    assert(password != null);
    assert(username != null);
    await storage.write(key: UserKeys.instance.userPassword, value: password);
    await storage.write(key: UserKeys.instance.userUserName, value: username);
  }

  /// Gets and decrypts the user's username stored in the device
  Future<String> getUsername() async {
    final String username =
        await storage.read(key: UserKeys.instance.userUserName);
    if (username == null) {
      throw MissingItemException(message: 'Username has not been stored');
    }

    return username;
  }

  /// Gets and decrypts the user's password stored in the device
  Future<String> getPassword() async {
    final String password =
        await storage.read(key: UserKeys.instance.userPassword);
    if (password == null) {
      throw MissingItemException(message: 'Password has not been stored');
    }

    return password;
  }

  /// Checks to see if the user has previously logged in and has credentials stored
  Future<bool> hasCredentials() async {
    final String password =
        await storage.read(key: UserKeys.instance.userPassword);
    final String username =
        await storage.read(key: UserKeys.instance.userUserName);

    return password != null && username != null;
  }

  @override
  List<Object> get props => [storage];
}
