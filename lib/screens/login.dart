import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      // child: Center(
      //     child: Text("Login page",
      //       style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //            color: Colors.blue
      //       ),
      //     )
      // ),

      child: Column(
        children: [
          Image.asset("assets/images/login.png",
          fit: BoxFit.cover,),
        ],
      ),
    );
  }
}
