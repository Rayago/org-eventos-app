import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlaceWidget extends StatelessWidget {
  final String name;
  final String des;
  PlaceWidget({Key? key, required this.name, required this.des})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 162, 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(this.name),
              Text(this.des),
              Text(this.name),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
