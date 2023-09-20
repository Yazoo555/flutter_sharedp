import 'package:flutter/material.dart';

class mnumber extends StatefulWidget {
  final TextEditingController mobileControl;
  const mnumber({required this.mobileControl, super.key});

  @override
  State<mnumber> createState() => _mnumberState();
}

class _mnumberState extends State<mnumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: widget.mobileControl,
            decoration: InputDecoration(
              hintText: "Enter Mobile Number",
              labelText: "Mobile Number",
              labelStyle: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w200),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange.shade800),
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
                return "Enter Mobile Number";
              } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                return "Invalid !. Mobile number should be 10 digits.";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
