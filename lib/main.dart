 import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/services/shared_service.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/page/login_page.dart';

import 'src/app_widget.dart';
import 'src/app_module.dart';

//Widget _defaultHome = const LoginPage();

void main()  async{
  //WidgetsFlutterBinding.ensureInitialized();

  //bool _result = await SharedService.isLoggedIn();
  //if(_result) {
    //Modular.to.pushNamed('/home/');
  //}

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
//git push -u origin estrutura