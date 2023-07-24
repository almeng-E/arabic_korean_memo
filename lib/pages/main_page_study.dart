import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/layouts/app_bar.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

class MainPageStudy extends StatefulWidget {
  const MainPageStudy({super.key});

  @override
  State<MainPageStudy> createState() => _MainPageStudyState();
}

class _MainPageStudyState extends State<MainPageStudy> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          // 상단 앱 바
          const MainPageAppBar(
            pageName: '학습',
            appBarButtons: Row(
              children: [
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
                color: mainGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
