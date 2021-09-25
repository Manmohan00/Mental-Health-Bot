import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Providers/admin_provider.dart';
import 'package:mentalhealthbot/UI/Admin/userlist.dart';
import 'package:provider/provider.dart';

import 'createblog.dart';

class AdminHome extends StatelessWidget {
  static const String id = 'AdminHome';

  @override
  Widget build(BuildContext context) {
    AdminProvider adminp = Provider.of<AdminProvider>(context);
    List<Widget> BottomNav = [UserList(), CreateBlog()];
    return Scaffold(
      body: BottomNav[adminp.getindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        backgroundColor: Colors.purple,
        currentIndex: adminp.getindex,
        items: [
          BottomNavigationBarItem(
            label: "Users",
            icon: Icon(Icons.supervised_user_circle_outlined,
              size: adminp.getindex == 0 ? 25 : 20,),),
          BottomNavigationBarItem(
            label: "Blog",
            icon: Icon(Icons.post_add_outlined,
              size: adminp.getindex == 1 ? 25 : 20,),)
        ],
        onTap: (index){
          adminp.setindex = index;
        },
      ),);
  }
}
