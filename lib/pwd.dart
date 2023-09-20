// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class password extends StatefulWidget {
  final TextEditingController passwordControl;

  const password({required this.passwordControl, super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextFormField(
            obscureText: visible,
            obscuringCharacter: "*",
            controller: widget.passwordControl,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: Icon(
                  visible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black87,
                ),
              ),
              hintText: "Enter Password",
              labelText: "Password",
              labelStyle: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w200),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen.shade500),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Password";
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
