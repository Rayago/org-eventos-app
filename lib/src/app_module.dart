import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/auth/auth_module.dart';
import 'package:org_eventos_app/src/features/onboard/onboard_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: OnboardModule()),
        //ModuleRoute('/', module: OnboardModule()),
      ];
}