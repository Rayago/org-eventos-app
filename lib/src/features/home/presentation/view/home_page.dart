import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/home/presentation/view/place_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    /* Text(
      'Index 0: Home',
      style: optionStyle,
    ), */
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          PlaceWidget(name: 'name 1', des: 'description 1'),
          PlaceWidget(name: 'name 2', des: 'description 2'),
          PlaceWidget(name: 'name 3', des: 'description 3'),
          PlaceWidget(name: 'name 4', des: 'description 4'),
          PlaceWidget(name: 'name 5', des: 'description 5'),
          PlaceWidget(name: 'name 6', des: 'description 6'),
          PlaceWidget(name: 'name 7', des: 'description 7'),
          PlaceWidget(name: 'name 8', des: 'description 8'),
          PlaceWidget(name: 'name 9', des: 'description 9'),
          ],
      ),
    ),
    Text(
      'Index 1: search',
      style: optionStyle,
    ),
    const Text(
      'Index 2: maps',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color background_color = Color.fromRGBO(0, 0, 162, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 162, 1),
        title: const Text('Home Page'),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          onPressed: () {
            Modular.to.navigate('/auth/');
          },
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: background_color,
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: background_color,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Maps',
            backgroundColor: background_color,
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            backgroundColor: background_color,
            activeIcon: Icon(Icons.settings),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(255, 213, 79, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
