import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:org_eventos_app/src/features/auth/presentation/view/custom_button.dart';

import 'primary_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 162, 1),
        title: Text('signup'.i18n()),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Modular.to.navigate('/auth/');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'data-hint'.i18n(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),

            /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/auth/');
                    },
                    child: Text('back'.i18n(),
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ), */
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SignupForm(),
            ),

            const SizedBox(
              height: 20,
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(text: 'signup'.i18n(), where: '/auth/',),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _escondido = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Nome', false),
        buildInputForm('Sobrenome', false),
        buildInputForm('Telefone', false),
        buildInputForm('Email', false),
        buildInputForm('Senha', true),
        buildInputForm('Confirme a senha', true),
      ],
    );
  }

  Widget buildCadastrarBt() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5,
          onPressed: () => print('Botão de cadastrar pressionado'),
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.black,
          child: Text(
            'signup'.i18n(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Padding buildInputForm(String dica, bool senha) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: senha ? _escondido : false,
        decoration: InputDecoration(
          hintText: dica,
          hintStyle: const TextStyle(color: Colors.black),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: senha
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _escondido = !_escondido;
                    });
                  },
                  icon: _escondido
                      ? const Icon(Icons.visibility_off, color: Colors.black)
                      : const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
