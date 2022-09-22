import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/pages/task_tile.dart';
import 'package:todoapp/utils/alert_dialog.dart';
import 'package:todoapp/utils/data_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    if (_hivebox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _hivebox = Hive.box("todoapp");
  ToDoDataBase db = ToDoDataBase();
  //text controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.taskList.add([_controller.text, false]);

      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void deleteTask(BuildContext context, int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateDataBase();
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancle: () {
              Navigator.of(context).pop();
            },
          );

          //taskList.add(["taskText", false]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addNewTask,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          title: const Text(
            "TO DO",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: db.taskList.length,
          itemBuilder: (context, index) {
            return TaskTile(
              taskText: db.taskList[index][0],
              taskDone: db.taskList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              deleteTask: (value) {
                deleteTask(value, index);
              },
            );
          },
        ));
  }
}
