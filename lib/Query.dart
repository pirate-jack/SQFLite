import 'package:flutter/material.dart';

import 'Helper.dart';
import 'Student.dart';

class Query extends StatefulWidget {
  const Query({Key key}) : super(key: key);
  @override
  State<Query> createState() => _QueryState();
}
class _QueryState extends State<Query> {
  final Helper helper = Helper.instance;
  List<Student> NameList = [];
  TextEditingController Name = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: Name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Student Name',
                  hintText: 'Student Name',
                ),
                onChanged: (text) {
                  if (text.length >= 2) {
                    setState(() {
                      _searchData(text);
                    });
                  } else {
                    setState(() {
                      NameList.clear();
                    });
                  }
                },
              ),
              height: 100,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: NameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    margin: EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                        '[${NameList[index].id}] ${NameList[index].name} - ${NameList[index].age} age',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _searchData(name) async {
    final serachData = await helper.search(name);
    NameList.clear();
    for (int i = 0; i < serachData.length; i++) {
      NameList.add(Student.fromMap(serachData[i]));
    }
  }
}
