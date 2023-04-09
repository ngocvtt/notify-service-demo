import 'package:demo_service/model/status.dart';
import 'package:demo_service/model/task.dart';
import 'package:demo_service/repository/task-repository.dart';
import 'package:demo_service/service/slack-service.dart';
import 'package:demo_service/widget/task-card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Task task = Task(
    "1",
    "Research Flutter",
    "NgocVTT",
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 1)),
    Status.IN_PROGRESS,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TaskCard(task: task, onFinish: (){
                TaskRepository taskRepository = TaskRepository();
                setState(() {
                  task = taskRepository.finishTask(task);
                  SlackService.notifyFinishTask(task);
                });
              },),
            ],
          ),
        ),
      ),
    );
  }
}
