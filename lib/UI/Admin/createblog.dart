import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Logic/firebase_senddata.dart';
import 'package:mentalhealthbot/Logic/image.dart';
import 'package:mentalhealthbot/Logic/size.dart';
import 'package:mentalhealthbot/Providers/createblog.dart';
import 'package:mentalhealthbot/Providers/loadingprovider.dart';
import 'package:provider/provider.dart';

import '../../commonui.dart';

class CreateBlog extends StatelessWidget {
TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<double> sizes = ScreenSize(context);
    CreateBlogProvider bp = Provider.of<CreateBlogProvider>(context);
    LoadingProvider lp = Provider.of<LoadingProvider>(context);
    return lp.getblog ? loading() : Cappbar("Publish a blog",
        Container(
          margin: EdgeInsets.only(top: sizes[1] * 0.03),
          padding: EdgeInsets.only(top: sizes[1] * 0.02),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          height: sizes[1] - sizes[1] * 0.04,
          width: sizes[0],
          child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width:  sizes[0] * 0.5,
                      child: MaterialButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.image_outlined,
                            color: Colors.white,),
                            Text("Add Image",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.5
                            ),),
                          ],
                        ),
                        onPressed: (){
                          getImage(context);
                        },
                      ),
                    ),
                    bp.getselected ? Image.file(bp.getimage,
                    width: sizes[0] * 0.5,
                    height: sizes[0] * 0.5,) : Text("No Image Selected"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          focusedBorder:  OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Start a new blog...',
                          enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        controller: controller,
                        maxLines: 15,
                        onChanged: (text){
                          bp.setcontent = text;
                        },
                      ),
                    ),
                    MaterialButton(
                      child: Text("Publish Blog",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0
                        ),),
                      //padding: EdgeInsets.all(8.0),
                      color: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onPressed: ()async{
                        if(bp.getcontent.isEmpty == true || bp.getselected == false){
                          ScaffoldMessenger.of(context).showSnackBar(snack("Content and image cannot be empty"));
                        }
                        else {
                            lp.setblog = true;
                            await UploadFile(context);
                            controller.clear();
                            FirebaseSendBlogData(
                                context, bp.getcontent, bp.getimageurl);
                            ScaffoldMessenger.of(context).showSnackBar(successeSnack("Blog Uploaded"));
                            lp.setblog = false;
                            bp.setcontent = '';
                            bp.setselected = false;
                          }
                        },
                    ),
                  ],
                ),
              ),
        ));
  }
}
