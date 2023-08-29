import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arabic_korean_memo/data/item_provider.dart';
import 'package:arabic_korean_memo/data/item_class.dart';

import 'package:arabic_korean_memo/themes/my_icons.dart';

import 'package:arabic_korean_memo/ui/category_button.dart';
import 'package:arabic_korean_memo/ui/vocab_list.dart';

// =========================================================================
class MainPageVocabs extends StatefulWidget {
  const MainPageVocabs({super.key});

  @override
  State<MainPageVocabs> createState() => _MainPageVocabsState();
}

class _MainPageVocabsState extends State<MainPageVocabs> {
  List<Item> _currentItemList = [];

  void _updateCurrentItemList(List<Item> itemList) {
    Feedback.forTap(context);

    setState(() {
      _currentItemList = itemList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '단어장',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            color: Colors.black,
            tooltip: '검색',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shuffle_rounded),
            color: Colors.black,
            tooltip: '셔플',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CustomIcon.sliders),
            color: Colors.black,
            tooltip: '범위설정',
            onPressed: () {},
          ),
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
                  totalItemCount: provider.getTotalItemCount(),
                  memorizedItemCount: provider.getMemorizedItemCount(),
                  notMemorizedItemCount: provider.getNotMemorizedItemCount(),
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
