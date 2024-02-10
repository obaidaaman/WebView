import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageController extends GetxController{
  final controller = WebViewController();
  RxDouble loadingPercentage = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    startWeb(controller);
  }

  void startWeb(WebViewController controller){
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);

    controller.setBackgroundColor(const Color(0x00000000));
    controller.setNavigationDelegate(NavigationDelegate(
      onProgress: ( progress){

loadingPercentage.value = progress.toDouble() ;
      },

      onPageStarted: (String url){
        loadingPercentage.value = 0;
      },
      onPageFinished: (url){
        loadingPercentage.value = 100;
      },
      onWebResourceError: (WebResourceError error){},
      onNavigationRequest: (NavigationRequest request){
        if(request.url.startsWith('https://www.youtube.com/')){
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    )
    );
    controller.loadRequest(Uri.parse('https://prodtestv3.fleksa.de/'));
  }

}