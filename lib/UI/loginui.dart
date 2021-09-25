import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Logic/firebase_authentication.dart';
import 'package:mentalhealthbot/Logic/size.dart';
import 'package:mentalhealthbot/Providers/authentication.dart';
import 'package:mentalhealthbot/UI/User/register.dart';
import 'package:mentalhealthbot/commonui.dart';
import 'package:provider/provider.dart';
import 'Admin/adminhome.dart';
import 'User/userhome.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';
  @override
  Widget build(BuildContext context) {
    List<double> sizes = ScreenSize(context);
    TextEditingController? user;
    TextEditingController? pass;
    AuthFields auth = Provider.of<AuthFields>(context);
    AuthenticationProvider ap = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: ap.getloading ?  loading():
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: sizes[1] * 0.01),
                padding: const EdgeInsets.all(20.0),
                height: sizes[1] * 0.25,
                child: Text("""Mental Health Advisor\n Welcomes You!""",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade800,
                  fontSize: 30,
                ),),
              ),
                 Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(44.0),
                        topRight: Radius.circular(44.0)),
                  ),
                  width: sizes[0],
                  height: sizes[1],
                 // margin: EdgeInsets.only(top: sizes[1] * 0.25),
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        width: sizes[0] * 0.8,
                        margin: EdgeInsets.only(top: sizes[1] * 0.1),
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                  ),
                              controller: user,
                              onChanged: (text){
                                auth.setmail = text;
                                user?.text = text;
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.security),
                                  hintText: 'Password',
                                  focusedBorder:  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                  ),
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                controller: pass,
                                obscureText: true,
                                onChanged: (text){
                                  pass?.text = text;
                                  auth.setpass = text;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      MaterialButton(
                        minWidth: sizes[0] * 0.5,
                        child: const Text("Login",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5
                          ),),
                          color: Colors.purpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          onPressed:() async{
                            bool login = false;
                          if(auth.getmail.isEmpty || auth.getpass.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(snack("Email and Password cannot be empty"));
                          }
                          else if(auth.getmail.contains(".") == false || auth.getmail.contains("@") == false){
                            ScaffoldMessenger.of(context).showSnackBar(snack("Please enter a valid email"));
                          }
                          else{
                            login = await userLogin(auth.getmail, auth.getpass, context);

                            if(login == true){
                              ap.setloading = true;
                              ap.getusername == 'Admin' ? Navigator.pushNamed(context, AdminHome.id)
                                  :Navigator.pushNamed(context, UserHome.id);
                              ap.setloading = false;
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(snack(login));
                            }
                          }
                          }),
                      const Text("OR"),
                      MaterialButton(
                          minWidth: sizes[0] * 0.5,
                          color: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: const Text("Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5
                          ),),
                          onPressed: () async {
                          Navigator.pushNamed(context, Registration.id);
                          }),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
