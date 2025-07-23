import 'package:flutter/material.dart';
import 'package:homework_5_3_2/componenta/date_card.dart';
import 'package:homework_5_3_2/consts/data.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import '../componenta/task_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final listController = ListController();
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  void init(){
    listController.addListener((){
      if(listController.visibleRange !=null){
        if((listController.visibleRange!.$1 !=currentIndex || listController.visibleRange!.$2 != currentIndex)&&
            (listController.visibleRange!.$1 == listController.visibleRange!.$2)){
          if(mounted){
            WidgetsBinding.instance
                .addPostFrameCallback((_) => setState(() {
              currentIndex = listController.visibleRange!.$1;
            }));
          }

        }
      }
    });
  }

  void animateToItem(int index) {
    listController.animateToItem(
      index: index,
      scrollController: scrollController,
      alignment: 0,
      duration: (estimatedDistance) => const Duration(seconds: 1),
      curve: (estimatedDistance) => Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: Color(0xFF111111),
        title: Text(
          "2023 October",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 28),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 100),
          child: Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return DateCard(
                  date: data[index].date,
                  isSelected: index == currentIndex,
                  onTap: () =>animateToItem(index),
                );
              },
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              sliver: SuperSliverList(
                listController: listController,
                delegate: SliverChildBuilderDelegate(childCount: data.length, (
                  context,
                  index,
                ) {
                  final dayTaskList = data[index];
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dayTaskList.tasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        title: dayTaskList.tasks[index].title,
                        deck: dayTaskList.tasks[index].deck,
                        startTime: dayTaskList.tasks[index].startTime,
                        endTime: dayTaskList.tasks[index].endTime,
                        color: colors[index%colors.length],
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

