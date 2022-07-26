import 'package:flutter/material.dart';
import 'package:sample_api/core/constents/colors/colors.dart';

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: buttonColor),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: blackColor),
      ),
    );
  }
}
