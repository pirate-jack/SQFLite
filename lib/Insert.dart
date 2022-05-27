import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Helper.dart';
import 'Student.dart';

class Insert extends StatefulWidget {
  const Insert({Key key}) : super(key: key);
  @override
  State<Insert> createState() => _InsertState();
}
class _InsertState extends State<Insert> {
  final Helper helper = Helper.instance;
  TextEditingController Name = new TextEditingController();
  TextEditingController Age = new TextEditingController();
  String NameError, AgeError;
  bool NameValidate, AgeValidate;
  @override
  void initState() {
    super.initState();
    NameValidate = AgeValidate = false;
    NameError = AgeError = "";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: Name,
              decoration: InputDecoration(
                hintText: " Name",
                labelText: " Name",
                  errorText: NameValidate ? NameError : null
              ),
              textInputAction: TextInputAction.next,
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: Age,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: " Age",
                labelText: " Age",
                errorText: AgeValidate ? AgeError : null
              ),
              textInputAction: TextInputAction.done,
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(onPressed: (){
              if(validate() == 0) {
                setState(() {
                  _insert(Name.text, int.parse(Age.text));
                });
              }
            }, child:Text(
              "Insert"
            ))
          ],
        ),
      ),
    );
  }
  void _insert(name, age) async {
    Map<String, dynamic> map = {Helper.colName: name, Helper.colAge: age};
    Student student = Student.fromMap(map);
    final int id = await helper.insert(student);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Row inserted $id")));
  }
  int validate() {
    int cnt = 0;
    if (Name.text.isEmpty) {
      setState(() {
        NameError = "Enter name";
        NameValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        NameError = "";
        NameValidate = false;
      });
    }
    if(Age.text.isEmpty){
      setState(() {
        AgeError = "Enter Age";
        AgeValidate = true;
      });
      cnt++;
    }
    else{
      setState(() {
        AgeError = "";
        AgeValidate = false;
      });
    }
    return cnt;
    }
}
