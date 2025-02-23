import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const LoginTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: hintText.toLowerCase().contains('email')
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.tertiary,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16),
      ),
    );
  }
}
