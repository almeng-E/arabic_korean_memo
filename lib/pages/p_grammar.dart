import 'package:flutter/material.dart';

// =========================================================================
class MainPageGrammar extends StatelessWidget {
  const MainPageGrammar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '문법 요약',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.red),
            color: Colors.amber,
          ),
          child: const Text('메인페이지 문법!~'),
        ),
      ),
    );
  }
}
