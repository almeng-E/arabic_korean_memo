import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arabic_korean_memo/data/item_class.dart';
import 'package:arabic_korean_memo/data/item_provider.dart';

// =========================================================================
class TestGenerator extends StatelessWidget {
  final String state;

  const TestGenerator({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '문제지 생성기',
          style: TextStyle(
            fontSize: 18,
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
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          // Access data from provider based on the state
          List<Item> items;
          if (state == 'memorized') {
            items = provider.memorizedItems;
          } else if (state == 'notMemorized') {
            items = provider.notMemorizedItems;
          } else {
            items = provider.totalItems;
          }
          return const Center(
            child: Text('테스트생성기 페이지'),
          );
        },
      ),
    );
  }
}
