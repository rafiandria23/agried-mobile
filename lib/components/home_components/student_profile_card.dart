import 'package:flutter/material.dart';
import 'package:agri_ed_mobile/models.dart';

class StudentProfileCard extends StatelessWidget {
  StudentProfileCard({
    Key key,
    @required this.profileImage,
    @required this.student,
    @required this.onTap,
  }) : super(key: key);

  // Change this to NetworkImage once the API is done.
  final AssetImage profileImage;
  final Student student;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    CircleAvatar studentAvatar = CircleAvatar(
      radius: 55,
      backgroundColor: Colors.blue,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: profileImage,
      ),
    );

    Column studentDetails = Column(
      children: <Widget>[],
    );

    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  children: <Widget>[studentAvatar, studentDetails],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
