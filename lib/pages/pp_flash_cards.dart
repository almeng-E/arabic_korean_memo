import 'package:flutter/material.dart';

class FlashCards extends StatelessWidget {
  const FlashCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '플래시 카드',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle_rounded),
            color: Colors.black,
            tooltip: '셔플',
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('플래시카드 페이지'),
      ),
    );
  }
}
