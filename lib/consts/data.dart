import 'dart:ui';

import 'package:homework_5_3_2/models/day_tasks.dart';
import 'package:homework_5_3_2/models/task.dart';
import 'package:intl/intl.dart';

final data = [
  for(int i = 1;i<=30;i++)
    DayTasks(
        date: DateTime(2023,10,i),
        tasks: [
          Task(
            title: "Daily sync",
            deck: "To discuss with team all work processes for the today",
            startTime: DateTime(2023,10,i,9),
            endTime: DateTime(2023,10,i,10,30)
          ),
          Task(
            title: "UX Wireframes design",
            deck: "Make 10 Wireframes for a mobile fitness app.Need to show th basic functionality of the screens and the layout of the elements",
            startTime: DateTime(2023,10,i,10,30),
            endTime: DateTime(2023,10,i,13,30)
          ),
          Task(
              title: "Dribble shots",
              deck: "Make 10 shots for Dribble on any topic",
              startTime: DateTime(2023,10,i,13,30),
              endTime: DateTime(2023,10,i,18)
          ),
          Task(
              title: "Logo design",
              deck: "Create 4 versions of a logo for TBD task management app",
              startTime: DateTime(2023,10,i,16),
              endTime: DateTime(2023,10,i,20)
          ),
        ]
    )

];

String day(DateTime dateTime){
  return DateFormat.d().format(dateTime);
}

String weekDay(DateTime dateTime){
  return DateFormat.E().format(dateTime);
}

String time(DateTime dateTime){
  return DateFormat.jmv().format(dateTime);
}

final List<Color> colors = [
  Color(0xFFF4DDC1),
  Color(0xFFC1E8F4),
  Color(0xFFF0C6F7),
  Color(0xFFC1F4C9),
];