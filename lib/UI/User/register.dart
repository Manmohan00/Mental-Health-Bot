import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Logic/firebase_authentication.dart';
import 'package:mentalhealthbot/Logic/size.dart';
import 'package:mentalhealthbot/Providers/userprovider.dart';
import 'package:provider/provider.dart';

class Registration extends StatelessWidget {
  static const String id = 'Registration';
  TextEditingController? user;
  TextEditingController? mail;
  TextEditingController? pass;

  @override
  Widget build(BuildContext context) {
    List<double> sizes = ScreenSize(context);
    UserProvider up = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(44.0), topRight: Radius.circular(44.0)),
        ),
        width: sizes[0],
        height: sizes[1],
        margin: EdgeInsets.only(top: sizes[1] * 0.25),
        padding: EdgeInsets.only(top: sizes[0] * 0.15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person_outline),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  controller: user,
                  onChanged: (text) {
                   up.setname = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  controller: mail,
                  onChanged: (text) {
                    up.setmail = text;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    hintText: 'Set Password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  controller: pass,
                  obscureText: true,
                  onChanged: (text) {
                    up.setpass = text;

                  },
                ),
              ),
              MaterialButton(
                  minWidth: sizes[0] * 0.5,
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Text("Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                    ),),
                  onPressed: () async {
                    await userCreate(up.getname, up.getmail, up.getpass,
                    context);
                    up.setpass = '';
                    up.setmail = '';
                    up.setname = '';
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
