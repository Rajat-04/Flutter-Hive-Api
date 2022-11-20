import 'package:flutter/material.dart';

import 'button.dart';

class DialogBox extends StatelessWidget {
  final ageController;
  final genderController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.ageController,
    required this.genderController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get age input
            TextField(
              controller: ageController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Age",
              ),
            ),
            // get gender input
            TextField(
              controller: genderController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Gender",
              ),
            ),
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}