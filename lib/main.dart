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
      title: 'UTip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personalCount = 1;

  void increment() {
    setState(() {
      _personalCount++;
    });
  }

  void decrement() {
    setState(() {
      if (_personalCount > 1) {
        _personalCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Text("UTip")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(19),
            child: Column(
              children: [
                Text("Total per Person", style: style),
                Text(
                  "20.00 Rs.",
                  style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall!.fontSize,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: BoxBorder.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: "Bill Amount",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print("Value is $value");
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: theme.textTheme.labelMedium),

                      Row(
                        children: [
                          IconButton(
                            color: theme.colorScheme.primary,
                            onPressed: decrement,
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            "$_personalCount",
                            style: theme.textTheme.titleMedium,
                          ),
                          IconButton(
                            color: theme.colorScheme.primary,
                            onPressed: increment,
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
