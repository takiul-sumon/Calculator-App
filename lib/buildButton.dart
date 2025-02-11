import 'package:flutter/material.dart';

class buildButton extends StatelessWidget {
  String text;
  Color? color;
  VoidCallback onClick;
  buildButton(
      {super.key, required this.text, required this.onClick,  this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onClick,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.grey[850],
              padding: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
