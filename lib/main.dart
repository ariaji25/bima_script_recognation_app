import 'package:bima_apps/di/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bima Apps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: pages,
      initialRoute: "/",
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
