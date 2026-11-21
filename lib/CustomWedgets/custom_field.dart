import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String lable;
  final IconData prefixIcon;
  final TextEditingController controllers;
  final String? Function(String?)? validator;

  CustomField({
    super.key,
    required this.lable,
    required this.prefixIcon,
    required this.controllers,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Card(
        elevation: 3,
        child: TextFormField(
          controller: controllers,
          obscureText: lable == "Password",
          validator: validator,
          decoration: InputDecoration(
            label: Text(lable, style: TextStyle(fontSize: 20)),
            filled: true,
            fillColor: const Color.fromARGB(255, 217, 225, 224),
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
