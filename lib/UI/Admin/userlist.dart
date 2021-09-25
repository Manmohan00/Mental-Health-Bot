import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Logic/firebase_getdata.dart';
import 'package:mentalhealthbot/Logic/size.dart';
import 'package:mentalhealthbot/Logic/userdatamodel.dart';
import 'package:mentalhealthbot/Providers/admin_provider.dart';
import 'package:mentalhealthbot/Providers/providerglobals.dart';
import 'package:provider/provider.dart';
import 'package:mentalhealthbot/Logic/firebase_getdata.dart';

class UserList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserModel>>(
        create: (context) => FirebaseGetData().getUserList(),
        initialData: [],
    child: Users(),);
  }
}


class Users extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<double> sizes = ScreenSize(context);
    List user = Provider.of<List<UserModel>>(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        foregroundColor: Colors.deepPurple,
        title: Text("User List & Feedback"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: sizes[1] * 0.03),
        padding: EdgeInsets.only(top: sizes[1] * 0.03, right: 10.0, left: 10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
        ),
        height: sizes[1],
        width: sizes[0],
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index){
              return  Container(
                height: sizes[1] * 0.1,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.8, 0.2),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: sizes[0] * 0.1,
                          child: Icon(Icons.person_outline,
                          color: Colors.deepPurple,),),
                      SizedBox(
                          width: sizes[0] * 0.2,
                          child: Text("${user[index].Name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),),
                      Expanded(
                        child: Text("${user[index].Feedback}",
                        softWrap: true,
                        style: TextStyle(
                          color: user[index].Feedback == "No Feedback" ? Colors.grey :
                              Colors.black
                        ),),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}

