import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl=
        "https://imgs.search.brave.com/AZAoJde3aeGogQl-gf6F8Xxs96H6eWWyRoXX5Ta2Xa4/rs:fit:1200:1200:1/g:ce/aHR0cDovL3RoaXNw/aXguY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE1LzA2L0Nv/cHktb2YtRWRpdC0x/Nzk4LTEuanBn";
    return Drawer(
       child: Container(
         color: Colors.deepPurple,
         child: ListView(
             padding: EdgeInsets.zero,
           children: [
             DrawerHeader(
               padding: EdgeInsets.zero,
               child: UserAccountsDrawerHeader(
                 margin: EdgeInsets.zero,
               accountName:
               Text("Anishkha Chaudhary"),
             accountEmail:
               Text("anishkha0208@gmail.com"),
                 currentAccountPicture: CircleAvatar(
                   backgroundImage: NetworkImage(imageUrl),
                 ),
             ),
             ),
             ListTile(
               leading: Icon(
                 CupertinoIcons.home,
                 color: Colors.white,
               ),
               title: Text("Home",
                   textScaleFactor: 1.2,
                   style: TextStyle(
                     color: Colors.white,
                   ),
               ),
             ),
             ListTile(
               leading: Icon(
                 CupertinoIcons.profile_circled,
                 color: Colors.white,
               ),
               title: Text("Profile",
                 textScaleFactor: 1.2,
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
             ListTile(
               leading: Icon(
                 CupertinoIcons.mail,
                 color: Colors.white,
               ),
               title: Text("Email me",
                 textScaleFactor: 1.2,
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             )
           ],
         ),
       ),
    );
  }
}
