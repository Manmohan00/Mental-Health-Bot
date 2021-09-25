import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Logic/size.dart';

import '../../commonui.dart';

class BlogFull extends StatelessWidget {
  static const String id = 'BlogFull';

  late String content;
  late String url;

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    List<double> sizes = ScreenSize(context);
    return Cappbar("Blog",
        Container(
        margin: EdgeInsets.only(top: sizes[1] * 0.05),
        padding: EdgeInsets.only(top: sizes[1] * 0.03),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
        ),
        height: MediaQuery.of(context).size.height,
        width: sizes[0],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(args['Url'],
                  width: sizes[0] * 0.5,
                  height: sizes[0] * 0.5,),
                ),
                Text(args['Content'],
                softWrap: true,
                textAlign: TextAlign.start,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
