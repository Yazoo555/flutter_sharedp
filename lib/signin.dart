import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logshare/credt/email.dart';
import 'package:logshare/login.dart';
import 'package:logshare/credt/mnumber.dart';
import 'package:logshare/model.dart';
import 'package:logshare/credt/name.dart';
import 'package:logshare/credt/pwd.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final fkey = GlobalKey<FormState>();
  List<Usermodel> signinlist = [];
  Map<String, dynamic> loginEmptyList = {};

  //  List<Usermodel> dataList = [];

  TextEditingController nameControl = TextEditingController();
  TextEditingController mobileControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Sign - In",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: fkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Sign-In",
                  style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 20,
                ),
                name(
                  nameControl: nameControl,
                ),
                mnumber(
                  mobileControl: mobileControl,
                ),
                email(
                  emailControl: emailControl,
                ),
                password(
                  passwordControl: passwordControl,
                ),
                SizedBox(
                  height: 45,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.green.shade400,
                    fixedSize: Size(130, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _registerUser();
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    if (fkey.currentState!.validate()) {
      await _performSignIn();
      _showSuccessDialog();
    }
  }

  Future<void> _performSignIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString('dataList');

    print('User DATA: $jsonString');

    if (jsonString != null) {
      try {
        final jsonData = jsonDecode(jsonString);

        if (jsonData is List<dynamic>) {
          signinlist =
              jsonData.map((json) => Usermodel.fromJson(json)).toList();
          print(signinlist);
        } else if (jsonData is Map<String, dynamic>) {
          loginEmptyList
              .addAll(Usermodel.fromJson(jsonData) as Map<String, dynamic>);
        }
      } catch (e) {
        // print(e);
      }
    }
    signinlist.add(
      Usermodel(
        name: nameControl.text,
        email: emailControl.text,
        password: passwordControl.text,
        mnumber: mobileControl.text,
        userid: const Uuid().v4(),
      ),
    );

    List<Map<String, dynamic>> jsonDataList =
        signinlist.map((cv) => cv.toJson()).toList();
    print(signinlist);
    sharedPreferences.setString('dataList', json.encode(jsonDataList));
    loginEmptyList[emailControl.text] = jsonDataList;
    String jsonData = json.encode(jsonDataList);
    sharedPreferences.setString('dataList', jsonData);

    Future.microtask(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const login(),
        ),
      );

      Future.delayed(Duration(milliseconds: 180), () {
        _showSuccessDialog();
      });
    });
  }

  void _showSuccessDialog() {
    // Move the dialog code to a separate method and call it when needed
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("User registered successfully!"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
