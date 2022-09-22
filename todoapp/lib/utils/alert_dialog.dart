import 'package:flutter/material.dart';
import 'package:todoapp/utils/simple_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;

  VoidCallback onSave;
  VoidCallback onCancle;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade200,
      content: SizedBox(
        height: 120,
        child: Column(children: [
          //get user task
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Task",
                hintStyle: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleButton(
                text: "Save",
                onPressed: onSave,
              ),
              SimpleButton(
                text: "Cancle",
                onPressed: onCancle,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
