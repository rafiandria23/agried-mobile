import 'package:flutter/material.dart';
import 'package:agried_mobile/screens.dart';

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
      initialRoute: LandingScreen.route,
      home: LandingScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SignInScreen.route:
            return MaterialPageRoute(builder: (_) => SignInScreen());

          case LandingScreen.route:
            return MaterialPageRoute(builder: (_) => LandingScreen());

          // case ModulesScreen.route:
          //   return MaterialPageRoute(builder: (_) => ModulesScreen());

          // Resource Routes
          case ResourceScreen.route:
            return MaterialPageRoute(
              builder: (_) => ResourceScreen(),
            );
          case CalculatorScreen.route:
            return MaterialPageRoute(
              builder: (_) => CalculatorScreen(),
            );
          case ProductivityScreen.route:
            return MaterialPageRoute(
              builder: (_) => ProductivityScreen(),
            );
          case NewsScreen.route:
            return MaterialPageRoute(
              builder: (_) => NewsScreen(),
            );
          case BlogsVlogsScreen.route:
            return MaterialPageRoute(
              builder: (_) => BlogsVlogsScreen(),
            );
          case KnowledgeSharingScreen.route:
            return MaterialPageRoute(
              builder: (_) => KnowledgeSharingScreen(),
            );

          case ReportingScreen.route:
            return MaterialPageRoute(builder: (_) => ReportingScreen());

          case PrivateSectorScreen.route:
            return MaterialPageRoute(builder: (_) => PrivateSectorScreen());

          default:
            return MaterialPageRoute(builder: (_) => SignInScreen());
        }
      },
    );
  }
}
