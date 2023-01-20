import 'package:flutter/material.dart';

class OriensTextField extends StatelessWidget {
  const OriensTextField(
      {super.key,
      this.labelText,
      this.validator,
      this.keyboardType,
      this.obscureText = false});
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
