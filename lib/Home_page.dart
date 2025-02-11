import 'package:calculator_app/buildButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _output = '0';
  String _input = '';
  String operator = '+';
  double num1 = 0;
  double num2 = 0;
  void buttonPressed(String button) {
    setState(() {
      if (button == 'c') {
        _output = '0';
        _input = '';
        operator = '+';
        num1 = 0;
        num2 = 0;
      } else if (button == "=") {
        num2 = double.parse(_input.toString());
        // num2 = double.parse(_output.toString());

        if (operator == '+') {
          _output = (num1 + num2).toString();
        } else if (operator == '-') {
          _output = (num1 - num2).toString();
        } else if (operator == 'x') {
          _output = (num1 * num2).toString();
        } else if (operator == '÷') {
          _output = (num2 != 0) ? (num1 / num2).toString() : 'Error';
        }
        _input = _output;
      } else if (['+', '-', 'x', '÷'].contains(button)) {
        num1 = double.parse(_input);
        operator = button;
        _input = '';
      } else {
        _input += button;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                num1.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                operator,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                num2.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '=',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                _output,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 100,),
          Row(
            children: [
              buildButton(
                text: '7',
                onClick: () => buttonPressed('7'),
              ),
              buildButton(
                text: '8',
                onClick: () => buttonPressed('8'),
              ),
              buildButton(
                text: '9',
                onClick: () => buttonPressed('9'),
              ),
              buildButton(
                text: '÷',
                onClick: () => buttonPressed('÷'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                text: '4',
                onClick: () => buttonPressed('4'),
              ),
              buildButton(
                text: '5',
                onClick: () => buttonPressed('5'),
              ),
              buildButton(
                text: '6',
                onClick: () => buttonPressed('6'),
              ),
              buildButton(
                text: 'x',
                onClick: () => buttonPressed('x'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                text: '1',
                onClick: () => buttonPressed('1'),
              ),
              buildButton(
                text: '2',
                onClick: () => buttonPressed('2'),
              ),
              buildButton(
                text: '3',
                onClick: () => buttonPressed('3'),
              ),
              buildButton(
                text: '-',
                onClick: () => buttonPressed('-'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                text: 'c',
                onClick: () => buttonPressed('c'),
                color: Colors.red,
              ),
              buildButton(
                text: '0',
                onClick: () => buttonPressed('0'),
              ),
              buildButton(
                text: '=',
                onClick: () => buttonPressed('='),
                color: Colors.green,
              ),
              buildButton(
                text: '+',
                onClick: () => buttonPressed('+'),
                color: Colors.orange,
              ),
              buildButton(
                text: '.',
                onClick: () => buttonPressed('.'),
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
    );
  }
}
