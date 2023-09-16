import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arabic_korean_memo/data/item_provider.dart';

import 'package:arabic_korean_memo/pages/screens/pp_four_choice.dart';
import 'package:arabic_korean_memo/pages/screens/pp_test_generator.dart';

import 'package:arabic_korean_memo/ui/category_button.dart';
import 'package:arabic_korean_memo/ui/menu_card.dart';

// =========================================================================
class MainPageTests extends StatefulWidget {
  const MainPageTests({super.key});

  @override
  State<MainPageTests> createState() => _MainPageTestsState();
}

class _MainPageTestsState extends State<MainPageTests> {
  String _currentState = 'total';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '테스트',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            tooltip: '범위설정',
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Consumer<ItemProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                // ********************************* 색전환 버튼들
                CategoryButton(
                  // totalItemCount: provider.getTotalItemCount(),
                  // memorizedItemCount: provider.getMemorizedItemCount(),
                  // notMemorizedItemCount: provider.getNotMemorizedItemCount(),
                  onTapTotal: () {
                    setState(() {
                      _currentState = 'total';
                    });
                  },
                  onTapMemorized: () {
                    setState(() {
                      _currentState = 'memorized';
                    });
                  },
                  onTapNotMemorized: () {
                    setState(() {
                      _currentState = 'notMemorized';
                    });
                  },
                ),
                // 빈 공간 SPACING
                const SizedBox(height: 22),
                Column(
                  children: <Widget>[
                    MenuCard(
                      menuIcon: const Icon(Icons.widgets_outlined),
                      menuName: '사지 선다 테스트',
                      description: '설명 ~~~~~~~~~~',
                      route: FourChoice(state: _currentState),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    MenuCard(
                      menuIcon: const Icon(Icons.picture_as_pdf_outlined),
                      menuName: '문제지 생성기',
                      description: '설명~~~~~~~~~@@@@@@@@@@@@@@@@@@@@@@@@@@@',
                      route: TestGenerator(state: _currentState),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
