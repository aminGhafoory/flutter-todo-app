import 'package:hive/hive.dart';

class ToDoDataBase {
  //refrence the box
  List taskList = [];
  final _hiveBox = Hive.box("todoapp");

  void createInitialData() {
    taskList = [
      ["wellcome", false],
      ["have Fun", false]
    ];
  }

  void loadData() {
    taskList = _hiveBox.get("TODOLIST");
  }

  void updateDataBase() {
    _hiveBox.put("TODOLIST", taskList);
  }
}
