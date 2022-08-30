import 'package:flutter/material.dart';
import 'package:refri_mobile/const/colors.dart';
import 'package:refri_mobile/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => App(),
      '/refri': (context) => App(),
      '/recipe': (context) => App(),
      '/profile': (context) => App(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: PRIMARY_COLOR, fontFamily: 'NotoSans'),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'search',
      style: optionStyle,
    ),
    Text(
      'shop',
      style: optionStyle,
    ),
    Text(
      'box',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_search),
            label: 'image_search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'shopping_bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'inbox',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
