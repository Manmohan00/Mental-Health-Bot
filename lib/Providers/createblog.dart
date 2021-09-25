

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlogProvider extends ChangeNotifier{
  late String content;
  late File image;
  String imageurl = '';
  bool selected = false;

  set setselected(bool b){
    this.selected = b;
    notifyListeners();
  }

  get getselected{
    return this.selected;
  }

  set setimageurl(String s){
    this.imageurl = s;
    notifyListeners();
  }

  String get getimageurl{
    return this.imageurl;
  }

  set setimage(File x){
    this.image = x;
    notifyListeners();
  }
  File get getimage{
    return this.image;
  }
  set setcontent(String s){
    this.content = s;
    notifyListeners();
  }

  String get getcontent {
    return this.content;
  }
}