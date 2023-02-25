import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:task_management/models/tasks.dart';

class DailyListView extends StatelessWidget {
  const DailyListView(this.dailyListView, {super.key});
  final List<Tasks> dailyListView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: dailyListView.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 7,
                    child: ListTile(
                      title: AutoSizeText(
                        dailyListView[index].title,
                        style: const TextStyle(fontSize: 20),
                        minFontSize: 16,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: AutoSizeText(
                        dailyListView[index].subTasks.toString(),
                        style: const TextStyle(fontSize: 18),
                        minFontSize: 10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
