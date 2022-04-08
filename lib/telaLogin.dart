import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:org_eventos_app/resetSenha.dart';
import './telaCadastro.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() {
    return _TelaLoginState();
  }

}

class _TelaLoginState extends State<TelaLogin>{

  bool manterConectado = false;

  Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
      const Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
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
              offset: Offset(0,2),
            ),
          ],
        ),
        height: 60,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff3f51b5),
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black38,
            )
          ),
        ),
      ),
    ],
  );
}

Widget buildSenha(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
      const Text(
        'Senha',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
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
              offset: Offset(0,2),
            ),
          ],
        ),
        height: 60,
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff3f51b5),
            ),
            hintText: 'Senha',
            hintStyle: TextStyle(
              color: Colors.black38,
            )
          ),
        ),
      ),
    ],
  );
}

Widget buildEsqueciSenhaBt() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetSenhaTela()),),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.only(top: 20),
        ),
      child: const Text(
        'Esqueceu a senha?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildManterConectado(){
  return Container(
    height: 20,
    child: Row(
      children: <Widget> [
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: manterConectado,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value){
              setState(() {
                manterConectado = value!;
              });
            },
          ),
        ),
        const Text(
          'Manter conectado',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

  Widget buildLoginBt(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Botão de login pressionado'),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xff3f51b5),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }

  Widget buildCadastrarBt(){
    return GestureDetector(
      onTap: () {print("Botão de cadastrar pressionado"); 
                 Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadastro(),),);
                },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Ainda não possui uma conta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'Cadastrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
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
          child: Stack(
            children: <Widget>[
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
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      const Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height:50),
                      buildEmail(),
                      const SizedBox(height:20),
                      buildSenha(),
                      buildEsqueciSenhaBt(),
                      buildManterConectado(),
                      buildLoginBt(),
                      buildCadastrarBt(),
                    ],
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}