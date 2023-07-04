class Job {
  final String title;
  final String company;
  final JobLocation location;
  final List<String> description;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.description,
  });
}

class JobLocation {
  final String city;
  final String state;
  final String alphaCode;
  final int zipCode;

  JobLocation({
    required this.city,
    required this.state,
    required this.alphaCode,
    required this.zipCode,
  });
}
