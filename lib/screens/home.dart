import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../dataStorage/database.dart';
import '../models/root.dart';
import '../widgets/dialog_box.dart';
import '../widgets/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // open a box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jsonData.json');
    Map<String, dynamic> map = jsonDecode(response)[0];
    var myRootNode = Root.fromJson(map);
    setState(() {
      _items = myRootNode.users as List;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.readJson();
    //this.firstTimeOpenHive();
    super.initState();
  }

  void firstTimeOpenHive() {
    if (_myBox.get("UsersData") == null) {
      db.createInitialData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "User List",
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              var name = _items[index]?.name;
              var id = _items[index]?.id;
              var atype = _items[index]?.name;
              return ListTilee(name: name, id: id);
            }),
      ),
    );
  }
}
