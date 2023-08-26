import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/widgets/f_category_button.dart';
import 'package:arabic_korean_memo/widgets/w_menu_card.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';
import 'package:arabic_korean_memo/widgets/d_data_manager.dart';
import 'package:arabic_korean_memo/widgets/d_item_class.dart';

// =========================================================================
class MainPageStudy extends StatefulWidget {
  const MainPageStudy({super.key});

  @override
  State<MainPageStudy> createState() => _MainPageStudyState();
}

class _MainPageStudyState extends State<MainPageStudy> {
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
          '학습',
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
            // 메뉴 버튼들
            Table(
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    MenuCard(
                      menuIcon: const Icon(Icons.style_outlined),
                      menuName: '플래시 카드',
                      description: '메뉴 설명들 ~~~~~~~~~~~~~~~~',
                      route: '/flashcards',
                    ),
                    MenuCard(
                      menuIcon:
                          const Icon(Icons.local_fire_department_outlined),
                      menuName: '단어 멍',
                      description: '단어를 보면서 멍을 때려요',
                      route: '/wordblink',
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MenuCard(
                        menuIcon: const Icon(Icons.mosque_outlined),
                        // OR  icons.school,  account_balance
                        menuName: '문법 요약',
                        description: '헷갈리는 문법 사항을 빠르게 체크해요',
                        route: '/grammar',
                      ),
                    ),
                    const SizedBox.shrink(), // Empty cell
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
