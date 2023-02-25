import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../models/tasks.dart';

class Lists extends StatelessWidget {
  const Lists(this.after7DaysData, {super.key});
  final List<Tasks> after7DaysData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: after7DaysData.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(onTap: () {
              //task editing page
            },
              title: AutoSizeText(
                after7DaysData[index].title,
                style: const TextStyle(fontSize: 20),
                minFontSize: 16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(after7DaysData[index].subTasks.toString()),
            ),
          );
        },
      ),
    );
  }
}
