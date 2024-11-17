import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text(
            '3+5',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
