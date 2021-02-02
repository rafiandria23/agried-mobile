import 'package:flutter/material.dart';
import 'package:agri_ed_mobile/components/home_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<HomeCard> _homeCards = <HomeCard>[
    HomeCard(
      title: Text('Modules'),
      backgroundImage: AssetImage('assets/images/modules_card_bg.png'),
      onPressed: () {},
    ),
    HomeCard(
      title: Text('Resources'),
      backgroundImage: AssetImage('assets/images/resources_card_bg.png'),
      onPressed: () {},
    ),
    HomeCard(
      title: Text('Reporting'),
      backgroundImage: AssetImage('assets/images/reporting_card_bg.png'),
      onPressed: () {},
    ),
    HomeCard(
      title: Text('Private Sector'),
      backgroundImage: AssetImage('assets/images/private_sector_card_bg.png'),
      onPressed: () {},
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _homeCards,
        ),
      ),
    );
  }
}
