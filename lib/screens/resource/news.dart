import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:agried_mobile/components.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  static const String route = '/resources/news';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool loading = false;
  List<String> newsURLs = <String>[
    'https://www.worldbank.org/en/news/press-release/2021/03/09/world-bank-helps-bangladesh-improve-irrigation-based-agricultural-productivity',
    'https://www.freshplaza.com/article/9305758/pakistan-complete-ban-demanded-on-cutting-of-multan-mango-orchards',
    'https://www.thejakartapost.com/news/2020/01/22/indonesia-develops-cavendish-banana-plantations-in-blitar-to-boost-exports.html',
  ];
  List<NewsCard> news = <NewsCard>[];

  @override
  void initState() {
    super.initState();
    this.fetchNewsMetadata();
  }

  void fetchNewsMetadata() async {
    try {
      setState(() {
        loading = true;
      });

      Iterable<Future<Metadata>> newsMetadata = newsURLs.map((String newsURL) {
        return extract(newsURL);
      });

      List<Metadata> fetchedNewsMetadata = await Future.wait(newsMetadata);

      setState(() {
        news = fetchedNewsMetadata
            .map(
              (Metadata metadata) => NewsCard(
                title: metadata.title,
                description: metadata.description,
                imageURL: metadata.image,
                url: metadata.url,
              ),
            )
            .toList();

        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });

      print(e);
    }
  }

  List<Widget> handleRender(BuildContext context) {
    if (loading && news.length == 0) {
      return newsURLs
          .map((String newsURL) => Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: loading,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: ResponsiveFlutter.of(context).moderateScale(16.0),
                  ),
                  child: Container(
                    height: ResponsiveFlutter.of(context).verticalScale(100.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ))
          .toList();
    } else {
      return news;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Updates'),
      ),
      body: Padding(
        padding:
            EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10.0)),
        child: ListView(
          children: <Widget>[
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
            ...handleRender(context),
          ],
        ),
      ),
    );
  }
}
