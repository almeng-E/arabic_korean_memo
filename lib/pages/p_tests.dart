import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/data/data_manager.dart';
import 'package:arabic_korean_memo/data/item_class.dart';

import 'package:arabic_korean_memo/themes/my_icons.dart';

import 'package:arabic_korean_memo/ui/category_button.dart';
import 'package:arabic_korean_memo/ui/menu_card.dart';

// =========================================================================
class MainPageTests extends StatefulWidget {
  const MainPageTests({super.key});

  @override
  State<MainPageTests> createState() => _MainPageTestsState();
}

class _MainPageTestsState extends State<MainPageTests> {
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
          '테스트',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
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
          children: [
            // ********************************* 색전환 버튼들
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
            // 빈 공간 SPACING
            const SizedBox(
              height: 22,
            ),
            Column(
              children: <Widget>[
                MenuCard(
                  menuIcon: const Icon(Icons.widgets_outlined),
                  // OR  Icons.dashboard_outlined
                  menuName: '사지 선다 테스트',
                  description: '설명 ~~~~~~~~~~',
                  route: '/fourchoice',
                ),
                const SizedBox(
                  height: 10,
                ),
                MenuCard(
                  menuIcon: const Icon(Icons.picture_as_pdf_outlined),
                  menuName: '문제지 생성기',
                  description: '설명~~~~~~~~~@@@@@@@@@@@@@@@@@@@@@@@@@@@',
                  route: '/testgenerator',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
