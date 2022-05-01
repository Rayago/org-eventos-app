import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
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
            const SizedBox(
              height: 250,
            ),
            Text(
              'forgot_password'.i18n(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'email_hint'.i18n(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //ResetarForm(),
            const ResetFormPage(),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaLogin(),
                    )); */
                    Modular.to.pushNamed('/auth/');
                },
                child: PrimaryButton(textoBt: 'send'.i18n()),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaLogin(),
                    )); */
                    Modular.to.pushNamed('/auth/');
                },
                child: PrimaryButton(textoBt: 'back'.i18n()),
            ),
          ],
        )
      ),
    );
  }
}