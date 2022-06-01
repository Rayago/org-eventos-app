import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:org_eventos_app/src/features/home/presentation/view/map_page.dart';
import 'package:org_eventos_app/src/features/home/presentation/view/place_widget.dart';
import 'dart:convert' show json, base64, ascii;
import 'package:http/http.dart' as http;
import 'package:org_eventos_app/main.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  late final String jwt;
  late final Map<String, dynamic> payload;
  HomePage(this.jwt, this.payload);
  
  factory HomePage.fromBase64(String jwt) =>
    HomePage(
      jwt,
      json.decode(
        ascii.decode(
          base64.decode(base64.normalize(jwt.split(".")[1]))
        )
      )
    );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  late final String jwt = Modular.get();
  late final Map<String, dynamic> payload = Modular.get();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    /* Text(
      'Index 0: Home',
      style: optionStyle,
    ), */
    const Text('index: 0'),
    PlaceWidget(),
    MapSample(),
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

  /*
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/auth/home/chat');
        },
        child: const Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
    */
    @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(title: Text("Secret Data Screen")),
      body: Center(
        child: FutureBuilder(
          future: http.read(Uri.parse('$SERVER_IP/data'), headers: {"Authorization": jwt}),
          builder: (context, snapshot) =>
            snapshot.hasData ?
            Column(children: <Widget>[
              Text("${payload['username']}, here's the data:"),
              Text(snapshot.data.toString(), style: Theme.of(context).textTheme.headline4)
            ],)
            :
            snapshot.hasError ? Text("An error occurred") : CircularProgressIndicator()
        ),
      ),
    );
  }

  
