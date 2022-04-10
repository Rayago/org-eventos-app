import 'package:flutter/material.dart';
import 'package:org_eventos_app/primaryButton.dart';
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
                  fontSize: 22,
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
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                      style: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CadastroForm(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: PrimaryButton(textoBt: 'CADASTRAR'),
            ),
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

  Widget buildCadastrarBt(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Botão de cadastrar pressionado'),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: const Text(
          'CADASTRAR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }

  Padding buildInputForm(String dica, bool senha){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: senha ? _escondido : false ,
        decoration: InputDecoration(
          hintText: dica, 
          hintStyle: TextStyle(color: Color(0xFFfafafc)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFfafafc)),),
            suffixIcon: senha 
              ? IconButton(
                  onPressed: (){
                    setState(() {
                      _escondido = !_escondido;
                    });
                  }, 
                  icon: _escondido 
                  ? Icon(
                      Icons.visibility_off, 
                      color: Color(0xFFfafafc)) 
                      :Icon(
                        Icons.visibility,
                        color: Color(0xFFfafafc),
                        ),) 
              : null,
        ),
      ),);
  }
}