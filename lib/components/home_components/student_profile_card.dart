import 'package:flutter/material.dart';
import 'package:agried_mobile/models.dart';

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
      backgroundColor: Colors.teal[400],
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
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          'Kelas ${student.className}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          student.major,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          student.school.name,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          'No: ${student.serialNo}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
      ],
    );

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: new LinearGradient(
              colors: [
                Colors.white,
                Colors.orange[700],
              ],
              begin: const FractionalOffset(0.1, 0.0),
              end: const FractionalOffset(1.2, 0.0),
              stops: [
                0.0,
                1.0,
              ],
              tileMode: TileMode.clamp,
            ),
          ),
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
                      width: 12.0,
                    ),
                    studentDetails,
                    SizedBox(
                      width: 36.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                            'assets/icons/clock.png',
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Next class',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        Text(
                          'in 22 mins',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
