import 'package:agri_ed_mobile/screens/landing.dart';
import 'package:flutter/material.dart';
import 'screens/signin.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriEd',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.comfortable,
      ),
      home: Navigator(
        initialRoute: '/SignInScreen',
        pages: <MaterialPage>[
          MaterialPage(
            key: ValueKey('SignInScreen'),
            child: SignInScreen(),
          ),
          MaterialPage(
            key: ValueKey('LandingScreen'),
            child: LandingScreen(),
          ),
        ],
      ),
    );
  }
}
