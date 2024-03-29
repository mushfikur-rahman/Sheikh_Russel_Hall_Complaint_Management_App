import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice/login.dart';
import 'package:voice/reusable_widgets/reusable_widget.dart';

import '../../core/utils/image_constant.dart';
class NavBar extends StatelessWidget {
  
  const NavBar({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
      var mail = FirebaseAuth.instance.currentUser!.email;
    return Drawer(
      //add color to the drawer
      backgroundColor: Color.fromRGBO(0, 28, 46, 1),
      //make background blur when opening the drawer
      child: ListView(padding: EdgeInsets.zero, children:[
        SizedBox(height: 50,),
        CircleAvatar(
          radius: 70,
          child: CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage("assets/images/img_profile21.png"),
          ),
        ),
        SizedBox(height: 10,),
        Text("CUET MAIL ID : ",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: "Poppins"),textAlign: TextAlign.center,),
        Text(mail.toString(),style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: "Poppins"),textAlign: TextAlign.center,),
        SizedBox(height: 10,),
      Container(
        height: 0.1,
        color: Colors.grey,
      ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Poppins'),),
          onTap: () {
            Navigator.pushNamed(context, '/studenthome');
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Poppins')),
          onTap: () {
            Navigator.pushNamed(context, '/studentProfile');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Poppins')),
          onTap: () {
            Navigator.pushNamed(context, '/studentsettings');
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Poppins')),
          onTap: () {
            FirebaseAuth.instance.signOut().then((value) {
                        print("Signed Out");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      });
          },
        ),
        Container(
        padding: EdgeInsets.fromLTRB(100, 100,100, 0),
        child: Column(
          children: [
            Image.asset("assets/images/img_voiceicon.png"),
            Text("SRH Complaints",style: TextStyle(fontSize: 12,fontFamily: "Poppins"),textAlign: TextAlign.left,),
          ],
        )
      ),
        //add a text to bottom of the drawer
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text("MADE By Mushfik &Team\n version 1.0.0",style: TextStyle(fontFamily:"Poppins",color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
        )
      ]
      ),
      //add a text to bottom of the drawer
      
    );
  }
}