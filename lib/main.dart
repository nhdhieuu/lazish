import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lazish/pages/main_layout_page.dart';
import 'package:lazish/pages/reel.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Chỉ cho phép dọc
    // DeviceOrientation.landscapeLeft, // Hoặc thêm dòng này để cho phép ngang trái
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainLayoutPage(),
    );
  }
}
