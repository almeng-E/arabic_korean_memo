import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/layouts/color_buttons.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';
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
          style: TextStyle(color: Colors.black),
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.red),
                color: Colors.amber,
              ),
              child: const Text('학습 CARDS'),
            ),
          ],
        ),
      ),
    );
  }
}
