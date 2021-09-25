import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Providers/authentication.dart';
import 'package:mentalhealthbot/UI/User/blog.dart';
import 'package:mentalhealthbot/UI/User/userchat.dart';
import 'package:provider/provider.dart';

class UserHome extends StatelessWidget {
  static const String id = 'UserHome';
  @override
  Widget build(BuildContext context) {
    AuthenticationProvider indexp = Provider.of<AuthenticationProvider>(context);
    List<Widget> BottomNav = [UserChat(), UserBlog()];
    return Scaffold(
        body: BottomNav[indexp.getindex],
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white30,
      backgroundColor: Colors.purple,
      currentIndex: indexp.getindex,
      items: [
        BottomNavigationBarItem(
          label: "chat",
            icon: Icon(Icons.chat,
            size: indexp.getindex == 0 ? 25 : 20,),),
        BottomNavigationBarItem(
          label: "Blog",
          icon: Icon(Icons.article_outlined,
          size: indexp.getindex == 1 ? 25 : 20,),)
      ],
      onTap: (index){
        indexp.setindex = index;
      },
    ),);
  }
}
