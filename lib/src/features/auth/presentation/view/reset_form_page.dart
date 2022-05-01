import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ResetFormPage extends StatelessWidget {
  const ResetFormPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'email'.i18n(),
          hintStyle: const TextStyle(color: Colors.black),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
          ),
        );
  }
}