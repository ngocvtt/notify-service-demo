import 'package:flutter/material.dart';

enum Status{
  TODO,
  IN_PROGRESS,
  DONE
}

extension StatusExt on Status{
  String get name {
    switch (this) {
      case Status.TODO:
        return "To do";
      case Status.IN_PROGRESS:
        return "In progress";
      case Status.DONE:
        return "Done";
    }
  }

  Color get color{
    return Colors.white;
  }

  Color get background{
    switch (this) {
      case Status.TODO:
        return Colors.blueAccent;
      case Status.IN_PROGRESS:
        return Colors.orangeAccent;
      case Status.DONE:
        return Colors.green;
    }
  }

}
