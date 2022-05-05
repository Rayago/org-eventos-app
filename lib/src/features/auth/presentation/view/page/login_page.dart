import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:org_eventos_app/src/features/auth/presentation/viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {
  bool manterConectado = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(
                Icons.email,
                color: Color(0xff3f51b5),
              ),
              hintText: 'email_hint'.i18n(),
              hintStyle: const TextStyle(
                color: Colors.black38,
              ),
              ////////
              errorText: store.error.email,
            ),
            onChanged: (value) {
              store.email = value;
            },
          ),
        ),
      ],
    );
  }

  Widget buildSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'password'.i18n(),
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xff3f51b5),
              ),
              hintText: 'password_hint'.i18n(),
              hintStyle: const TextStyle(
                color: Colors.black38,
              ),
              errorText: store.error.password,
            ),
            onChanged: (value) {
              store.email = value;
            },
          ),
        ),
      ],
    );
  }

  Widget buildEsqueciSenhaBt() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => ResetSenhaTela()),),
          Modular.to.pushNamed('/auth/reset-password');
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(top: 20),
        ),
        child: Text(
          'forgot_password'.i18n(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildManterConectado() {
    return SizedBox(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: manterConectado,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  manterConectado = value!;
                });
              },
            ),
          ),
          Text(
            'keep_connected'.i18n(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginBt() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          /* if (store.login() == true) {
            Modular.to.navigate('/auth/home/');
          }else{
            print('erro');
          } */
          Modular.to.navigate('/auth/home/');
        },
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'login'.i18n(),
          style: const TextStyle(
            color: Color(0xff3f51b5),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildCadastrarBt() {
    return GestureDetector(
      onTap: () {
        print("Botão de cadastrar pressionado");
        //Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadastro(),),);
        Modular.to.pushNamed('/auth/signup');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'no_account'.i18n(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'signup'.i18n(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x663f51b5),
                    Color(0x993f51b5),
                    Color(0xcc3f51b5),
                    Color(0xff3f51b5),
                    Color(0xff00000a2),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'login'.i18n(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    buildEmail(),
                    const SizedBox(height: 20),
                    buildSenha(),
                    buildEsqueciSenhaBt(),
                    buildManterConectado(),
                    buildLoginBt(),
                    buildCadastrarBt(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
