import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried/models.dart';
import 'package:agried/components.dart';

class PrivateSectorScreen extends StatefulWidget {
  PrivateSectorScreen({Key key}) : super(key: key);

  static const String route = '/private_sector';

  @override
  _PrivateSectorScreenState createState() => _PrivateSectorScreenState();
}

class _PrivateSectorScreenState extends State<PrivateSectorScreen> {
  final List<Job> _jobs = <Job>[
    Job(
      title: '2021 Summer Internship - Horticulture/Agriculture',
      company: 'Costa Farms',
      location: JobLocation(
        city: 'Trenton',
        state: 'South Carolina',
        alphaCode: 'SC',
        zipCode: 08601,
      ),
      description: <String>[
        'Inspect and document the condition of all incoming young plants.',
        'Help scout for insects and diseases in their section.',
        'Training will be provided on the job.',
      ],
    ),
    Job(
      title: 'Farm Internship',
      company: 'Agrivision Farm Management',
      location: JobLocation(
        city: 'Hartley',
        state: 'Texas',
        alphaCode: 'TX',
        zipCode: 79044,
      ),
      description: <String>[
        'The farm internship is a paid internship that gives students the opportunity to assist.',
      ],
    ),
    Job(
      title: '2021 Summer Internship - Horticulture/Agriculture Major',
      company: 'Costa Farms',
      location: JobLocation(
        city: 'Trenton',
        state: 'South Caronlina',
        alphaCode: 'SC',
        zipCode: 08601,
      ),
      description: <String>[
        'Measure and record insect populations weekly.',
        'Plant, space, prune, and maintain trial crops as instructed by the R&D manager.',
      ],
    ),
    Job(
      title: '2021 Farm Internship Spring Creek Farm - Kellogg Campus',
      company: 'Alaska Pacific University',
      location: JobLocation(
        city: 'Anchorage',
        state: 'Alaska',
        alphaCode: 'AK',
        zipCode: 99508,
      ),
      description: <String>[
        'Interest in agriculture, sustainable food production, or food systems preferred.',
        'Interns will work full-time and participate fully in all aspects of organic.',
      ],
    ),
    Job(
      title: 'Intern, Research Farm Sustainable Agriculture',
      company: 'Nutrien Ltd.',
      location: JobLocation(
        city: 'Champaign',
        state: 'Illinois',
        alphaCode: 'IL',
        zipCode: 61820,
      ),
      description: <String>[
        'Provide assistance in research farm operation as it relates to plot work focused on sustainability.',
        'Assist the Sustainable Ag Agronomy Manager with projects.',
      ],
    ),
    Job(
      title: 'Intern - Agriculture Operations, Seasonal (Huron, SD)',
      company: 'Wilbur-Ellis Company',
      location: JobLocation(
        city: 'Huron',
        state: 'South Dakota',
        alphaCode: 'SD',
        zipCode: 57350,
      ),
      description: <String>[
        'Submit a final project, PowerPoint presentation of the internship.',
        'During our 12-16 week summer program, you will work closely with a mentor to support branch.',
      ],
    ),
    Job(
      title: 'Agriculture Internship and New Graduate Positions',
      company: 'Trimble',
      location: JobLocation(
        city: 'Westminster',
        state: 'Colorado',
        alphaCode: 'CO',
        zipCode: 80003,
      ),
      description: <String>[
        '1-year internship or work experience required.',
        'Qualified applicants will be pursuing an agriculture degree and have relevant knowledge and experience.',
      ],
    ),
  ];
  final List<Job> _filteredJobs = <Job>[];

  final GlobalKey<FormState> _filterFormKey = GlobalKey<FormState>();

  final TextEditingController whatController = TextEditingController();
  final TextEditingController whereController = TextEditingController();

  String whatQuery;
  String whereQuery;

  void _toggleKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _handleFilter() {}

  List<Widget> _renderJobList(BuildContext context) {
    if (_filteredJobs.isEmpty) {
      return [
        Text(
          'No jobs available.',
        ),
      ];
    } else {
      return _filteredJobs
          .map(
            (Job filteredJob) => JobCard(job: filteredJob),
          )
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _filteredJobs.clear();
      _filteredJobs.addAll(_jobs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Private Sector'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _toggleKeyboard(context);
        },
        child: ListView(
          padding: EdgeInsets.all(
            ResponsiveFlutter.of(context).moderateScale(12.0),
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(
                    'assets/icons/logo.png',
                  ),
                  height: ResponsiveFlutter.of(context).verticalScale(32.0),
                ),
              ],
            ),
            Text(
              'IPB-TVET',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              'Intern Job Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(16.0),
            ),
            Form(
              key: _filterFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: whatController,
                    decoration: InputDecoration(
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveFlutter.of(context)
                                  .moderateScale(8.0),
                            ),
                            child: Text(
                              'What',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      hintText: 'Agriculture Internship',
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(10.0),
                  ),
                  TextFormField(
                    controller: whereController,
                    decoration: InputDecoration(
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveFlutter.of(context)
                                  .moderateScale(8.0),
                            ),
                            child: Text(
                              'Where',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      hintText: 'City, state, zip code',
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(12.0),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(30.0),
                    child: ElevatedButton(
                      child: Text(
                        'Find',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _handleFilter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(16.0),
            ),
            ..._renderJobList(context),
          ],
        ),
      ),
    );
  }
}
