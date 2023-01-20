import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final IconData icon;
  final bool iconOnRight;
  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.title,
    required this.icon,
    this.iconOnRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 65, 148, 67)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
        child: Row(
          children: [
            if (!iconOnRight)
              Icon(
                icon,
                size: 18,
              ),
            Text(title),
            if (iconOnRight)
              Icon(
                icon,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
