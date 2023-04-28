import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/data/model/job.dart';
import 'package:sira/data/services/firebase_api_services.dart';
import 'package:sira/view/screens/job_detail_page.dart';
import 'package:sira/view/widgets/applicant_count.dart';

class JobCard extends StatelessWidget {
  final String jobId;
  final String jobTitle;
  final String category;
  final String applicationDeadline;
  final String description;
  final String priceRange;
  final int applicantCount;
  final String dueDate;
  final String postedDate;
  final String postedBy;

  final String parentPage;

  const JobCard({
    super.key,
    required this.parentPage,
    required this.jobTitle,
    required this.category,
    required this.applicationDeadline,
    required this.description,
    required this.priceRange,
    required this.applicantCount,
    required this.jobId,
    required this.dueDate,
    required this.postedDate,
    required this.postedBy,
  });

  @override
  Widget build(BuildContext context) {
    final Job job = Job(
        jobId: jobId,
        jobTitle: jobTitle,
        priceLimit: priceRange,
        jobDescription: description,
        dueDate: dueDate,
        category: category,
        postedDate: postedDate,
        applicationDeadline: applicationDeadline,
        postedBy: postedBy,
        applicantCount: applicantCount);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        onTap: () async {
          if (parentPage == 'posted jobs') {
            Navigator.pushNamed(
              context,
              '/JobDetailPage',
              arguments: {'job': job},
            );
          } else if (parentPage == 'available jobs') {
            Navigator.pushNamed(
              context,
              '/JobApplicationpage',
              arguments: {'job': job},
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: CustomColors.cardColor,
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${this.jobTitle}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.blackTextColor),
                      color: CustomColors.backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '${this.category}',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              parentPage == "available jobs" || parentPage == "posted jobs"
                  ? Row(
                      children: [
                        Text(
                          "application-deadline".tr().toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${this.applicationDeadline}',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                            color: CustomColors.buttonBlueColor,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    '${this.description}',
                  ),
                ),
              ),
              Row(
                children: [
                  parentPage == "available jobs" || parentPage == "posted jobs"
                      ? Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "price-range".tr().toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${this.priceRange}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                  color: CustomColors.goldenColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  parentPage == "ongoing jobs"
                      ? Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("agreed-price".tr().toString()),
                              Text(
                                "3500",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                  color: CustomColors.goldenColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  parentPage == "available jobs" || parentPage == "posted jobs"
                      ? ApplicantCountWidget(applicantCount: applicantCount)
                      : Container(),
                  parentPage == "ongoing jobs"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Deadline: "),
                            Text(
                              "May 20, 2023",
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                                color: CustomColors.buttonBlueColor,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
