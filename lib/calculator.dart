import 'package:flutter/material.dart';
import 'package:flutter_calculator/button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? firstOperand;
  String? operator;
  int? secondOperand;
  dynamic result;

  void numberTapped(int tappedNumber) {
    if (firstOperand == null) {
      setState(() {
        firstOperand = tappedNumber;
      });
    } else if (operator == null) {
      setState(() {
        firstOperand = int.parse('$firstOperand$tappedNumber');
      });
    } else {
      if (secondOperand == null) {
        setState(() {
          secondOperand = tappedNumber;
        });
      } else {
        setState(() {
          secondOperand = int.parse('$secondOperand$tappedNumber');
        });
      }
    }
  }

  void clearNumber() {
    setState(() {
      firstOperand = null;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  void operatorTapped(String tappedOperator) {
    setState(() {
      operator = tappedOperator;
    });
  }

  String showText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$firstOperand $operator $secondOperand';
    } else if (operator != null) {
      return '$firstOperand $operator';
    } else if (firstOperand != null) {
      return '$firstOperand';
    } else {
      return '0';
    }
  }

  void calculateResult() {
    if (firstOperand == null || secondOperand == null) return;
    switch (operator) {
      case '+':
        plusNumber();
      case '-':
        minusNumber();
      case 'x':
        multiplyNumber();
      case '÷':
        didveNumber();
      default:
        return;
    }
  }

  void plusNumber() {
    setState(() {
      result = firstOperand! + secondOperand!;
    });
  }

  void minusNumber() {
    setState(() {
      result = firstOperand! - secondOperand!;
    });
  }

  void multiplyNumber() {
    setState(() {
      result = firstOperand! * secondOperand!;
    });
  }

  void didveNumber() {
    setState(() {
      result = firstOperand! / secondOperand!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              showText(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Button(padNumber: '7', onTap: () => numberTapped(7)),
                Button(padNumber: '8', onTap: () => numberTapped(8)),
                Button(padNumber: '9', onTap: () => numberTapped(9)),
                Button(padNumber: '÷', onTap: () => operatorTapped('÷')),
              ],
            ),
            Row(
              children: [
                Button(padNumber: '4', onTap: () => numberTapped(4)),
                Button(padNumber: '5', onTap: () => numberTapped(5)),
                Button(padNumber: '6', onTap: () => numberTapped(6)),
                Button(padNumber: 'x', onTap: () => operatorTapped('x')),
              ],
            ),
            Row(
              children: [
                Button(padNumber: '1', onTap: () => numberTapped(1)),
                Button(padNumber: '2', onTap: () => numberTapped(2)),
                Button(padNumber: '3', onTap: () => numberTapped(3)),
                Button(padNumber: '-', onTap: () => operatorTapped('-')),
              ],
            ),
            Row(
              children: [
                Button(padNumber: 'C', onTap: clearNumber),
                Button(padNumber: '0', onTap: () => numberTapped(0)),
                Button(padNumber: '=', onTap: calculateResult),
                Button(padNumber: '+', onTap: () => operatorTapped('+')),
              ],
            )
          ],
        ));
  }
}
