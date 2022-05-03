import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/reset_form_page.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/reset_password_page.dart';

import '../home/home_module.dart';
import 'presentation/view/login_page.dart';
import 'presentation/view/signup_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
        ChildRoute('/signup', child: (_, __) => const SignupPage()),
        ChildRoute('/reset-form', child: (_, __) =>const ResetFormPage()),
        ChildRoute('/reset-password', child: (_, __) => const ResetPasswordPage()),
        ModuleRoute('/home/', module: HomeModule())
      ];
}
