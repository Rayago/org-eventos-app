import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/services.dart';
import 'package:org_eventos_app/src/features/home/presentation/view/chat_page.dart';
import '../auth/presentation/view/page/login_page.dart';
import 'presentation/view/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

const SERVER_IP = 'http://192.168.1.167:5000';
final storage = FlutterSecureStorage();

late final String jwt;
late final Map<String, dynamic> payload;

Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if(jwt == null) return "";
    return jwt;
}

abstract class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomePage(jwt, payload)),
        ChildRoute('/chat', child: (_, __) => const ChatPage()),
      ];
}