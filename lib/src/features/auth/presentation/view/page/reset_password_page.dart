import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/widget/custom_button.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/widget/primary_button.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

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
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'email'.i18n(),
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                //child: PrimaryButton(textoBt: 'send'.i18n()),
                child: const CustomButton(
                  text: 'Entrar',
                  where: '/auth/',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(text: 'back'.i18n(), where: '/auth/'),
            ],
          )),
    );
  }
}
