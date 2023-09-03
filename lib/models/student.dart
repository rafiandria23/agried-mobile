import 'package:agried/models.dart';

class Student {
  final int id;
  final String name;
  final String className;
  final School school;
  final String major;
  final String serialNo;

  Student({
    required this.id,
    required this.name,
    required this.className,
    required this.school,
    required this.major,
    required this.serialNo,
  });
}
