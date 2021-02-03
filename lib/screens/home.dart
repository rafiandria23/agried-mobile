import 'package:flutter/material.dart';
import 'package:agri_ed_mobile/components.dart';
import 'package:agri_ed_mobile/screens.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<HomeCard> _homeCards = <HomeCard>[
      HomeCard(
        title: Text(
          'Modules'.toUpperCase(),
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundImage: Image(
          image: AssetImage('assets/images/modules_card_bg.png'),
          fit: BoxFit.fill,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            ModulesScreen.route,
          );
        },
      ),
      HomeCard(
        title: Text(
          'Resources'.toUpperCase(),
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundImage: Image(
          image: AssetImage('assets/images/resources_card_bg.png'),
          fit: BoxFit.fill,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            ResourcesScreen.route,
          );
        },
      ),
      HomeCard(
        title: Text(
          'Reporting'.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundImage: Image(
          image: AssetImage('assets/images/reporting_card_bg.png'),
          fit: BoxFit.fill,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            ReportingScreen.route,
          );
        },
      ),
      HomeCard(
        title: Text(
          'Private Sector'.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundImage: Image(
          image: AssetImage('assets/images/private_sector_card_bg.png'),
          fit: BoxFit.fill,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            PrivateSectorScreen.route,
          );
        },
      )
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(32.0),
          itemCount: _homeCards.length,
          itemBuilder: (BuildContext itemBuilderContext, int index) {
            return _homeCards[index];
          },
          separatorBuilder: (BuildContext separatorBuilderContext, int index) {
            return SizedBox(
              height: 10.0,
            );
          },
        ),
      ),
    );
  }
}
