import 'package:flutter/material.dart';
import 'package:agried_mobile/models.dart';

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({
    Key key,
    @required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget jobDescription = job.description.length == 1
        ? Text(job.description[0])
        : Column(
            children: job.description.map(
              (description) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('\u2022 '),
                    Expanded(
                      child: Text(description),
                    ),
                  ],
                );
              },
            ).toList(),
          );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            job.title,
          ),
          Text(job.company),
          Text('${job.location.city}, ${job.location.alphaCode}'),
          jobDescription
        ],
      ),
    );
  }
}
