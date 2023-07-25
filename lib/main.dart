import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/pages/main_page_format.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '나만의 작은 아랍어',
      home: MainPageFormat(),
    );
  }
}
