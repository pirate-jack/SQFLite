import 'package:flutter/material.dart';
import 'package:sqf/Student.dart';

import 'Helper.dart';

class Update extends StatefulWidget {
  const Update({Key key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController SId = new TextEditingController();
  TextEditingController Sname = new TextEditingController();
  TextEditingController SAge = new TextEditingController();
  final Helper helper = Helper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: SId,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: " Id",
                labelText: " Id",
              ),
              textInputAction: TextInputAction.next,
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: Sname,
              decoration: InputDecoration(
                hintText: "Name",
                labelText: "Name",
              ),
              textInputAction: TextInputAction.next,
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: SAge,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Age",
                labelText: "Age",
              ),
              textInputAction: TextInputAction.done,
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                _update(int.parse(SId.text), Sname.text, int.parse(SAge.text));
              },
              child: Text("Update Student Details"),
            ),
          ],
        ),
      ),
    );
  }

  void _update(id, name, age) async {
    Student student = Student(id, name, age);
    final row = await helper.update(student);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("$row Updated")));
  }
}
