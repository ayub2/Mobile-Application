import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

String ans = "";
List fruits = [
  '1. Carrots',
  '2. Apples',
  '3. Bananas',
  '4. Oranges',
  'Input Value between 1-4 to choose one of the fruits from the List'
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fruit List',
      home: MyListForm(),
    );
  }
}

class MyListForm extends StatefulWidget {
  const MyListForm({Key? key}) : super(key: key);

  @override
  _MyListFormState createState() => _MyListFormState();
}

class _MyListFormState extends State<MyListForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: new InputDecoration.collapsed(
              hintText: 'Input a number from 1 to 4'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              if (myController.text == '1') {
                ans = fruits[0];
              } else if (myController.text == '2') {
                ans = fruits[1];
              } else if (myController.text == '3') {
                ans = fruits[2];
              } else if (myController.text == '4') {
                ans = fruits[3];
              } else {
                ans = fruits[4];
              }
              return AlertDialog(
                content: Text(ans),
              );
            },
          );
        },
        tooltip: 'Show result',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
