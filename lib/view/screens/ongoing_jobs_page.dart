import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/job_card_widget.dart';

class OngoingJobs extends StatefulWidget {
  const OngoingJobs({super.key});

  @override
  State<OngoingJobs> createState() => _OngoingJobsState();
}

class _OngoingJobsState extends State<OngoingJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {},
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
        title: Text("ongoing-jobs".tr().toString()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              color: CustomColors.cardColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextField(
                  style: TextStyle(
                    color: CustomColors.fadedTextColor,
                    // fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "search".tr().toString(),
                    icon: Icon(
                      Icons.search_outlined,
                      size: 24,
                      color: CustomColors.blackTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              children: [
                // JobCard(
                //   parentPage: "ongoing jobs",
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
