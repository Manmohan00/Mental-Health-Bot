

import 'package:flutter/material.dart';

class Cappbar extends StatelessWidget {
  String title;
  Widget body;

  Cappbar(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(title),
      ),
      body: body,
    );
  }
}

class loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
        color: Colors.deepPurple,
        backgroundColor: Colors.white,
    ),
    );
  }
}

SnackBar snack(errorText){
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(10.0),
    backgroundColor: Colors.red,
    content: Text(
      errorText,
      style: const TextStyle(
        color: Colors.white,
        letterSpacing: 2.0,
      ),
    ),
  );
}

SnackBar successeSnack(errorText){
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(10.0),
    backgroundColor: Colors.green.shade700,
    content: Text(
      errorText,
      style: const TextStyle(
        color: Colors.white,
        letterSpacing: 2.0,
      ),
    ),
  );
}


