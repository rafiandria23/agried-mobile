import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried/screens.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageURL;
  final String url;

  NewsCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.imageURL,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OnlineNewsScreen(
              title: title,
              url: url,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.all(
            ResponsiveFlutter.of(context).moderateScale(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.0)),
                    ),
                    SizedBox(
                      height: ResponsiveFlutter.of(context).verticalScale(8.0),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: ResponsiveFlutter.of(context).moderateScale(16.0),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image.network(
                      imageURL,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
