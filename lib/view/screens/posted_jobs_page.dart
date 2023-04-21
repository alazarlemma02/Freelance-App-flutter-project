import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/drawer.dart';
import 'package:sira/view/widgets/job_card_widget.dart';

class PostedJobs extends StatefulWidget {
  const PostedJobs({super.key});

  @override
  State<PostedJobs> createState() => _PostedJobsState();
}

class _PostedJobsState extends State<PostedJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
          // child: ,
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
        title: Text("posted-jobs".tr().toString()),
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              children: [
                JobCard(
                  parentPage: "posted jobs",
                ),
              ],
            ),
          ),
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
