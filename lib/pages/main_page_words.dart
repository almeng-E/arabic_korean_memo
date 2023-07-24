import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/layouts/app_bar.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

class MainPageWords extends StatefulWidget {
  const MainPageWords({super.key});

  @override
  State<MainPageWords> createState() => _MainPageWordsState();
}

class _MainPageWordsState extends State<MainPageWords> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          // 상단 앱 바
          const MainPageAppBar(
            pageName: '단어장',
            appBarButtons: Row(
              children: [
                Icon(
                  CustomIcon.search,
                  size: 23,
                ),
                Icon(
                  CustomIcon.sliders,
                  size: 23,
                ),
                Icon(
                  CustomIcon.shuffle,
                  size: 23,
                ),
              ],
            ),
          ),

          // Expanded로 flex 추가, 빈 공간 꽉 채움
          // 바디 부분
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.red),
                color: mainBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
