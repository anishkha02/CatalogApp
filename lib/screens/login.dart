import 'package:catalog_project/utils/routes.dart';
import 'package:catalog_project/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changedButton=false;
  
  final _formkey=GlobalKey<FormState>();
  moveToHome(BuildContext context)async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      // child: Center(
      //     child: Text("Login page",
      //       style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //            color: Colors.blue
      //       ),
      //     )
      // ),

      child: SingleChildScrollView(//this is used to adjust the page according to various devices vo scrolling krdega rather than showing overflow//
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/login.png",
                //height: 500,//
              fit: BoxFit.cover,),
              SizedBox(height: 20,),   // Used for spacing and good presentation of the interface..//
              Text("Welcome $name",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24
              ),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "UserName",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username cannot be empty";
                      }
                       return null;
                        },
                      onChanged: (value){
                      name=value;
                      setState(() {

                      });
                      }
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",

                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if(value.length<6){
                          return "Password length should be atleast 6 character";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 40,),

                    Material(
                      color:MyTheme.darkBluishColor,
                      borderRadius: BorderRadius.circular(changedButton?70:8),
                      child: InkWell(
                       // splashColor: Colors.red,
                        onTap: ()=>moveToHome(context),
                        
                        
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changedButton? 40:140,

                          alignment: Alignment.center,
                          child: changedButton?Icon(Icons.done,color: Colors.white,):Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16
                            ),

                          ),

                        ),
                      ),
                    )






                    // ElevatedButton(
                    //   child: Text("Login",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold
                    //     ),),
                    //     style: TextButton.styleFrom(minimumSize: Size(120, 40)),
                    //   onPressed: (){
                    //    Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // )
                  ],
                ),
              )


            ],

          ),
        ),
      ),
    );
  }
}
