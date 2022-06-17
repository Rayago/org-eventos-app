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
        title: Text('reset_password'.i18n()),
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
            Text(
              'verification_hint'.i18n(),
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 162, 1),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Email'.i18n(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email'.i18n(),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            CustomButton(
              text: 'send'.i18n(),
              where: '/auth/verify',
              color: Color.fromARGB(255, 0, 0, 162),
              textColor: Colors.white,
            ),
            Text(
              'verification_code'.i18n(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'verification_code'.i18n(),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock)
              ),
            ),
            CustomButton(
              text: 'verify'.i18n(),
              where: '/auth/reset',
              color: Color.fromRGBO(255, 213, 79, 1),
            ),
          ],
        ),
      ),
    );
  }
}
