import 'package:flutter/material.dart';

// =========================================================================
class Grammar extends StatelessWidget {
  const Grammar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '문법 요약',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Center(
        child: Text('문법 요약 페이지'),
      ),
    );
  }
}
