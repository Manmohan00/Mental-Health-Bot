import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentalhealthbot/Logic/firebase_senddata.dart';
import 'package:mentalhealthbot/Providers/authentication.dart';
import 'package:mentalhealthbot/Providers/providerglobals.dart';
import 'package:provider/provider.dart';

Future<bool> userLogin(String email, String password, context) async{
  UserCredential user = await
 Global.auth.signInWithEmailAndPassword(email: email, password: password);

  if(user.user?.uid != null){
    Provider.of<AuthenticationProvider>(context, listen:false).setname =  user.user?.displayName ?? '';
    Provider.of<AuthenticationProvider>(context, listen:false).setemail =  user.user?.email ?? '';
    return true;
  }
  else{
    return false;
  }
}

Future<bool> userCreate( String name, String email, String password, context) async{
  UserCredential user = await
  Global.auth.createUserWithEmailAndPassword(email: email, password: password);
  user.user?.updateDisplayName(name);
  if(user.user?.uid != null){
    Provider.of<AuthenticationProvider>(context, listen:false).setname =  user.user?.displayName ?? '';
    Provider.of<AuthenticationProvider>(context, listen:false).setemail =  user.user?.email ?? '';

    await FirebaseSendUserData("Users", context, name, email);
    return true;
  }
  else{
    return false;
  }
}