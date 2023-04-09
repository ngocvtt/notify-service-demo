import 'status.dart';

class Task{
  String id;
  String title;
  String assignee;
  DateTime createdDate;
  DateTime dueDate;
  Status status;


  Task(this.id, this.title, this.assignee, this.createdDate, this.dueDate, this.status);
}