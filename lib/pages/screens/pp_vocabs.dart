import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arabic_korean_memo/data/item_provider.dart';
import 'package:arabic_korean_memo/data/item_class.dart';

import 'package:arabic_korean_memo/ui/category_button.dart';
import 'package:arabic_korean_memo/ui/vocab_list.dart';

// =========================================================================
class VocabPage extends StatefulWidget {
  const VocabPage({super.key});

  @override
  State<VocabPage> createState() => _VocabPageState();
}

class _VocabPageState extends State<VocabPage> {
  List<Item> _currentItemList = [];

  void _updateCurrentItemList(List<Item> itemList) {
    // haptic 반응을 위함
    Feedback.forTap(context);
    setState(() {
      _currentItemList = itemList;
    });
  }

  void _shuffleCurrentItemList() {
    _currentItemList = List.from(_currentItemList); // Create a copy
    _currentItemList.shuffle(); // Shuffle the copy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '단어장',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: '검색',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shuffle_rounded),
            tooltip: '셔플',
            onPressed: () {
              setState(() {
                _shuffleCurrentItemList();
              });
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.tune_rounded),
          //   tooltip: '범위설정',
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Consumer<ItemProvider>(
          builder: (context, provider, child) {
            if (_currentItemList.isEmpty) {
              _currentItemList = provider.totalItems;
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // ********************************* 색전환 버튼들 나중에 수정
                CategoryButton(
                  // totalItemCount: provider.getTotalItemCount(),
                  // memorizedItemCount: provider.getMemorizedItemCount(),
                  // notMemorizedItemCount: provider.getNotMemorizedItemCount(),
                  onTapTotal: () {
                    _updateCurrentItemList(provider.totalItems);
                  },
                  onTapMemorized: () {
                    _updateCurrentItemList(provider.memorizedItems);
                  },
                  onTapNotMemorized: () {
                    _updateCurrentItemList(provider.notMemorizedItems);
                  },
                ),
                const SizedBox(height: 22),
                // 단어장 위젯
                VocabList(items: _currentItemList)
              ],
            );
          },
        ),
      ),
    );
  }
}
