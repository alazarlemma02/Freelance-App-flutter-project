class Job {
  final String jobId;
  final String jobTitle;
  final String priceLimit;
  final String jobDescription;
  final String dueDate;
  final String category;
  final String postedDate;
  final String applicationDeadline;
  final String postedBy;

  const Job({
    required this.jobId,
    required this.jobTitle,
    required this.priceLimit,
    required this.jobDescription,
    required this.dueDate,
    required this.category,
    required this.postedDate,
    required this.applicationDeadline,
    required this.postedBy,
  });

  factory Job.fromJson(Map<dynamic, dynamic> json) {
    return Job(
      jobId: json["jobId"],
      jobTitle: json["jobTitle"],
      priceLimit: json["priceLimit"],
      jobDescription: json["jobDescription"],
      dueDate: json["dueDate"],
      postedDate: json["postedDate"],
      applicationDeadline: json["applicationDeadline"],
      category: json["category"],
      postedBy: json["postedBy"],
    );
  }

  Job.fromSnapshot(snapshot)
      : jobId = snapshot.data()['job-id'],
        jobTitle = snapshot.data()['job-title'],
        priceLimit = snapshot.data()['price-limit'],
        jobDescription = snapshot.data()['description'],
        dueDate = snapshot.data()['due-date'],
        postedDate = snapshot.data()['job-id'],
        applicationDeadline = snapshot.data()['application-deadline'],
        category = snapshot.data()['category'],
        postedBy = snapshot.data()['postedBy'];
}
