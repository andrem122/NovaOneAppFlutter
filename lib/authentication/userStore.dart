import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novaone/utils/utils.dart';

class UserStore extends Equatable {
  final storage;

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
