import 'package:flutter/material.dart';

import 'Helper.dart';

class Delete extends StatefulWidget {
  const Delete({Key key}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController sId = new TextEditingController();
  final Helper helper = Helper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: sId,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: " Id",
                labelText: " Id",
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  _delete(int.parse(sId.text));
                },
                child: Text("Delete"))
          ],
        ),
      ),
    );
  }
  void _delete(id) async {
    final deleteRow = await helper.delete(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("delete $deleteRow row($id)")));
  }
}
