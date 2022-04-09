import 'package:flutter/material.dart';
import 'package:org_eventos_app/telaLogin.dart';
import 'package:org_eventos_app/telaCadastro.dart';

class PrimaryButton extends StatelessWidget {
  final String textoBt;
  PrimaryButton({required this.textoBt});
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), color: Color(0xff3f51b5),),
        child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Botão de cadastrar 2 pressionado'),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: const Color(0xff3f51b5),
        child: Text(
          textoBt,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }
}