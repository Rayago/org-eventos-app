import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/auth/auth_module.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}