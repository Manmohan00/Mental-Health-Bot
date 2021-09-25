import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentalhealthbot/Providers/createblog.dart';
import 'package:mentalhealthbot/Providers/providerglobals.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

void getImage(context) async{
  await ImagePicker().pickImage(source: ImageSource.gallery).then(
          (value) => Provider.of<CreateBlogProvider>(context,listen:false).setimage = File(value!.path));
  Provider.of<CreateBlogProvider>(context,listen:false).setselected = true;
}

Future<bool> UploadFile(context) async{
  TaskSnapshot task = await Global.storage.ref().child("Blog/${DateTime.now()}").putFile(Provider.of<CreateBlogProvider>(context,listen:false).getimage);
  await task.ref.getDownloadURL().then((value) => Provider.of<CreateBlogProvider>(context,listen:false).setimageurl = value);
  // Global.storage.ref().getDownloadURL().then((value) =>
  // Provider.of<CreateBlogProvider>(context,listen:false).setimageurl = value
  // );
  return true;
}