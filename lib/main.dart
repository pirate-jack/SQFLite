import 'package:flutter/material.dart';
import 'package:sqf/Delete.dart';
import 'package:sqf/Insert.dart';
import 'package:sqf/Query.dart';
import 'package:sqf/Update.dart';
import 'package:sqf/View.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowMaterialGrid: false,
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SQFLite"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: ("Insert"),
              ),
              Tab(
                text: ("View"),
              ),
              Tab(
                text: ("Query"),
              ),
              Tab(
                text: ("update"),
              ),
              Tab(
                text: ("Delete"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Insert(),
            View(),
            Query(),
            Update(),
            Delete(),
          ],
        ),
      ),
    );
  }
}
