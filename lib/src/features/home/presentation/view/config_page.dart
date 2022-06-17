import 'package:flutter/material.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/widget/custom_button.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Configuracoes',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 162, 1),
            ),
          ),
          Column(
            children: [
              ConfigWidget('Seguranca', Icon(Icons.security)),
              ConfigWidget('Privacidade', Icon(Icons.lock)),
              ConfigWidget('Notificacoes', Icon(Icons.notifications)),
              ConfigWidget('Ajuda', Icon(Icons.help)),
            ],
          ),
          CustomButton(
            text: 'Sair',
            where: '/auth/',
            color: Color.fromRGBO(0, 0, 162, 1),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget ConfigWidget(String name, Icon icon) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}