import 'package:flutter/material.dart';

class email extends StatefulWidget {
  final TextEditingController emailControl;
  const email({required this.emailControl, super.key});

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextFormField(
            controller: widget.emailControl,
            decoration: InputDecoration(
              hintText: "Enter Email",
              labelText: "Email",
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
                return "Enter Your Email";
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Invalid email format';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
