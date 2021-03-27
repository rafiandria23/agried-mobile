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

  @override
  Widget build(BuildContext context) {
    List<SizedBox> shimmers = newsURLs
        .map((String newsURL) => SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(30.0),
              child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
                  'Shimmer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('News Updates'),
      ),
      body: Padding(
        padding:
            EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10.0)),
        child: ListView(
          children: loading && news.length == 0 ? shimmers : news,
        ),
      ),
    );
  }
}
