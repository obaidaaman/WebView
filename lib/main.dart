import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_fleksa/app.dart';


void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Disable in release mode
      builder: (context) => MyApp(), // Your app's root widget
    ),
  );
}


