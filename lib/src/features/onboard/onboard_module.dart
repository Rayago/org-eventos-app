import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_module.dart';
import 'presentation/view/onboard_page.dart';
import 'presentation/view/ob2_page.dart';
import 'presentation/view/ob3_page.dart';
import 'presentation/view/ob4_page.dart';

class OnboardModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const OnboardPage()),
        ChildRoute(
          '/ob-2',
          child: (_, __) => const OnboardPage2(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/ob-3',
          child: (_, __) => const Onboard3Page(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/ob-4',
          child: (_, __) => const Onboard4Page(),
          transition: TransitionType.rightToLeft,
        ),
        ModuleRoute('/auth', module: AuthModule())
      ];
}
