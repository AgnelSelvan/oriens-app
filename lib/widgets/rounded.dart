import 'package:flutter/material.dart';

class RoundedPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const RoundedPrimaryButton({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          )),
      child: Text(title),
    );
  }
}
