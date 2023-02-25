// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:task_management/widgets/recentView.dart';
import 'models/tasks.dart';
import 'widgets/dailyListView.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: _MyHomePage(),
      theme: ThemeData(
        colorScheme:
            ColorScheme.dark(onSecondary: Color.fromARGB(244, 255, 156, 43)),
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  // ignore: prefer_final_fields, unused_field
  final List<Tasks> _taskList = [
    Tasks(
        id: '1',
        title: 'Task1sadasdadsadadadaadaddasa',
        subTasks: ['SubTask1', 'Subtask2', 'subtask3', 'subtask4'],
        time: DateTime.now().add(Duration(days: 1))),
    Tasks(
        id: '2',
        title: 'Task2',
        subTasks: ['SubTask21', 'Subtask22', 'subtask23', 'subtask24'],
        time: DateTime.now().add(Duration(days: 2))),
    Tasks(
        id: '3',
        title: 'Task3',
        subTasks: ['SubTask31', 'Subtask32', 'subtask33', 'subtask34'],
        time: DateTime.now().add(Duration(days: 3))),
    Tasks(
        id: '4',
        title: 'Task4',
        subTasks: ['SubTask41', 'Subtask43', 'subtask43', 'subtask44'],
        time: DateTime.now().add(Duration(days: 4))),
    Tasks(
        id: '5',
        title: 'Task5',
        subTasks: ['SubTask51', 'Subtask52', 'subtask53', 'subtask54'],
        time: DateTime.now().add(Duration(days: 5))),
    Tasks(
        id: '6',
        title: 'Task6',
        subTasks: ['SubTask61', 'Subtask62', 'subtask63', 'subtask64'],
        time: DateTime.now().add(Duration(days: 6))),
    Tasks(
        id: '7',
        title: 'Task7',
        subTasks: ['SubTask71', 'Subtask72', 'subtask73', 'subtask74'],
        time: DateTime.now().add(Duration(days: 7))),
    Tasks(
        id: '8',
        title: 'Task8sdaasdasdasdsadadasdsadasdsadaddasdsasadsadasdsadasdsads',
        subTasks: ['SubTask81', 'Subtask82', 'subtask83', 'subtask84'],
        time: DateTime.now().add(Duration(days: 8))),
    Tasks(
        id: '9',
        title: 'Task9',
        subTasks: ['SubTask91', 'Subtask92', 'subtask93', 'subtask94'],
        time: DateTime.now().add(Duration(days: 9))),
  ];

  List<Tasks> get _recentTasks {
    return _taskList.where((task) {
      return task.time.isBefore(DateTime.now().add(Duration(days: 7)));
    }).toList();
  }

  List<Tasks> get _after7Days {
    return _taskList.where((task) {
      return task.time.isAfter(DateTime.now().add(Duration(days: 7)));
    }).toList();
  }

  List<Tasks> get _dailyListView {
    return _taskList.where((task) {
      return task.time.isBefore(DateTime.now().add(Duration(days: 1)));
    }).toList();
  }

  bool _showTasksList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // actions: [
          //   IconButton(onPressed: () {
          //     showSearch(context: context, delegate: CustomSearchDelegate())
          //   }, icon: Icon(Icons.search_outlined)),
          //   IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
          // ],
          title: Text('Profile'),
        ),
        body: Container(
          decoration: BoxDecoration(
            
                
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).scaffoldBackgroundColor
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                  width: double.infinity,
                  height: 70,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: RichText(
                      text: TextSpan(
                          text: 'Hi ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            TextSpan(
                                text: 'Prajwal,   \n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            TextSpan(
                                text: 'Welcome back',
                                style: TextStyle(
                                  fontSize: 12,
                                ))
                          ]),
                    ),
                  )),
              SizedBox(
                height: 52,
                width: 115,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'My Tasks',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 30,
                width: 100,
                child: Center(
                  child: Text(
                    _showTasksList ? 'Daily' : 'Recently',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Switch(
                  activeColor: Theme.of(context).colorScheme.onSecondary,
                  value: _showTasksList,
                  onChanged: (val) {
                    setState(() {
                      _showTasksList = val;
                    });
                  }),
              SizedBox(
                  height: 550,
                  child: _showTasksList
                      ? DailyListView(_dailyListView)
                      : RecentView(_recentTasks, _after7Days))
            ],
          ),
        ));
    ;
  }
}
