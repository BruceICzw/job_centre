class JobPost {
  final String title;
  final String link;
  final String description;
  final String? company;
  final String? location;
  final String? postedDate;

  JobPost({
    required this.title,
    required this.link,
    required this.description,
    this.company,
    this.location,
    this.postedDate,
  });
}
