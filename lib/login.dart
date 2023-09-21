import 'package:flutter/material.dart';
import 'package:logshare/signin.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formkey = GlobalKey<FormState>();
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Log-In",
              style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w200),
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
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: visible,
                  obscuringCharacter: "*",
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
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w200),
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
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.red.shade400,
                    fixedSize: Size(130, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
/*
                    if (formkey.currentState!.validate()) {
                      print("Log IN");
                    }
*/
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add your navigation or action when the "Signup" text is clicked.
                        // For example, you can navigate to the signup screen.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signin(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "No Account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text: "\t Signup",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Colors.green
                                    .shade500, // You can change the color to your preference
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
