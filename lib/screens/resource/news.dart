import 'package:agried/components.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:shimmer/shimmer.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key? key}) : super(key: key);

  static const String route = '/resources/news';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<String> newsURLs = <String>[
    'https://www.sciencenews.org/article/dry-farming-agriculture-climate-change',
    'https://www.sciencenews.org/article/food-climate-future-nutrition-millet-seaweed-cassava-mussels',
    'https://www.sciencenews.org/article/milk-cow-alternative-plant-based-taste-sustainability-nutrition',
    'https://www.sciencenews.org/article/soil-erosion-rate-us-midwest-unsustainable-usda',
    'https://www.sciencenews.org/article/cold-plasma-agriculture-sustainable-farms-fertilizer',
  ];

  Future<List<NewsCard?>> fetchNewsMetadata() async {
    List<Metadata?> fetchedNewsMetadata = await Future.wait(
      newsURLs.map(
        (String newsURL) => MetadataFetch.extract(newsURL),
      ),
    );

    return fetchedNewsMetadata
        .where(
          (Metadata? metadata) => metadata != null && metadata.hasAllMetadata,
        )
        .map(
          (Metadata? metadata) => NewsCard(
            title: metadata!.title!,
            description: metadata.description!,
            imageURL: metadata.image!,
            url: metadata.url!,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Updates'),
      ),
      body: ListView(
        padding: EdgeInsets.all(
            // ResponsiveFlutter.of(context).moderateScale(10.0),
            10.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                // bottom: ResponsiveFlutter.of(context).moderateScale(16.0),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage(
                    'assets/icons/logo.png',
                  ),
                  // height: ResponsiveFlutter.of(context).verticalScale(64.0),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: fetchNewsMetadata(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data,
                );
              }

              return Column(
                children: newsURLs
                    .map(
                      (String newsURL) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        enabled: true,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          child: Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
