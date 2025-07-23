import 'package:flutter/material.dart';
import 'package:homework_5_3_2/consts/data.dart';

class DateCard extends StatelessWidget {

  final DateTime date;
  final bool isSelected;
  final Function()? onTap;


  const DateCard({super.key,  required this.date,  required this.isSelected,  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        margin: const EdgeInsets.only(left: 4, right: 4, bottom: 20),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffdf5529) : Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(8)
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(day(date),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            Text(weekDay(date),style: TextStyle(color: Colors.white,fontSize: 14),)
          ],
        ),
      ),
    );
  }
}
