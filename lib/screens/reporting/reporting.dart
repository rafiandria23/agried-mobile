import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:agried/screens.dart';
import 'package:flutter/services.dart';

class ReportingScreen extends StatefulWidget {
  ReportingScreen({Key key}) : super(key: key);

  static const String route = '/reporting';

  @override
  _ReportingScreenState createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  final List<String> moduleTitles = [
    'Module A',
    'Module B',
    'Module C',
    'Module D'
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController personalDetailsController =
      TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController moduleController = TextEditingController();
  final TextEditingController reportDetailsController = TextEditingController();

  String _personalDetails;
  String _schoolName;
  String _selectedModuleTitle;
  String _reportDetails;

  File _reportDocument;
  List<File> _reportImages;

  Future<void> _handleUploadDocument() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: [
        'pdf',
      ],
    );

    if (result != null) {
      File file = File(result.files.single.name);

      setState(() {
        _reportDocument = file;
      });
    } else {
      // User canceled the picker
    }
  }

  Future<void> _handleUploadImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: [
        'png',
        'jpg',
      ],
    );

    if (result != null) {
      List<File> files =
          result.files.map((PlatformFile file) => File(file.name)).toList();

      setState(() {
        _reportImages = files;
      });
    } else {
      // User canceled the picker
    }
  }

  void _toggleKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _handleSubmitReport() {}

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);

    Text title = Text(
      'IPB-TVET',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
    Text subtitle = Text(
      'Module Reporting',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

    AssetImage reportingImage =
        AssetImage('assets/images/reporting/reporting_image.png');

    TextFormField personalDetailsTextFormField = TextFormField(
      controller: personalDetailsController,
      decoration: InputDecoration(
        labelText: 'Personal Details',
        filled: true,
        isDense: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    TextFormField schoolNameTextFormField = TextFormField(
      controller: schoolNameController,
      decoration: InputDecoration(
        labelText: 'School Name',
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    DropdownButtonFormField<String> moduleDropdown =
        DropdownButtonFormField<String>(
      value: _selectedModuleTitle,
      items: moduleTitles
          .map((moduleTitle) => DropdownMenuItem<String>(
                value: moduleTitle,
                child: Text(moduleTitle),
              ))
          .toList(),
      isDense: true,
      decoration: InputDecoration(
        labelText: 'Report Module',
        errorStyle: TextStyle(
          color: Colors.redAccent,
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(),
      ),
      onChanged: (newSelectedModuleTitle) => setState(() {
        _selectedModuleTitle = newSelectedModuleTitle;
      }),
    );

    TextFormField reportDetailsTextFormField = TextFormField(
      maxLength: 3000,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLines: null,
      minLines: 10,
      controller: reportDetailsController,
      decoration: InputDecoration(
        labelText: 'Report Details',
        counterStyle: TextStyle(
          color: Colors.white,
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.multiline,
    );

    Text reportDocumentPath = _reportDocument != null
        ? Text(
            _reportDocument.absolute.path,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )
        : Text('');

    List<Text> reportImagePaths = _reportImages != null
        ? _reportImages
            .map((reportImage) => Text(
                  reportImage.absolute.path,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ))
            .toList()
        : <Text>[Text('')];

    return Scaffold(
      appBar: AppBar(
        title: Text('Reporting'),
      ),
      backgroundColor: Colors.blueGrey[800],
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _toggleKeyboard(context);
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 30,
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: reportingImage,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Image(
                    image: AssetImage(
                      'assets/icons/logo.png',
                    ),
                    height: 48.0,
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              title,
              subtitle,
              SizedBox(
                height: 25.0,
              ),
              TextButton(
                child: Text(
                  'Click here to complete online',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnlineReportingScreen(
                        reportURL:
                            'https://www.surveymonkey.com/r/TVET_Teacher_Activity_Report',
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 25.0,
              ),
              personalDetailsTextFormField,
              SizedBox(
                height: 20.0,
              ),
              schoolNameTextFormField,
              SizedBox(
                height: 20.0,
              ),
              moduleDropdown,
              SizedBox(
                height: 20.0,
              ),
              reportDetailsTextFormField,
              SizedBox(
                height: 10.0,
              ),
              TextButton.icon(
                icon: Icon(Icons.note_add),
                label: Text('Upload Document'.toUpperCase()),
                onPressed: _handleUploadDocument,
              ),
              SizedBox(
                height: 10.0,
              ),
              reportDocumentPath,
              SizedBox(
                height: 20.0,
              ),
              TextButton.icon(
                icon: Icon(Icons.add_a_photo_outlined),
                label: Text('Upload Images'.toUpperCase()),
                onPressed: _handleUploadImage,
              ),
              SizedBox(
                height: 10.0,
              ),
              ...reportImagePaths,
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 40.0,
                child: ElevatedButton(
                  onPressed: _handleSubmitReport,
                  child: Text(
                    'Finish'.toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
