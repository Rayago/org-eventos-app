import 'package:flutter/material.dart';

class ResetarForm extends StatelessWidget {
  const ResetarForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'E-mail',
          hintStyle: TextStyle(color: Color(0xff3f51b5)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3f51b5)))),
          ),
        );
  }
}