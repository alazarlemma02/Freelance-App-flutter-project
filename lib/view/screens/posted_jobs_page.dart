import 'package:flutter/material.dart';

class PostedJobs extends StatefulWidget {
  const PostedJobs({super.key});

  @override
  State<PostedJobs> createState() => _PostedJobsState();
}

class _PostedJobsState extends State<PostedJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 1, 1, 1),
        title: Text("Appbar"),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Icon(Icons.search),
                Text("Seatch"),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {}, child: const Icon(Icons.add)),
    );
  }
}
