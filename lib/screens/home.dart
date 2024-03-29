import 'package:agried/components.dart';
import 'package:agried/models.dart';
import 'package:agried/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

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

  final List<Module> _modules = <Module>[
    Module(
      moduleTitle: 'Module A',
      title:
          'An introduction to Precision Agriculture for Indonesia Rice Cultivation',
      images: <AssetImage>[
        AssetImage('assets/images/modules/a/module_a_image.png'),
      ],
      content:
          "Precision Agriculture (PA) is now a term used throughout agricultural systems worldwide, but what is meant by Precision Agriculture?\n\nThis introductory module provides a background to the evolution of PA, the principle philosophy and goals of a PA management strategy and some of the steps required to adopt PA in cropping systems.\n\nIt provides a stepping stone to subsequent modules in this series that will investigate the theories technologies and methodologies behind the adoption of PA within grain production systems in Indonesia.",
    ),
    Module(
      moduleTitle: 'Module B',
      title: 'Navigation Satellite Systems and Precision Agriculture',
      images: <AssetImage>[
        AssetImage('assets/images/modules/b/module_b_image.png'),
      ],
      content:
          "Global Navigation Satellite Systems and Precision Agriculture Satellite-based navigation systems are truly the enabling technology of Precision Agriculture (PA). They provide a relatively simple and robust technique for identifying any location on the Earth's surface, or, in the case of aircraft, relative to the surface.\n\nThis permits agricultural and environmental operation to be geo-referenced and spatially analysed. A wide range of satellite-based navigation and geo-location tools are available to suit different agronomic situations from point crop/soil sampling to autonomous vehicle guidance.",
    ),
    Module(
      moduleTitle: 'Module C',
      title: 'Yield Variability and Site-Specific Crop Management',
      images: <AssetImage>[
        AssetImage(
          'assets/images/modules/c/module_c_image.png',
        ),
      ],
      content:
          "There is a large list of important components of a farming operation for which it might be useful to have data on the extent of variability. For some, such as fertiliser quality, farmers rely on outside companies to minimise the variation and so 'remove' the need for substantial 'on-farm' management.\n\nOthers, such as crop yield, soil properties and pest and disease outbreaks, vary differently on each farm. Local knowledge about variability in these parts of the farming system can be used to build site-specific crop management (SSCM) strategies. SSCM can be used to identify and treat any areas where yield potential can be improved or better match input use to the natural yield potential across a field or farm.",
    ),
    Module(
      moduleTitle: 'Module D',
      title: 'Development Agriculture',
      images: <AssetImage>[
        AssetImage(
          'assets/images/modules/d/module_d_image_1.png',
        ),
        AssetImage(
          'assets/images/modules/d/module_d_image_2.png',
        ),
      ],
      content:
          "The Development Agriculture theme brings together researchers with vast experience and diverse expertise from across the Faculties and with other University of Sydney Centres, such as the Charles Perkins Centre, Sydney Southeast Asia Centre, and Marie Bashir Institute for Infectious Diseases and Biosecurity.\n\nThe goal of the Development Agriculture theme is to initiate and facilitate interdisciplinary collaborations by uniting researchers from multiple disciplines with expertise relating to agriculture and food in developing economies.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = <Widget>[
      Padding(
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image(
              image: AssetImage(
                'assets/icons/logo.png',
              ),
            ),
          ],
        ),
      ),
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
          ),
        ),
        backgroundImage: AssetImage('assets/images/home/modules_card_bg.png'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModuleScreen(
                modules: _modules,
                moduleIndex: 0,
              ),
            ),
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
          ),
        ),
        backgroundImage: AssetImage('assets/images/home/resources_card_bg.png'),
        onTap: () {
          Navigator.pushNamed(
            context,
            ResourceScreen.route,
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
          ),
        ),
        backgroundImage: AssetImage('assets/images/home/reporting_card_bg.png'),
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
          ),
        ),
        backgroundImage:
            AssetImage('assets/images/home/private_sector_card_bg.png'),
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView.separated(
            padding: EdgeInsets.all(
              8.0,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext itemBuilderContext, int index) {
              return items[index];
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
