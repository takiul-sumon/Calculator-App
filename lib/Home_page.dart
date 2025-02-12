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
  List<Map<String, String>> res = [];
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
    addResult(num1, num2);
    print(res);
  }

  addResult(double num1, double num2) {
    if (num1 != 0 && num2 != 0) {
      res.add({
        '1': num1.toString(),
        '2': num2.toString(),
        '3': _output,
        '4': operator
      });
    }
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
          Row(children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.black,
                    context: context,
                    builder: (context) {
                      return ListView.builder(
                        itemCount: res.length,
                        itemBuilder: (context, index) {
                          final des = res[index];
                          print(des['2']);
                          return Row(
                            children: [
                              Text(
                                "History",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                des['1'].toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                des['4'].toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                des['2'].toString(),
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
                                des['3'].toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                icon: Icon(Icons.history))
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                num1.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
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
          SizedBox(
            height: 100,
          ),
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
