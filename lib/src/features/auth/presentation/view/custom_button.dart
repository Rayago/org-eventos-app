import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String where;
  const CustomButton({Key? key, required this.text, required this.where})
      : super(key: key);

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
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 0, 0, 162),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
