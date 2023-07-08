import 'package:agried/models.dart';
import 'package:flutter/material.dart';

class StudentProfileCard extends StatelessWidget {
  StudentProfileCard({
    Key? key,
    required this.profileImage,
    required this.student,
    required this.onTap,
  }) : super(key: key);

  // Change this to NetworkImage once the API is done.
  final AssetImage profileImage;
  final Student student;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    CircleAvatar studentAvatar = CircleAvatar(
      backgroundColor: Colors.teal[400],
      radius: 42.0,
      child: CircleAvatar(
        backgroundImage: profileImage,
        radius: 40,
      ),
    );

    Column studentDetails = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          student.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          'Kelas ${student.className}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          student.major,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          student.school.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          'No: ${student.serialNo}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
      ],
    );

    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 150.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: new LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.orange,
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
                  Padding(
                    padding: EdgeInsets.all(
                      10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        studentAvatar,
                        SizedBox(
                          width: 20.0,
                        ),
                        studentDetails,
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage(
                                'assets/icons/clock.png',
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Next class',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                            Text(
                              'in 22 mins',
                              style: TextStyle(
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
        ));
  }
}
