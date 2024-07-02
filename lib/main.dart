import 'package:flutter/material.dart';
import 'package:p1/model/item.dart';
import 'widget/card_body.dart';
import 'widget/model_bottom.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  void showData() {}

  final List<DataItems> items = [
    DataItems(id: "1", name: "Tap the duc"),
    DataItems(id: "2", name: "Boi loi"),
    DataItems(id: "3", name: "Lam viec"),
    DataItems(id: "4", name: "An trua"),
  ];

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CardBody(),
          ],
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
              return const ModelBottom();
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
