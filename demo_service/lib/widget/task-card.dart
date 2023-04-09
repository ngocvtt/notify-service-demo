import 'package:demo_service/model/task.dart';
import 'package:demo_service/widget/status-cell.dart';
import 'package:flutter/material.dart';
import 'package:demo_service/model/status.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {

  final Task task;
  final Function onFinish;

  const TaskCard({Key? key, required this.task, required this.onFinish,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusCell(
                name: task.status.name,
                background: task.status.background,
                color: task.status.color,
              ),
              Text("ID - ${task.id}", style: const TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            height: 20,
            color: Colors.grey.shade400,
            thickness: 1,
          ),
          Text(task.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: _buildValueWithIcon(
                    iconData: Icons.person_outlined,
                    value: task.assignee),
              ),
              Flexible(
                flex: 6,
                child: _buildValueWithIcon(
                    iconData: Icons.date_range_outlined,
                    value: 'Due by: ${DateFormat('yyyy-MM-dd hh:mm').format(task.dueDate)}'),
              )
            ],
          ),
          const SizedBox(height: 20,),
          if (task.status == Status.IN_PROGRESS) Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: () => onFinish(),
              child: const Text("Finish"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildValueWithIcon(
      {required IconData iconData, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 20,
          color: Colors.grey.shade600,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
          ),
        )
      ],
    );
  }
}
