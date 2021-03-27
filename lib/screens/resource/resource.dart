import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried_mobile/components.dart';
import 'package:agried_mobile/screens.dart';

class ResourceScreen extends StatefulWidget {
  ResourceScreen({Key key}) : super(key: key);

  static const String route = '/resources';

  @override
  _ResourceScreenState createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = <Widget>[
      Padding(
        padding: EdgeInsets.only(
          bottom: ResponsiveFlutter.of(context).moderateScale(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(
                'assets/icons/logo.png',
              ),
              height: ResponsiveFlutter.of(context).verticalScale(64.0),
            ),
          ],
        ),
      ),
      ResourceCard(
        title: Text(
          'Calculators'.toUpperCase(),
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
          ),
        ),
        backgroundImage: AssetImage(
          'assets/images/resources/calculator_card_bg.png',
        ),
        onTap: () {
          Navigator.pushNamed(context, CalculatorScreen.route);
        },
      ),
      ResourceCard(
        title: Text(
          'Productivity'.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveFlutter.of(context).fontSize(3.0)),
        ),
        backgroundImage: AssetImage(
          'assets/images/resources/productivity_card_bg.png',
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductivityScreen.route,
          );
        },
      ),
      ResourceCard(
        title: Text(
          'News Updates'.toUpperCase(),
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveFlutter.of(context).fontSize(3.0)),
        ),
        backgroundImage: AssetImage(
          'assets/images/resources/news_updates_card_bg.png',
        ),
        onTap: () {
          Navigator.pushNamed(context, NewsScreen.route);
        },
      ),
      ResourceCard(
        title: Text(
          'Blogs / Vlogs'.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveFlutter.of(context).fontSize(3.0)),
        ),
        backgroundImage: AssetImage(
          'assets/images/resources/blogs_vlogs_card_bg.png',
        ),
        onTap: () {
          Navigator.pushNamed(context, BlogsVlogsScreen.route);
        },
      ),
      ResourceCard(
        title: Text(
          'Knowledge Sharing'.toUpperCase(),
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.7)),
        ),
        backgroundImage: AssetImage(
          'assets/images/resources/knowledge_sharing_card_bg.png',
        ),
        onTap: () {
          Navigator.pushNamed(context, KnowledgeSharingScreen.route);
        },
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Resources'),
        ),
        body: SafeArea(
          child: ListView.separated(
            padding: EdgeInsets.all(
              ResponsiveFlutter.of(context).moderateScale(8.0),
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext itemBuilderContext, int index) {
              return items[index];
            },
            separatorBuilder:
                (BuildContext separatorBuilderContext, int index) {
              return SizedBox(
                height: ResponsiveFlutter.of(context).verticalScale(8.0),
              );
            },
          ),
        ));
  }
}
