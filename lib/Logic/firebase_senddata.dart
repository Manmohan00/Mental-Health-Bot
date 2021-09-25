

import 'package:mentalhealthbot/Providers/authentication.dart';
import 'package:mentalhealthbot/Providers/providerglobals.dart';
import 'package:provider/provider.dart';

void FirebaseSendData(String collection, context, String feedback) async{
  String? email = Provider.of<AuthenticationProvider>(context, listen: false).getuseremail;
  print("UPLOAD DETAILS -- $email, $feedback, $collection");
  Global.firestore.collection(collection).doc(email).update({
    'Feedback' : feedback,
  });
}

Future<bool> FirebaseSendUserData(String collection, context, String name, String email) async{
  String? email = Provider.of<AuthenticationProvider>(context, listen: false).getuseremail;
  Global.firestore.collection(collection).doc(email).set({
    'Name' : name,
    'Email' : email,
  });
  return true;
}

void FirebaseSendBlogData(context, String content, String image) async{
  String? email = Provider.of<AuthenticationProvider>(context, listen: false).getuseremail;
  Global.firestore.collection('Blog').doc().set({
    'Content' : content,
    'Image' : image,
  });
}