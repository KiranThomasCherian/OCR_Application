import 'package:flutter/material.dart';
import 'package:ocr_application/pages/home.dart';
import 'package:ocr_application/pages/upload.dart';
import 'package:ocr_application/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OCR App",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      color: Colors.white,
      // initialRoute: '/',
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.uploadpage: (context) => UploadPage(),
      },
    );
  }
}
