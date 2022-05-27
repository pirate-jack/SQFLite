import 'package:flutter/material.dart';
import 'Helper.dart';
import 'Student.dart';

class View extends StatefulWidget {
  const View({Key key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  List<Student> studentList = [];
  final Helper helper = Helper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: studentList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == studentList.length) {
              return RaisedButton(
                child: Text('Refresh'),
                onPressed: () {
                  setState(() {
                    _getAll();
                  });
                },
              );
            }
            return Container(
              height: 40,
              child: Center(
                child: Text(
                  '[${studentList[index].id}] ${studentList[index].name} - ${studentList[index].age} age',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _getAll() async {
    final all = await helper.getAlldata();
    studentList.clear();
    for (int i = 0; i < all.length; i++) {
      studentList.add(Student.fromMap(all[i]));
    }
  }
}
