import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_fleksa/screens/homepage.dart';

import 'main.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CupertinoThemeData(

      primaryColor: Colors.yellowAccent

      ),
      home: const MyHomePage(),
    );
  }
}
