import 'package:sira/data/model/user_model.dart';

class JobApplication {
  final String bidId;
  final String bidPrice;
  final String jobId;
  final String applicantId;
  final String whyYou;

  JobApplication({
    required this.bidId,
    required this.bidPrice,
    required this.jobId,
    required this.applicantId,
    required this.whyYou,
  });

  factory JobApplication.fromJson(Map<dynamic, dynamic> json) {
    return JobApplication(
      bidId: json["bidId"],
      bidPrice: json["bidPrice"],
      jobId: json["jobId"],
      applicantId: json["applicantId"],
      whyYou: json["whyYou"],
    );
  }

  JobApplication.fromSnapshot(snapshot)
      : bidId = snapshot.data()["bid-id"],
        bidPrice = snapshot.data()["bid-price"],
        jobId = snapshot.data()["job-id"],
        applicantId = snapshot.data()["applicant-id"],
        whyYou = snapshot.data()["why-you"];
}
