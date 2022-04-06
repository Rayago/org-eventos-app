import 'package:flutter/material.dart';
import 'package:org_eventos_app/telaLogin.dart';

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Criar conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Text(
                    'Já possui cadastro?',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => TelaLogin()),);
                    },
                    child: Text(
                      'Entrar',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}

class CadastroForm extends StatefulWidget {
  const CadastroForm({ Key? key }) : super(key: key);

  @override
  State<CadastroForm> createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Nome'),
        buildInputForm('Sobrenome'),
        buildInputForm('Telefone'),
        buildInputForm('Email'),
        buildInputForm('Senha'),
        buildInputForm('Confirme a senha'),
      ],
      
    );
  }

  Padding buildInputForm(String hint){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(decoration: InputDecoration(hintText: hint),),
    );
  }
}