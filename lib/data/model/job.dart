class Job {
  final int jobId;
  final String jobTitle;
  final String priceRange;
  final String jobDetail;
  final DateTime dueDate;
  final DateTime postedDate;

  const Job(
      {required this.jobId,
      required this.jobTitle,
      required this.priceRange,
      required this.jobDetail,
      required this.dueDate,
      required this.postedDate});

  factory Job.fromJson(Map<dynamic, dynamic> json) {
    return Job(
        jobId: json["jobId"],
        jobTitle: json["jobTitle"],
        priceRange: json["priceRange"],
        jobDetail: json["jobDetail"],
        dueDate: json["dueDate"],
        postedDate: json["postedDate"]);
  }
}
