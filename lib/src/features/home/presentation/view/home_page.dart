import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('titulo'),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Modular.to.navigate('/auth/');
          },
        ),
      ),
      /* body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('texto'),
          ],
        ),
      ), */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            label: "Red",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            label: "Green",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_3),
            label: "Blue",
          ),
        ],
      ),
    );
  }
}

      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/auth/');
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.keyboard_backspace),
        ) */