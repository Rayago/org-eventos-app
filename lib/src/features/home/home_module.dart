import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/home/presentation/view/chat_page.dart';

import 'presentation/view/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        ChildRoute('/chat', child: (_, __) => const ChatPage()),
      ];
}