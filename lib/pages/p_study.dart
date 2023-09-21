import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arabic_korean_memo/data/item_provider.dart';

import 'package:arabic_korean_memo/ui/category_button.dart';
import 'package:arabic_korean_memo/ui/menu_card.dart';

import 'screens/pp_vocabs.dart';
import 'screens/pp_flash_cards.dart';
import 'screens/pp_word_blink.dart';

// =========================================================================
class MainPageStudy extends StatefulWidget {
  const MainPageStudy({super.key});

  @override
  State<MainPageStudy> createState() => _MainPageStudyState();
}

class _MainPageStudyState extends State<MainPageStudy> {
  String _currentState = 'total';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '학습',
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
                  totalItemCount: provider.getTotalItemCount(),
                  memorizedItemCount: provider.getMemorizedItemCount(),
                  notMemorizedItemCount: provider.getNotMemorizedItemCount(),
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
                // 메뉴 버튼들

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MenuCard(
                            menuIcon:
                                const Icon(Icons.chrome_reader_mode_outlined),
                            menuName: '단어장',
                            description: '단어 학습',
                            route: const VocabPage(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: MenuCard(
                            menuIcon: const Icon(Icons.style_outlined),
                            menuName: '플래시 카드',
                            description:
                                '가볍게 넘기면서 외워요. 스와이프 결과가 단어장에는 영향을 주지 않아요.',
                            route: FlashCards(state: _currentState),
                          ),
                        ),
                        Expanded(
                          child: MenuCard(
                            menuIcon: const Icon(
                                Icons.local_fire_department_outlined),
                            menuName: '단어 멍',
                            description: '단어를 보면서 멍을 때려요',
                            route: WordBlink(state: _currentState),
                          ),
                        )
                      ],
                    )
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
