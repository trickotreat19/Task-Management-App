// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:task_management/widgets/tiles.dart';

import 'list.dart';

class RecentView extends StatelessWidget {
  const RecentView(this.recentTasks,this.after7Days,{super.key});
  final recentTasks;
  final after7Days;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tiles(recentTasks),
        Lists(after7Days),
      ],
    );
  }
}