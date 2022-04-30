import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/primary_button.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/reset_form_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'Esqueci minha senha',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Por favor, entre com seu e-mail',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //ResetarForm(),
            ResetFormPage(),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaLogin(),
                    )); */
                    Modular.to.pushNamed('/');
                },
                child: PrimaryButton(textoBt: 'ENVIAR'),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaLogin(),
                    )); */
                    Modular.to.pushNamed('/auth');
                },
                child: PrimaryButton(textoBt: 'VOLTAR'),
            ),
          ],
        )
      ),
    );
  }
}