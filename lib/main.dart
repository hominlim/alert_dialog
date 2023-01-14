import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ingredient = "고추장";
  double cost = 2000;
  double weight = 100;
  String brand = "순창";

  void _alertDialog() {
    final ingredientController = TextEditingController(text: ingredient);
    final costController = TextEditingController(text: cost.toStringAsFixed(0));
    final weightController = TextEditingController(text: weight.toStringAsFixed(0));
    final brandController = TextEditingController(text: brand);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("재료입력"),
            content: Column(
              children: [
                TextField(
                  // keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "재료명"),
                  controller: ingredientController,
                  onChanged: (value) {
                    ingredient = value;
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "가격"),
                  controller: costController,
                  onChanged: (value) {
                    if (value == '') {
                    } else {
                      cost = double.parse(value);
                    }
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "중량"),
                  controller: weightController,
                  onChanged: (value) {
                    if (value == '') {
                    } else {
                      weight = double.parse(value);
                    }
                  },
                ),
                TextField(
                  // keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "브랜드"),
                  controller: brandController,
                  onChanged: (value) {
                    if (value == '') {
                    } else {
                      brand = value;
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("저장"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: _alertDialog,
        tooltip: 'alertDialog',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
