import 'package:flutter/material.dart';
import 'package:agri_ed_mobile/screens/home.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIdx = 0;

  List<Widget> _screenOptions = List<Widget>();

  @override
  void initState() {
    _screenOptions.add(HomeScreen());
    _screenOptions.add(HomeScreen());
    _screenOptions.add(HomeScreen());
    _screenOptions.add(HomeScreen());
    _screenOptions.add(HomeScreen());
    _screenOptions.add(HomeScreen());
    super.initState();
  }

  void _onItemTapped(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIdx),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon01.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon02.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon03.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon04.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon05.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/icon06.png')),
            label: '',
          ),
        ],
        currentIndex: _selectedIdx,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
