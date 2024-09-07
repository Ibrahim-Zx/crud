// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonName;
  Function()? onPressed;
  Button({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.amber,
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }
}
