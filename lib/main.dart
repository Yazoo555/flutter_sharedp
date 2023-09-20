import 'package:flutter/material.dart';
import 'package:logshare/signin.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login-UI",
      home: signin(),
    );
  }
}
