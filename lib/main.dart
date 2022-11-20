import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/screens/home.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
  // open a box
  var box = await Hive.openBox('mybox');
  //await box.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
