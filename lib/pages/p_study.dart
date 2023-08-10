import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/layouts/w_color_buttons.dart';
import 'package:arabic_korean_memo/layouts/w_menu_card.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

class MainPageStudy extends StatefulWidget {
  const MainPageStudy({super.key});

  @override
  State<MainPageStudy> createState() => _MainPageStudyState();
}

class _MainPageStudyState extends State<MainPageStudy> {
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
            const ColorButtons(),
            // 빈 공간 SPACING
            const SizedBox(
              height: 22,
            ),
            // 메뉴 버튼들
            Table(
              children: const <TableRow>[
                TableRow(
                  children: <Widget>[
                    MenuCard(
                      menuIcon: Icon(
                        CustomIcon.flashCard,
                      ),
                      menuName: '플래시 카드 ?',
                      description: '메뉴 설명들 ~~~~~~~~~~~~~~~~',
                    ),
                    MenuCard(
                      menuIcon: Icon(
                        CustomIcon.wordBlink,
                      ),
                      menuName: '단어 멍',
                      description: '단어를 보면서 멍을 때려요',
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: MenuCard(
                        menuIcon: Icon(
                          CustomIcon.grammar,
                        ),
                        menuName: '문법 요약',
                        description: '헷갈리는 문법 사항을 빠르게 체크해요',
                      ),
                    ),
                    SizedBox.shrink(), // Empty cell
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
