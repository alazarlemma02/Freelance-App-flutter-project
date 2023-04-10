import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
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
        title: Text("Add a New Job"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Please be as concise and brief as possible.",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                ),
              ),
            ),
            TextField(
              style: TextStyle(
                color: CustomColors.fadedTextColor,
                // fontSize: 16,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Job Title",
              ),
            ),
            DropdownButton(
              items: const [
                DropdownMenuItem<String>(child: Text("One"), value: "1"),
                DropdownMenuItem<String>(child: Text("Two"), value: "2"),
              ],
              onChanged: (value) {},
              isExpanded: true,
            ),
            TextField(
              style: TextStyle(
                color: CustomColors.fadedTextColor,
                // fontSize: 16,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Application Deadline Date",
              ),
            ),
            TextField(
              style: TextStyle(
                color: CustomColors.fadedTextColor,
                // fontSize: 16,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Price Range",
              ),
            ),
            TextField(
              style: TextStyle(
                color: CustomColors.fadedTextColor,
                // fontSize: 16,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Description",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/'),
        },
        child: const Icon(Icons.check),
        tooltip: "Confirm.",
      ),
    );
  }
}
