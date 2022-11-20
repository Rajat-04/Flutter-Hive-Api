import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    _myBox.put('Id', ['Age','Gender','Status']);
  }

}