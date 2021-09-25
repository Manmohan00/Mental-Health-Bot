import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mentalhealthbot/Logic/size.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserChat extends StatelessWidget {
  static const String id = 'UserChat';

  @override
  Widget build(BuildContext context) {
    List<double> sizes = ScreenSize(context);
    String data = """<!DOCTYPE html>
      <html lang="en">
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>------SmartBot------</title>
  </head>
  <body>
  <iframe
  allow="microphone;"
  width=${sizes[0]}
  height=${sizes[1] * 0.9}
  src="https://console.dialogflow.com/api-client/demo/embedded/3b35f321-21c0-433c-9446-45180f7cb0de">
  </iframe>
  </body>
  </html> """;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Smart Bot"),
      ),
      body: Container(
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
