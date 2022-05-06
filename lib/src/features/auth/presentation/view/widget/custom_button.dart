import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String where;
  CustomButton({Key? key, required this.text, required this.where, Color? this.color, Color? this.textColor})
      : super(key: key);

  Color? color = Color.fromARGB(255, 0, 0, 162);
  Color? textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.navigate(where);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
