import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyCalculator(),
    );
  }
}

class CurrencyCalculator extends StatefulWidget {
  @override
  _CurrencyCalculatorState createState() => _CurrencyCalculatorState();
}

class _CurrencyCalculatorState extends State<CurrencyCalculator> {
  double result = 0.0;
  String inputText = '';

  void calculate() {
    setState(() {
      double usd = double.tryParse(inputText) ?? 0.0;
      result = usd * 89000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Calculator'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              setState(() {
                inputText = text;
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter USD',
            ),
          ),
          ElevatedButton(
            onPressed: calculate,
            child: Text('Convert'),
          ),
          Text(
            'LBP: ${result.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
