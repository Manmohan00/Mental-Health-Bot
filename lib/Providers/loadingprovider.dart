

import 'package:flutter/cupertino.dart';

class LoadingProvider extends ChangeNotifier{
  bool _Register = false;
  bool _blog = false;

  bool get getblog => _blog;
  bool get getRegister => _Register;

  set setblog(bool b){
    this._blog = b;
    notifyListeners();
  }
  
  set setRegister(bool b){
    this._Register = b;
    notifyListeners();
  }
}