import 'package:expense_tracker/expenselog.dart';
import 'list_of_expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Expense Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController amtControl = TextEditingController();

  final TextEditingController titleControl = TextEditingController();

  String amount = '';

  String expense = '';

  final listOfExpenses = <Widget>[];

  ListExpenses le = ListExpenses();

  @override
  Widget build(BuildContext context) {
    // print(listOfExpenses);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: ((context, index) {
          return listOfExpenses[index];
        }),
        itemCount: listOfExpenses.length,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 8.0),
                        child: TextField(
                          controller: amtControl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 8.0),
                        child: TextField(
                          controller: titleControl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              amount = amtControl.text;
                              expense = titleControl.text;
                              Widget el = Expenselog(amount, expense);
                              le.addToLe(el, listOfExpenses);
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('submit')),
                    ],
                  ),
                );
              });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
