import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
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
      drawer: Drawer(),
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
        title: Text("Posted Jobs"),
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
                    hintText: "Search",
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
          Navigator.pushNamed(context, '/AddJob'),
        },
        child: const Icon(Icons.add),
        tooltip: "Post a new job.",
      ),
    );
  }
}
