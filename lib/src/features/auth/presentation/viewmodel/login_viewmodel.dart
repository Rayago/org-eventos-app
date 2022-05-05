import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/usecase/login_usecase.dart';
// Include generated file
//part 'login_viewmodel.g.dart';

class LoginViewModel with Store {
  final error = LoginError();
  final _usecase = Modular.get<LoginUseCase>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  Future<bool> login() async {
    return true;
  }
}

class LoginError with Store {
  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => email != null || password != null;

  void clear() {
    email = null;
    password = null;
  }
}
