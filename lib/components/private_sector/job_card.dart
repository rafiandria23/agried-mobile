import 'package:agried/models.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget jobDescription = job.description.length == 1
        ? Text(
            job.description[0],
          )
        : Column(
            children: job.description.map(
              (description) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '\u2022 ',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              job.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              job.company,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '${job.location.city}, ${job.location.alphaCode}',
            ),
            SizedBox(
              height: 10.0,
            ),
            jobDescription
          ],
        ),
      ),
    );
  }
}
