import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = '';
  String operator = '';
  double firstNumber = 0;
  double secondNumber = 0;

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        displayText = '';
        firstNumber = 0;
        secondNumber = 0;
        operator = '';
      } else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        firstNumber = double.tryParse(displayText) ?? 0;
        operator = value;
        displayText = '';
      } else if (value == '=') {
        secondNumber = double.tryParse(displayText) ?? 0;
        double result = 0;
        switch (operator) {
          case '+':
            result = firstNumber + secondNumber;
            break;
          case '-':
            result = firstNumber - secondNumber;
            break;
          case '×':
            result = firstNumber * secondNumber;
            break;
          case '÷':
            result = secondNumber != 0 ? firstNumber / secondNumber : 0;
            break;
        }
        displayText = result.toString();
        operator = '';
      } else {
        displayText += value;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(22),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Simple Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              buildButton('7', Colors.blue),
              buildButton('8', Colors.blue),
              buildButton('9', Colors.blue),
              buildButton('÷', Colors.orange),
            ],
          ),
          Row(
            children: [
              buildButton('4', Colors.green),
              buildButton('5', Colors.green),
              buildButton('6', Colors.green),
              buildButton('×', Colors.orange),
            ],
          ),
          Row(
            children: [
              buildButton('1', Colors.purple),
              buildButton('2', Colors.purple),
              buildButton('3', Colors.purple),
              buildButton('-', Colors.orange),
            ],
          ),
          Row(
            children: [
              buildButton('C', Colors.red),
              buildButton('0', Colors.purple),
              buildButton('=', Colors.teal),
              buildButton('+', Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
