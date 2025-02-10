import 'package:calculator_app/buildButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void buttonPressed(String button) {
    setState(() {});
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
        children: [
          Row(
            children: [
              buildButton(
                text: '7',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '8',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '9',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '÷',
                onClick: buttonPressed.toString,
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                text: '4',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '5',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '6',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: 'x',
                onClick: buttonPressed.toString,
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                text: '1',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '2',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '3',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '-',
                onClick: buttonPressed.toString,
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                text: 'c',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '0',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '=',
                onClick: buttonPressed.toString,
              ),
              buildButton(
                text: '+',
                onClick: buttonPressed.toString,
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
    );
  }
}
