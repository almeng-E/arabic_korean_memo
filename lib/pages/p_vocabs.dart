import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/themes/my_icons.dart';
import 'package:arabic_korean_memo/widgets/w_category_button.dart';
import 'package:arabic_korean_memo/widgets/w_vocab_list.dart';
import 'package:arabic_korean_memo/widgets/d_data_manager.dart';

// =========================================================================
class MainPageVocabs extends StatefulWidget {
  const MainPageVocabs({super.key});

  @override
  State<MainPageVocabs> createState() => _MainPageVocabsState();
}

class _MainPageVocabsState extends State<MainPageVocabs> {
  final ItemDataManager _itemDataManager = ItemDataManager();
  List<Item> _currentItemList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _itemDataManager.loadData();
    setState(() {
      _currentItemList = _itemDataManager.totalItemList;
    }); // Refresh the UI after data is loaded
  }

  void _updateCurrentItemList(List<Item> newList) {
    setState(() {
      _currentItemList = newList;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // ********************************* 색전환 버튼들 나중에 수정
            CategoryButton(
              totalItemCount: _itemDataManager.getTotalItemCount(),
              memorizedItemCount: _itemDataManager.getMemorizedItemCount(),
              notMemorizedItemCount:
                  _itemDataManager.getNotMemorizedItemCount(),
              onTapTotal: () {
                _updateCurrentItemList(_itemDataManager.totalItemList);
              },
              onTapMemorized: () {
                _updateCurrentItemList(_itemDataManager.memorizedItemList);
              },
              onTapNotMemorized: () {
                _updateCurrentItemList(_itemDataManager.notMemorizedItemList);
              },
            ),
            const SizedBox(
              height: 22,
            ),
            // 단어장 위젯
            VocabList(
              items: _currentItemList,
            )
          ],
        ),
      ),
    );
  }
}
