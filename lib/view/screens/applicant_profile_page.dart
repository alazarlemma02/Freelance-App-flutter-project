import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';

class Applicantprofile extends StatefulWidget {
  const Applicantprofile({super.key});

  @override
  State<Applicantprofile> createState() => _ApplicantprofileState();
}

class _ApplicantprofileState extends State<Applicantprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.transparentColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: CustomColors.blackTextColor,),
        title: Text('Abebe',style: TextStyle(color:CustomColors.blackTextColor)),
      
        actions: [
          IconButton(onPressed: () {
          }, icon: Icon(Icons.person_outlined,color:CustomColors.blackTextColor ,),
          ),
           IconButton(onPressed: () {
          }, icon: Icon(Icons.notifications_outlined,color:CustomColors.blackTextColor),
          )
        ],
      ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0,MediaQuery.of(context).size.height * 0.1,20.0,20.0),
            child: Stack(
              children: [Container(
                decoration: BoxDecoration(
                   color:CustomColors.cardColor,
        
        borderRadius: BorderRadius.circular(16.0),
        ),
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height * 0.4,
                
               
                child: Column(children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(.0,10.0,8.0,0.0,),
                        child: Container(child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                    ),),
                ]),
            
              ),
                  Align(
              alignment: Alignment.topLeft,
            child: CircleAvatar(
              
              radius:MediaQuery.of(context).size.height * 0.1,
              backgroundColor:CustomColors.backgroundColor,
              child: Center(
          child: Icon(Icons.person,color:CustomColors.blackTextColor,size:MediaQuery.of(context).size.height * 0.1 , ),
              ),
            )
          ),
        
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          
        },
        child: Center(child: Icon(Icons.call,color:CustomColors.backgroundColor,)),
        backgroundColor: CustomColors.buttonBlueColor,
        ),
    );
  
  }
}