import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mentalhealthbot/Logic/firebase_getdata.dart';
import 'package:mentalhealthbot/UI/User/register.dart';
import 'package:mentalhealthbot/UI/User/userchat.dart';
import 'package:provider/provider.dart';
import 'Providers/admin_provider.dart';
import 'Providers/authentication.dart';
import 'Providers/createblog.dart';
import 'Providers/loadingprovider.dart';
import 'Providers/userprovider.dart';
import 'UI/Admin/adminhome.dart';
import 'UI/User/blogfull.dart';
import 'UI/User/userhome.dart';
import 'UI/loginui.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthFields()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AdminProvider()),
        ChangeNotifierProvider(create: (context) => CreateBlogProvider()),
        ChangeNotifierProvider(create: (context) => LoadingProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: LoginPage(),
        routes: {
          LoginPage.id: (context) => LoginPage(),
          UserHome.id : (context) => UserHome(),
          AdminHome.id : (context) => AdminHome(),
          Registration.id: (context) => Registration(),
          BlogFull.id: (context) => BlogFull(),
        },
      ),
    );
  }
}