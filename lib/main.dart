import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

import 'src/app_widget.dart';
import 'src/app_module.dart';

const String SERVER_IP = 'http://localhost:5000';
final storage = FlutterSecureStorage();

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
//git push -u origin estrutura