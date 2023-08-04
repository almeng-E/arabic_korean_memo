import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/layouts/color_buttons.dart';
import 'package:arabic_korean_memo/layouts/word_cards.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

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
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(CustomIcon.search),
            color: Colors.black,
            tooltip: '검색',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CustomIcon.shuffle),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        decoration: const BoxDecoration(
          color: mainMint,
        ),
        child: Column(
          children: [
            // ********************************* 색전환 버튼들
            const ColorButtons(),
            const SizedBox(
              height: 22,
            ),
            // ###################Expanded 는임시용
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.red),
                ),
                child: const WordCards(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
