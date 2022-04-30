import 'package:flutter/material.dart';

class ResetFormPage extends StatelessWidget {
  const ResetFormPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'E-mail',
          hintStyle: TextStyle(color: Color(0xFFfafafc)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFfafafc)))),
          ),
        );
  }
}