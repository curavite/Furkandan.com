import 'package:flutter/material.dart';
import 'package:flutter_full_learn/utils/customColors.dart';

class customTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  const customTextButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.textColor = CustomColors.textButtonColor});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
