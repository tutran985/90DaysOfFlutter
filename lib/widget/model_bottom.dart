import 'package:flutter/material.dart';

class ModelBottom extends StatelessWidget {
  ModelBottom({
    super.key,
  });

  // lay gia tri trong o input textField
  // cach 1: use onChanged event
  String textValue = '';
  // cach 2: use TextEditingController and controller
  TextEditingController value = TextEditingController();
  void _handleOnClick() {
    // print(textValue);
    print(value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              // onChanged: (value) {
              //   textValue = value;
              // },
              controller: value,
              decoration: const InputDecoration(
                labelText: "Your task",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _handleOnClick,
                child: const Text("Add Task"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
