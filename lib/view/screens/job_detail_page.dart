import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        actions: [
          IconButton(onPressed: () {
          }, icon: Icon(Icons.person_outline),
          ),
           IconButton(onPressed: () {
          }, icon: Icon(Icons.notifications_outlined,),
          )
        ],
      ),
    
    );
  }
}