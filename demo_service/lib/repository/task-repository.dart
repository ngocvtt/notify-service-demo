
import 'package:demo_service/model/status.dart';
import 'package:demo_service/model/task.dart';

class TaskRepository{

  Task finishTask(Task task){
    task.status = Status.DONE;
    return task;
  }

}