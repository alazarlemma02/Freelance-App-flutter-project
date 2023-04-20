import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.transparentColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: CustomColors.blackTextColor,),
        title: Text('UI Designer',style: TextStyle(color:CustomColors.blackTextColor)),
      
        actions: [
          IconButton(onPressed: () {
          }, icon: Icon(Icons.person_outline,color:CustomColors.blackTextColor ,),
          ),
           IconButton(onPressed: () {
          }, icon: Icon(Icons.notifications_outlined,color:CustomColors.blackTextColor),
          )
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,15 ,20.0,20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            color:CustomColors.cardColor,
            child: Column(children: [
              Expanded(
                flex: 15,
                child: Container(
                  // color: Colors.green,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,10.0,8.0,0.0,),
                    child: Container(child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("price-range".tr().toString(),style: TextStyle(fontSize: 15),),
                      Text('Br 2500-400',style: TextStyle(fontSize: 15, color: CustomColors.goldenColor),),
                    ]),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: CustomColors.fadedTextColor,
                    width: 80,
                    height: 30,
                    child: TextButton(
                    
                    child: Text('Design',textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: CustomColors.blackTextColor),),
                    onPressed: () {
                    
                  },),),
                ]),),
              ),
              Expanded(flex:85,child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text('We are looking for an experienced UI designer. We are looking for an experienced UI designer. We are looking for an experienced UI designer. We are looking for an experienced UI designer.  '),),),
            ]),

          ),
        ),
    );
        
        
      
    
    
  }
}