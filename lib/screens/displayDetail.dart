import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  String namee, age, gender;
  Details(
      {Key? key, required this.namee, required this.age, required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Name : ${namee}",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Age : ${age}",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Gender : ${gender}",
                      style: TextStyle(fontSize: 24, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
