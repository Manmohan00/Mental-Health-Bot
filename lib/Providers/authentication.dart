import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mentalhealthbot/Providers/providerglobals.dart';

class AuthenticationProvider  extends ChangeNotifier{
String? _name ;
String? _email;
int _index = 0;
bool _loading = false;

String? get getusername => _name;
String? get getuseremail => _email;
int get getindex => _index;
bool get getloading => _loading;

set setloading(bool b){
  this._loading = b;
  notifyListeners();
}
set setname(String s){
  this._name = s;
  notifyListeners();
}
set setemail(String s){
  this._email = s;
  notifyListeners();
}
set setindex(int s){
  this._index = s;
  notifyListeners();
}
}

class AuthFields extends ChangeNotifier{
  String mail = '';
  String password = '';

  set setmail(String s){
    this.mail = s;
    notifyListeners();
  }

  String get getmail{
    return this.mail;
  }

  String get getpass{
    return this.password;
  }

  set setpass(String s){
    this.password = s;
    notifyListeners();
  }
}