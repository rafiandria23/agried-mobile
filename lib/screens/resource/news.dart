import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:agried/components.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  static const String route = '/resources/news';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool loading = false;
  List<String> newsURLs = <String>[
    'https://finance.yahoo.com/news/global-farm-management-software-market-115300969.html?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAAAefq1swNWf2FtXdwi7mvXKdYny1x4k1z-uQJ2I0tX1QGbpgesC54o95PCKS_Z8QwHiRw8mT3Uy7Vn0_JUPYj_DjdTuNwB8Arw3XVGn_Jj8BjehXOEVtDRNVQF8cHNO_2cVZppPJ3LKL-pmC0BCdyxTFxyjUPza0aeOanToPq3p_',
    'https://www.worldbank.org/en/news/press-release/2021/03/09/world-bank-helps-bangladesh-improve-irrigation-based-agricultural-productivity',
    'https://www.freshplaza.com/article/9305758/pakistan-complete-ban-demanded-on-cutting-of-multan-mango-orchards',
    'https://www.thejakartapost.com/news/2020/01/22/indonesia-develops-cavendish-banana-plantations-in-blitar-to-boost-exports.html',
    'https://www.techrepublic.com/article/ai-and-robotics-are-helping-optimize-farms-to-increase-productivity-and-crop-yields/#:~:text=AI%20and%20robotics%20are%20helping%20optimize%20farms%20to%20increase%20productivity%20and%20crop%20yields,-by%20Mary%20Shacklett&text=One%20company%20built%20an%20autonomous,sensors%20to%20communicate%20with%20farmers.',
    'https://www.prnewswire.com/news-releases/global-agricultural-industry-m2miot-applications-market-report-2021-precision-agriculture-market-to-reach--3-7-billion-in-2025--301254817.html',
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

      List<Metadata> fetchedNewsMetadata = await Future.wait(newsURLs.map(
        (String newsURL) => extract(newsURL),
      ));

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
      body: ListView(
        padding: EdgeInsets.all(
          ResponsiveFlutter.of(context).moderateScale(10.0),
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: ResponsiveFlutter.of(context).moderateScale(16.0),
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
    );
  }
}
