import 'package:flutter/material.dart';
import 'package:agried/models.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          student.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Kelas ${student.className}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          student.major,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          student.school.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'No: ${student.serialNo}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return GestureDetector(
      child: Card(
        elevation: 0,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  studentAvatar,
                  SizedBox(
                    width: 24.0,
                  ),
                  studentDetails
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
