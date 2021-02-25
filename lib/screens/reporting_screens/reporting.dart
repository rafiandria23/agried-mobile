import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
  String _selectedModule;
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
      File file = File(result.files.single.path);

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
          result.files.map((PlatformFile file) => File(file.path)).toList();

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

    Text title = Text('IPB-TVET');
    Text subtitle = Text('Module Reporting');

    AssetImage reportingImage =
        AssetImage('assets/images/reporting/reporting_image.png');

    TextFormField personalDetailsTextFormField = TextFormField(
      autofocus: true,
      controller: personalDetailsController,
      decoration: InputDecoration(
        hintText: 'Personal Details',
        hintStyle: TextStyle(fontSize: 16.0),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    TextFormField schoolNameTextFormField = TextFormField(
      controller: schoolNameController,
      decoration: InputDecoration(
        hintText: 'Name of School',
        hintStyle: TextStyle(
          fontSize: 16.0,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    FormField<String> moduleFormField = FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontSize: 16.0,
            ),
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontSize: 16.0,
            ),
            hintText: 'Select Report Module',
            border: OutlineInputBorder(),
          ),
          isEmpty: _selectedModule == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedModule,
              isDense: true,
              onChanged: (String newSelectedModule) {
                setState(() {
                  _selectedModule = newSelectedModule;
                  state.didChange(newSelectedModule);
                });
              },
              items: moduleTitles.map((String moduleTitle) {
                return DropdownMenuItem<String>(
                  value: moduleTitle,
                  child: Text(moduleTitle),
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    TextFormField reportDetailsTextFormField = TextFormField(
      maxLength: 3000,
      maxLengthEnforced: true,
      maxLines: null,
      controller: reportDetailsController,
      decoration: InputDecoration(
        hintText: 'Report Details',
        hintStyle: TextStyle(
          fontSize: 16.0,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.multiline,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Reporting'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _toggleKeyboard(context);
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: reportingImage,
                  ),
                ],
              ),
              title,
              subtitle,
              personalDetailsTextFormField,
              SizedBox(
                height: 20.0,
              ),
              schoolNameTextFormField,
              SizedBox(
                height: 20.0,
              ),
              moduleFormField,
              SizedBox(
                height: 20.0,
              ),
              reportDetailsTextFormField,
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                child: Text('UPLOAD PDF'),
                onPressed: _handleUploadDocument,
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                child: Text('UPLOAD PNG'),
                onPressed: _handleUploadImage,
              ),
              SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
