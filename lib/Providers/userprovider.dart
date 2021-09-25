import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
 String feedback = '';
 String name = '';
 String mail = '';
 String pass = '';

 set setfeedback(String f){
   this.feedback = f;
   notifyListeners();
 }

 set setname(String n){
   this.name = n;
   notifyListeners();
 }

 set setmail(String n){
   this.mail = n;
   notifyListeners();
 }

 set setpass(String n){
   this.pass = n;
   notifyListeners();
 }

 String get getfeedback => feedback;
 String get getname => name;
 String get getmail => mail;
 String get getpass => pass;
}