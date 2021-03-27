import 'package:flutter/material.dart';

class BlogsVlogsScreen extends StatefulWidget {
  BlogsVlogsScreen({Key key}) : super(key: key);

  static const String route = '/resources/blogs-vlogs';

  @override
  _BlogsVlogsScreenState createState() => _BlogsVlogsScreenState();
}

class _BlogsVlogsScreenState extends State<BlogsVlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs / Vlogs'),
      ),
    );
  }
}
