import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../dataStorage/database.dart';
import '../screens/displayDetail.dart';
import 'dialog_box.dart';

class ListTilee extends StatefulWidget {
  final String name, id;

  ListTilee({Key? key, required this.name, required this.id}) : super(key: key);

  @override
  State<ListTilee> createState() => _ListTileeState();
}

class _ListTileeState extends State<ListTilee> {
  @override
  Widget build(BuildContext context) {
    final _myBox = Hive.box('mybox');
    ToDoDataBase db = ToDoDataBase();

    final _ageController = TextEditingController();
    final _genderController = TextEditingController();
    final _signstatusController = TextEditingController();

    // Save Values
    void saveNewTask() {
      setState(() {
        _myBox.put(widget.id,
            [_ageController.text, _genderController.text, "Sign Out"]);
        print("Age is ${_ageController.text}");
        print("Gender is ${_genderController.text}");
        _ageController.clear();
        _genderController.clear();
      });
      print("Saved");
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(
                  namee: widget.name,
                  age: _myBox.get(widget.id)[0],
                  gender: _myBox.get(widget.id)[1])));
    }

    // Open Dialog Box if already not done.
    void createNewTask() {
      print(_myBox.get(widget.id));
      if (_myBox.get(widget.id) == null) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              ageController: _ageController,
              genderController: _genderController,
              onSave: saveNewTask,
              onCancel: () {
                Navigator.of(context).pop();
                _ageController.clear();
                _genderController.clear();
              },
            );
          },
        );
      }
    }

    void showDetail() {
      if (_myBox.get(widget.id) == null) {
        createNewTask();
      } else {
        if (_myBox.get(widget.id)[2] == "Sign Out") {
          setState(() {
            _myBox.put(widget.id, [
              _myBox.get(widget.id)[0],
              _myBox.get(widget.id)[1],
              "Sign In"
            ]);
          });
        } else {
          setState(() {
            _myBox.put(widget.id, [
              _myBox.get(widget.id)[0],
              _myBox.get(widget.id)[1],
              "Sign Out"
            ]);
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                      namee: widget.name,
                      age: _myBox.get(widget.id)[0],
                      gender: _myBox.get(widget.id)[1])));
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: ElevatedButton(
        // Open Dialog Box on Pressed
        onPressed: createNewTask,

        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Widget holding the name
              Text(
                widget.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              // Space Between
              const SizedBox(
                width: 20,
              ),

              // Sign - IN/OUT button
              ElevatedButton(
                  onPressed: showDetail,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400]),
                  child: Text(_myBox.get(widget.id) != null
                      ? _myBox.get(widget.id)[2]
                      : "Sign In")),
            ],
          ),
        ),
      ),
    );
  }
}
