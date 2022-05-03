import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_module.dart';
import 'presentation/view/onboard_page.dart';

class OnboardModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => OnboardPage()),
        ModuleRoute('/auth', module: AuthModule())
      ];
}
