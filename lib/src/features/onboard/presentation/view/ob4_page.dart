import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Onboard4Page extends StatefulWidget {
  const Onboard4Page({ Key? key }) : super(key: key);

  @override
  State<Onboard4Page> createState() => _Onboard4PageState();
}

class _Onboard4PageState extends State<Onboard4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0000a2), //0000a2
      body: Column(
        children: [
          Image.asset(
            "lib/assets/images/pontos_turisticos.png",
            height: 250,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text(
                    "Busque por restaurantes, \npontos turísticos, etc.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                ),
              ),
              Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                ),
              ),
              Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                ),
              ),
              Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: FlatButton(
              child: const Text("Próximo"),
              onPressed: () {
                Modular.to.navigate('/auth/');
              },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}