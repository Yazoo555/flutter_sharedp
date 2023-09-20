import 'package:flutter/material.dart';

class name extends StatefulWidget {
  final TextEditingController nameControl;
  const name({
    required this.nameControl,
    super.key,
  });

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextFormField(
            controller: widget.nameControl,
            decoration: InputDecoration(
              hintText: "Enter Your Name",
              labelText: "User Name",
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
                return "Enter Full Name";
              } else if (RegExp(r'[^a-zA-Z ]').hasMatch(value)) {
                return 'No Numbers In User Name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
