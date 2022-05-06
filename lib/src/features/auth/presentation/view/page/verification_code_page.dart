import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/widget/custom_button.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/widget/primary_button.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 162, 1),
        title: const Text('Redefinir senha'),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          onPressed: () {
            Modular.to.navigate('/auth/');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Insira seu e-mail e enviaremos um código de verificaçao para ele',
                style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 162, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email'.i18n(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email'.i18n(),
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Enviar',
                  where: '/auth/verification-code',
                  color: Color.fromARGB(255, 0, 0, 162),
                  textColor: Colors.white,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Codigo de verificacao',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'codigo de verificacao',
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Verificar',
                  where: '/auth/reset-password',
                  color: Color.fromRGBO(255, 213, 79, 1),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
