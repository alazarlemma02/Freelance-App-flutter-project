import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/login_page.dart';
import 'package:sira/view/widgets/drawer.dart';
import 'package:sira/view/widgets/job_card_widget.dart';
import 'package:sira/view/widgets/logout_page.dart';

import '../../bloc/job_bloc_bloc.dart';

class AvailableJobs extends StatefulWidget {
  const AvailableJobs({super.key});

  @override
  State<AvailableJobs> createState() => _AvailableJobsState();
}

class _AvailableJobsState extends State<AvailableJobs> {
  final TextEditingController _searchtextCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        context: context,
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.history,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/MyProfilePage'),
            },
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
        title: Text(
          "available-jobs".tr().toString(),
          style: TextStyle(
            color: CustomColors.blackTextColor,
            // fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: CustomColors.cardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextField(
                  onChanged: (value) {
                    if (_searchtextCont.text.isEmpty) {
                      BlocProvider.of<JobBlocBloc>(context)
                          .add(const AvailableJobsFetchEvent());
                    } else {
                      BlocProvider.of<JobBlocBloc>(context).add(
                          AvailableSearchedJobsFetchEvent(
                              searchVal: _searchtextCont.text));
                    }
                  },
                  controller: _searchtextCont,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      size: 20,
                      Icons.search,
                      color: CustomColors.fadedTextColor,
                    ),
                    hintText: 'search'.tr()..toString(),
                    labelStyle: const TextStyle(
                      color: CustomColors.fadedTextColor,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: CustomColors.blackTextColor,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: CustomColors.blackTextColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: BlocBuilder<JobBlocBloc, JobBlocState>(
            builder: (context, state) {
              if (state is JobBlocInitial) {
                BlocProvider.of<JobBlocBloc>(context)
                    .add(AvailableJobsFetchEvent());
              }
              if (state is JobListBlocLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: CustomColors.buttonBlueColor,
                ));
              }
              if (state is JobListBlocSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.jobs.length,
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  itemBuilder: (context, index) {
                    return JobCard(
                      dueDate: state.jobs[index].dueDate,
                      postedBy: state.jobs[index].postedBy,
                      postedDate: state.jobs[index].postedDate,
                      jobId: state.jobs[index].jobId,
                      parentPage: "available jobs",
                      jobTitle: state.jobs[index].jobTitle,
                      applicationDeadline:
                          state.jobs[index].applicationDeadline,
                      category: state.jobs[index].category,
                      description: state.jobs[index].jobDescription,
                      priceRange: state.jobs[index].priceLimit,
                      applicantCount: state.jobs[index].applicantCount,
                    );
                  },
                );
              }
              if (state is JobSearchListBlocSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.jobs.length,
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  itemBuilder: (context, index) {
                    return JobCard(
                      dueDate: state.jobs[index].dueDate,
                      postedBy: state.jobs[index].postedBy,
                      postedDate: state.jobs[index].postedDate,
                      jobId: state.jobs[index].jobId,
                      parentPage: "available jobs",
                      jobTitle: state.jobs[index].jobTitle,
                      applicationDeadline:
                          state.jobs[index].applicationDeadline,
                      category: state.jobs[index].category,
                      description: state.jobs[index].jobDescription,
                      priceRange: state.jobs[index].priceLimit,
                      applicantCount: state.jobs[index].applicantCount,
                    );
                  },
                );
              }

              return Center(child: Text("error"));
            },
          )),
        ],
      ),
    );
  }
}
