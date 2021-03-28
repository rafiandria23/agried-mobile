import 'package:flutter/material.dart';
import 'package:agried/screens.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void initState() {
    super.initState();
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(settings: settings, builder: (context) => builder);
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.route:
        return _buildRoute(
          settings,
          SignInScreen(),
        );

      case LandingScreen.route:
        return _buildRoute(
          settings,
          LandingScreen(),
        );

      // case ModulesScreen.route:
      //   return MaterialPageRoute(builder: (_) => ModulesScreen());

      // Resource Routes
      case ResourceScreen.route:
        return _buildRoute(
          settings,
          ResourceScreen(),
        );
      case CalculatorScreen.route:
        return _buildRoute(
          settings,
          CalculatorScreen(),
        );
      case CalculatorFertilizerGradeSelector.route:
        return _buildRoute(
          settings,
          CalculatorFertilizerGradeSelector(),
        );
      case CalculationScreen.route:
        return _buildRoute(
          settings,
          CalculationScreen(),
        );
      case ProductivityScreen.route:
        return _buildRoute(
          settings,
          ProductivityScreen(),
        );
      case NewsScreen.route:
        return _buildRoute(
          settings,
          NewsScreen(),
        );
      case BlogsVlogsScreen.route:
        return _buildRoute(
          settings,
          BlogsVlogsScreen(),
        );
      case KnowledgeSharingScreen.route:
        return _buildRoute(
          settings,
          KnowledgeSharingScreen(),
        );

      case ReportingScreen.route:
        return _buildRoute(
          settings,
          ReportingScreen(),
        );

      case PrivateSectorScreen.route:
        return _buildRoute(
          settings,
          PrivateSectorScreen(),
        );

      default:
        return _buildRoute(
          settings,
          SignInScreen(),
        );
    }
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
      onGenerateRoute: _getRoute,
    );
  }
}
