import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.buttonText,
      required this.onTap,
      this.isSolidButton = true,
      this.buttonColor});
  final String? buttonText;
  final VoidCallback onTap;
  final bool isSolidButton;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSolidButton ? Colors.black : (buttonColor ?? Colors.white),
        ),
        child: Center(
          child: Text(
            buttonText ?? 'custom Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:
                  isSolidButton ? Colors.black : (buttonColor ?? Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
