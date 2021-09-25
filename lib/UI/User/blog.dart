import 'package:mentalhealthbot/Providers/loadingprovider.dart';
import 'package:mentalhealthbot/commonui.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Logic/blog_datamodel.dart';
import 'package:mentalhealthbot/Logic/firebase_getdata.dart';
import 'package:mentalhealthbot/Logic/firebase_senddata.dart';
import 'package:mentalhealthbot/Logic/size.dart';
import 'package:mentalhealthbot/Providers/authentication.dart';
import 'package:mentalhealthbot/Providers/userprovider.dart';
import 'package:provider/provider.dart';

import 'blogfull.dart';


class UserBlog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return StreamProvider<List<BlogModel>>(
     create: (context) => FirebaseGetData().getBlogList(),
     initialData: [],
       child: Blog());
  }
}


class Blog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List bm = Provider.of<List<BlogModel>>(context);
    LoadingProvider lp = Provider.of<LoadingProvider>(context);
    List<double> sizes = ScreenSize(context);
    return lp.getblog ? loading():
    Cappbar("Blogs",
        Center(
        child: Container(
          margin: EdgeInsets.only(top: sizes[1] * 0.03),
          padding: EdgeInsets.only(top: sizes[1] * 0.03),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          height: sizes[1],
          width: sizes[0],
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: sizes[1] * 0.6,
                  child: ListView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: bm.length,
                      itemBuilder: (BuildContext context, int index){
                        return BlogsRead(index);
                      },
                  ),
                ),
                Feedback(),
              ],
            ),
          ),
        ),
      ));
  }
}


class BlogsRead extends StatelessWidget {
  int index;

  BlogsRead(this.index);
  @override
  Widget build(BuildContext context) {
    List<double> sizes = ScreenSize(context);
    List bm = Provider.of<List<BlogModel>>(context);
        return  GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, BlogFull.id,
            arguments: {
              'Content' : bm[index].content,
              'Url' : bm[index].url,
            });
        },
          child: Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.8, 0.2),
                  blurRadius: 3.0,
                ),
              ],
              borderRadius: BorderRadius.circular(13.0),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(bm[index].url,
                  width: sizes[0] * 0.2,
                  height: sizes[0] * 0.2,
              ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ReadMoreText(bm[index].content,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        trimLines: 1,
                        trimLength: 150,
                 ),
                    ),
                  ),
                  Center(child: Icon(Icons.arrow_right))
                ],
              ),
          ),
        );
  }
}


class Feedback extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoadingProvider lp = Provider.of<LoadingProvider>(context);
    UserProvider up = Provider.of<UserProvider>(context);
    List<double> sizes = ScreenSize(context);
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10),
      width: sizes[0],
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.1, 0.2),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            onChanged: (text) {
              up.setfeedback = text;
            },
            decoration:
            InputDecoration(hintText: "Give a Feedback"),
            maxLines: 2,
          ),
          MaterialButton(
            splashColor: Colors.deepPurple,
            color: Colors.purple,
            minWidth:sizes[0],
            elevation: 5.0,
            child: const Text(
              "Submit Feedback",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all( Radius.circular(15))),
            onPressed: () {
              lp.setblog = true;
              FirebaseSendData('Users', context, up.getfeedback);
              controller.clear();
              up.setfeedback = '';
              lp.setblog = false;
            },
          ),
        ],
      ),
    );
  }
}
