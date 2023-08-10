import 'package:arabic_korean_memo/layouts/w_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/layouts/w_color_buttons.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

class MainPageTests extends StatefulWidget {
  const MainPageTests({super.key});

  @override
  State<MainPageTests> createState() => _MainPageTestsState();
}

class _MainPageTestsState extends State<MainPageTests> {
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
      body: const Padding(
        padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Column(
          children: [
            // ********************************* 색전환 버튼들
            ColorButtons(),
            // 빈 공간 SPACING
            SizedBox(
              height: 22,
            ),
            Column(
              children: <Widget>[
                MenuCard(
                    menuIcon: Icon(CustomIcon.fourChoice),
                    menuName: '사지 선다 테스트',
                    description: '설명 ~~~~~~~~~~'),
                SizedBox(
                  height: 10,
                ),
                MenuCard(
                    menuIcon: Icon(CustomIcon.print),
                    menuName: '문제지 생성기',
                    description: '설명~~~~~~~~~@@@@@@@@@@@@@@@@@@@@@@@@@@@'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
