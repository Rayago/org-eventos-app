import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class PlaceWidget extends StatefulWidget {
  const PlaceWidget({Key? key}) : super(key: key);

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  Future<void> fetch() async {
    var url = Uri.parse(
        'https://pdm-recommendation.herokuapp.com/get_recommendation/500');
    var response = await http.get(url);

    if (response.statusCode == 404) {
      setState(() {
        lista = [];
        size = 0;
      });
      return;
    }

    var json = jsonDecode(response.body);

    setSize(json['size']);

    setState(() {
      lista = [];
      for (int i = 0; i < size; i++) {
        lista.add(json['data'][i]);
      }
    });
  }

  List lista = [];

  int size = 0;

  setSize(int num) {
    size = num;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              fetch();
            },
            child: Container(
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: Text(
                'Buscar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(
                  height: 20,
                );
              }
              return Place(lista[index], 'distance', 5);
            },
            itemCount: size,
          )
        ],
      ),
    );
  }

  Widget Place(String name, String distance, double ratting) {
    return Container(
      height: 75,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color.fromRGBO(228, 228, 218, 1),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleImage(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Ratting(ratting),
                      ],
                    ),
                    Text(distance),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('lib/assets/images/mapa.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Ratting(double ratting) {
    return Row(
      children: [
        Image.asset('lib/assets/images/estrela.png', height: 12),
        Text(ratting.toString()),
      ],
    );
  }

  Widget CircleImage() {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(228, 228, 218, 1),
            width: 5,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          'lib/assets/images/catedral.jpg',
          height: 50,
        ),
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
