import 'package:flutter/material.dart';
import 'package:p1/model/item.dart';
import 'widget/card_body.dart';
import 'widget/model_bottom.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showData() {}

  final List<DataItem> items = [];

  void _handleAddTask(String name) {
    final item = DataItem(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(item);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 119, 255),
        title: const Text(
          "ToDoList",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: items
              .map(
                (item) => CardBody(
                  index: items.indexOf(item),
                  item: item,
                  deleteTask: _handleDeleteTask,
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(0),
              ),
            ),
            backgroundColor: Colors.grey[400],
            isScrollControlled: true,
            builder: (BuildContext context) {
              return ModelBottom(addTask: _handleAddTask);
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 0, 119, 255),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
