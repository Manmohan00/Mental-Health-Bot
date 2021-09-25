import 'package:flutter/material.dart';
import 'package:mentalhealthbot/Logic/size.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../commonui.dart';

class UserChat extends StatelessWidget {
  static const String id = 'UserChat';

  @override
  Widget build(BuildContext context) {
    List<double> sizes = ScreenSize(context);
    return Cappbar("Smart Bot", Container(
        margin: EdgeInsets.only(top: sizes[1] * 0.03),
        padding: EdgeInsets.only(top: sizes[1] * 0.02),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
        ),
        width: sizes[0],
        height: sizes[1],
        child: SingleChildScrollView(
              child: SizedBox(
                width: sizes[0],
                height: sizes[1],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: "https://smartbothelper.000webhostapp.com/",
                  ),
                ),
              ),

              // Html(
              //   shrinkWrap: true,
              //   data: data,
              // ),
          ),
      ),
    );
  }
}
