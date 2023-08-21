import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';
import 'package:arabic_korean_memo/widgets/w_memorized_button.dart';
import 'package:arabic_korean_memo/widgets/w_item_to_word_card.dart';

// =========================================================================
class MainPageWords extends StatefulWidget {
  const MainPageWords({super.key});

  @override
  State<MainPageWords> createState() => _MainPageWordsState();
}

class _MainPageWordsState extends State<MainPageWords> {
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
      body: const Padding(
        padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Column(
          children: [
            // ********************************* 색전환 버튼들 나중에 수정
            MemorizedButton(),
            SizedBox(
              height: 22,
            ),
            // 단어장 위젯
            WordCards(),
          ],
        ),
      ),
    );
  }
}
