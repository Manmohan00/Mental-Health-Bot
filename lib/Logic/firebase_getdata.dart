
import 'package:mentalhealthbot/Logic/blog_datamodel.dart';
import 'package:mentalhealthbot/Logic/userdatamodel.dart';
import 'package:mentalhealthbot/Providers/providerglobals.dart';

class FirebaseGetData{
  Stream<List<UserModel>> getUserList(){
    return Global.firestore.collection('Users').snapshots().map(
            (snapshot) => snapshot.docs.map((doc) =>
                UserModel.fromJson(doc.data())).toList());
  }
  Stream<List<BlogModel>> getBlogList(){
    return Global.firestore.collection('Blog').snapshots().map(
            (snapshot) => snapshot.docs.map((doc) =>
            BlogModel.fromJson(doc.data())).toList());
  }
}