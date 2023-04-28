import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/data/services/firebase_api_services.dart';
import 'package:sira/view/widgets/drawer.dart';
import 'package:sira/view/widgets/job_card_widget.dart';

import '../../data/services/firebase_authentication.dart';

class PostedJobs extends StatefulWidget {
  const PostedJobs({super.key});

  @override
  State<PostedJobs> createState() => _PostedJobsState();
}

class _PostedJobsState extends State<PostedJobs> {
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
            onPressed: () => {
              Navigator.pushNamed(context, '/AvailableJobs'),
            },
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
        title: Text(
          "posted-jobs".tr().toString(),
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
                          .add(const PostedJobsFetchEvent());
                    } else {
                      BlocProvider.of<JobBlocBloc>(context).add(
                          SearchedJobsFetchEvent(
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
                    .add(PostedJobsFetchEvent());
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
                      parentPage: "posted jobs",
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
                      parentPage: "posted jobs",
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
              } else {
                // return Center(child: Text("error"));
                BlocProvider.of<JobBlocBloc>(context)
                    .add(const PostedJobsFetchEvent());
                return Container();
              }
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                Navigator.pushNamed(context, '/AddJobPage'),
              },
          child: const Icon(Icons.add),
          tooltip: "post-a-new-job".tr().toString()),
    );
  }
}
