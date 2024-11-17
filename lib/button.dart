import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String padNumber;
  final void Function() onTap;

  const Button({super.key, required this.padNumber, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(onPressed: onTap, child: Text(padNumber)));
  }
}
