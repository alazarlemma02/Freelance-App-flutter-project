import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sira/bloc/applicants_bloc/bloc/applicants_bloc.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/posted_jobs_page.dart';
import 'package:sira/view/widgets/applicant_card.dart';
import 'package:sira/view/widgets/applicant_count.dart';
import 'package:sira/view/widgets/job_detail_card.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final applicants = arguments['applicants'];
    BlocProvider.of<ApplicantsBloc>(context)
        .add(FetchApplicants(jobId: arguments['job'].jobId));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: CustomColors.transparentColor,
        elevation: 0,
        title: Text(
          arguments['job'].jobTitle,
          style: TextStyle(
            color: CustomColors.blackTextColor,
            // fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            JobDetailCard(
              applicaitionDeadline: arguments['job'].applicationDeadline,
              category: arguments['job'].category,
              desctiption: arguments['job'].jobDescription,
              priceLimit: arguments['job'].priceLimit,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Applicants",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ApplicantCountWidget(
                    applicantCount: arguments['job'].applicantCount,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ApplicantsBloc, ApplicantsState>(
                builder: (context, state) {
                  if (state is ApplicantsInitial) {
                    BlocProvider.of<ApplicantsBloc>(context)
                        .add(FetchApplicants(jobId: arguments['job'].jobId));
                  }
                  if (state is ApplicantsLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: CustomColors.buttonBlueColor,
                    ));
                  }
                  if (state is ApplicantsSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.applicants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ApplicantCard(
                          applicantName: state.applicants[index].fullName,
                          applicantCategory: "Empty",
                          applicantBio:
                              state.applicants[index].aboutYourself.toString(),
                          applicantPhoneNumber:
                              state.applicants[index].phoneNumber,
                          applicantEmail: state.applicants[index].email,
                          profileImage:
                              state.applicantProfile[index].profileImage,
                        );
                      },
                    );
                  } else {
                    // print(state.toString());
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
