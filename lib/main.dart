import 'package:cook_mate/screens/home.dart';
import 'package:cook_mate/screens/profile.dart';
import 'package:cook_mate/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:cook_mate/screens/splash_screen.dart';

void main() {
  runApp(const CookmateApp());
}

class CookmateApp extends StatelessWidget {
  const CookmateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.white,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: SplashScreen(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentindex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _children = <Widget>[
    HomePage(),
    SearchScreen(),
    Profile()
    ];

  void onTappedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _children.elementAt(_currentindex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Plan'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
          currentIndex: _currentindex,
          selectedItemColor: Colors.orange,
          onTap: onTappedBar,
        ));
  }
}
