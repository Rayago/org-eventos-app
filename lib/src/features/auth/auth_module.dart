import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/auth/domain/usecase/login_usecase.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/page/reset_password_page.dart';
import 'package:org_eventos_app/src/features/auth/presentation/viewmodel/login_viewmodel.dart';

import '../home/home_module.dart';
import 'presentation/view/page/login_page.dart';
import 'presentation/view/page/signup_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => LoginUseCase()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
        ChildRoute('/signup', child: (_, __) => const SignupPage()),
        ChildRoute('/reset-password',
            child: (_, __) => const ResetPasswordPage()),
        ModuleRoute('/home/', module: HomeModule())
      ];
}
