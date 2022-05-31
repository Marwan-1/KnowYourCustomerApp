import 'package:flutter/material.dart';

import 'pages/upload.dart';
import 'pages/welcome.dart';
//import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.

      initialRoute: '/',

      routes: {
        '/': (context) => const Welcome(),
        '/upload': (context) =>  Upload(),
        // '/stream': (context)  => Stream(),
      },
    );
  }
}
