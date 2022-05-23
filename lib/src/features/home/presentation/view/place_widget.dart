import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        
        children: [
          Place("name 1", '1,6 km', 4.7),
          Place("name 2", '2,3 km', 4.6),
          Place("name 3", '4,1 km', 4.5),
          Place("name 4", '4,7 km', 4.2),
          Place("name 5", '2,3 km', 3.9),
          Place("name 6", '2,2 km', 3.8),
          Place("name 7", '1,9 km', 3.7),
          Place("name 8", '2,8 km', 3.6),
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
          padding: const EdgeInsets.all(8.0),
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
                              fontSize: 18, fontWeight: FontWeight.bold),
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
