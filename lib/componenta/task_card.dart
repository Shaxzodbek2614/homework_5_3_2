import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework_5_3_2/consts/data.dart';

class TaskCard extends StatelessWidget {
  String title;
  String deck;
  DateTime startTime;
  DateTime endTime;
  Color color;


  TaskCard({super.key, required this.title, required this.deck, required this.startTime, required this.endTime, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Container(width: 240,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),),
              Text(deck),
              SizedBox(height: 10,),
              Text("${time(startTime)} - ${time(endTime)}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 8,height: 8,decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4)
              ),),
              SizedBox(width: 8,),
              Text("${time(startTime)}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)

            ],
          ),
        )
      ],
    );
  }
}
