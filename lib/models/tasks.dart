
class Tasks {
  final String id;
  final String title;
  final List<String> subTasks;
  
  final DateTime time;

  Tasks(
      {required this.id,
      required this.title,
      required this.subTasks,
      
      required this.time});
}
