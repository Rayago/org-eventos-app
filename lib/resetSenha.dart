import 'package:flutter/material.dart';
import 'package:org_eventos_app/primaryButton.dart';
import 'package:org_eventos_app/resetarForm.dart';
import 'package:org_eventos_app/telaLogin.dart';

class ResetSenhaTela extends StatelessWidget {
  const ResetSenhaTela({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'Esqueci minha senha',
              style: TextStyle(
                color: Colors.black,
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
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ResetarForm(),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaLogin(),
                    ));
                },
                child: PrimaryButton(textoBt: 'Reiniciar senha'),
            ),
          ],
        )
      ),
    );
  }
}