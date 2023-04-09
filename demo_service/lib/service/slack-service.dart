import 'dart:convert';

import 'package:demo_service/model/task.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

const _webhookUrl = "https://hooks.slack.com/services/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";


class SlackService{

  static void notifyFinishTask(Task task){
    
    Map<String, dynamic> message = {
      "blocks": [
        {
          "type": "header",
          "text": {
            "type": "plain_text",
            "text": "ID: ${task.id} - \"${task.title}\" has been finished",
            "emoji": true
          }
        },
        {
          "type": "section",
          "fields": [
            {
              "type": "mrkdwn",
              "text": "*Status:*\n${task.status.name}"
            },
            {
              "type": "mrkdwn",
              "text": "*Assignee:*\n${task.assignee}"
            }
          ]
        },
        {
          "type": "section",
          "fields": [
            {
              "type": "mrkdwn",
              "text": "*Created At:*\n${DateFormat('yyyy-MM-dd hh:mm').format(task.createdDate)}"
            },
            {
              "type": "mrkdwn",
              "text": "*Due Date:*\n${DateFormat('yyyy-MM-dd hh:mm').format(task.dueDate)}"
            }
          ]
        }
      ]
    };

    _postMessage(message);
  }

  static Future<void> _postMessage(Map<String, dynamic> message) async {

    Uri url = Uri.parse(_webhookUrl);

    try{
      post(url, body: jsonEncode(message));
    }
    catch (e){
      print(e);
    }
  }

}