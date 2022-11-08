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

      child: SingleChildScrollView( //this is used to adjust the page according to various devices vo scrolling krdega rather than showing overflow//
        child: Column(
          children: [
            Image.asset("assets/images/login.png",
              //height: 500,//
            fit: BoxFit.cover,),
            SizedBox(height: 20,),   // Used for spacing and good presentation of the interface..//
            Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24
            ),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "UserName"

                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",

                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Login"),
                      style: TextButton.styleFrom(),
                    onPressed: (){
                      print("Hi my name is Anishkha...");
                    },
                  )
                ],
              ),
            )

            
          ],

        ),
      ),
    );
  }
}
