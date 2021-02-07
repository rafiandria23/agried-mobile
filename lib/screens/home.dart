import 'package:flutter/material.dart';
import 'package:agried/models.dart';
import 'package:agried/components.dart';
import 'package:agried/screens.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Student _currentStudent = Student(
    id: 1,
    name: 'Siti Widjaya',
    className: '12B',
    major: 'ATPH',
    school: School(name: 'SMKN 2 Subang'),
    serialNo: 'S123876-e',
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> _homeCards = <Widget>[
      StudentProfileCard(
        profileImage: AssetImage('assets/dummies/student_profile_image.png'),
        student: _currentStudent,
        onTap: () {},
      ),
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
        backgroundImage: AssetImage('assets/images/modules_card_bg.png'),
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
        backgroundImage: AssetImage('assets/images/resources_card_bg.png'),
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
        backgroundImage: AssetImage('assets/images/reporting_card_bg.png'),
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
        backgroundImage: AssetImage('assets/images/private_sector_card_bg.png'),
        onTap: () {
          Navigator.pushNamed(
            context,
            PrivateSectorScreen.route,
          );
        },
      )
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(32.0),
            itemCount: _homeCards.length,
            itemBuilder: (BuildContext itemBuilderContext, int index) {
              return _homeCards[index];
            },
            separatorBuilder:
                (BuildContext separatorBuilderContext, int index) {
              return SizedBox(
                height: 10.0,
              );
            },
          ),
        ),
      ),
    );
  }
}
