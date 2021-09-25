import 'package:flutter/material.dart';


class AdminProvider extends ChangeNotifier{
  int _index = 0;

  int get getindex => _index;

  set setindex(int s){
    this._index = s;
    notifyListeners();
  }

}