import 'package:flutter/material.dart';

List<double> ScreenSize(context){
  double width = MediaQuery.of(context).size.width;
  double Mainheight = MediaQuery.of(context).size.height;
  double appBar = AppBar().preferredSize.height;
  double topPadding = MediaQuery.of(context).padding.top;
  double height = Mainheight - appBar - topPadding;

  return [width,height];
}

// class Screen{
//   static
// }