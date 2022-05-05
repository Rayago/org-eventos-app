import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/user.dart';

class LoginUseCase {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'email invalido';
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'senha invalida';
    }
    return null;
  }

  bool login(String username, String password) {
    return true;
  }
}
