import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_fleksa/controller/webviewpagecontroller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewPageController viewPageController = Get.put(WebViewPageController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.transparent,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.amberAccent,
          middle: const Text(
            "Fleksa",
            style: TextStyle(
                color: Colors.black87,
                fontStyle: FontStyle.italic,
                fontSize: 20),
          ),
          leading: IconButton(
              onPressed: () async {
                GoBack();
              },
              icon: const Icon(
                CupertinoIcons.back,
                color: Colors.black87,
              )),
          trailing: IconButton(
              onPressed: () async {
                GoForward();
              },
              icon: const Icon(
                CupertinoIcons.forward,
                color: Colors.black87,
              )),
        ),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.black],
                  begin: Alignment.topCenter,
                  stops: [0.86, 1.0],
                  end: Alignment.bottomCenter)),
          child: SafeArea(
            child: Stack(
              children: [
                WebViewWidget(controller: viewPageController.controller),
                Obx(() => Visibility(
                      visible: viewPageController.loadingPercentage.value < 100,
                      child: const LinearProgressIndicator(
                        color: Colors.deepOrangeAccent,
                      ),
                    ))
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void GoBack() async {
    if (await viewPageController.controller.canGoBack()) {
      viewPageController.controller.goBack();
    } else {
      Get.snackbar("", "",
          titleText: const Text(
            " Back History ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
          ),
          messageText: const Text(
            'No Back History Found',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.black,
          backgroundColor: Colors.amberAccent);
    }
  }

  void GoForward() async {
    if (await viewPageController.controller.canGoForward()) {
      viewPageController.controller.goForward();
    } else {
      Get.snackbar("", "",
          titleText: const Text(
            " Forward History ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
          ),
          messageText: const Text(
            'No Forward History Found',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.black,
          backgroundColor: Colors.amberAccent);
    }
  }
}
