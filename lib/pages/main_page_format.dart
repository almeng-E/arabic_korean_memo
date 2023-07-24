import 'package:arabic_korean_memo/pages/main_page_settings.dart';
import 'package:arabic_korean_memo/pages/main_page_study.dart';
import 'package:arabic_korean_memo/pages/main_page_tests.dart';
import 'package:arabic_korean_memo/pages/main_page_words.dart';
import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

class MainPageFormat extends StatefulWidget {
  const MainPageFormat({super.key});
  @override
  State<MainPageFormat> createState() => _MainPageFormatState();
}

class _MainPageFormatState extends State<MainPageFormat> {
  int _currentIndex = 0;

  final List bodyPages = [
    const MainPageWords(),
    const MainPageStudy(),
    const MainPageTests(),
    const MainPageSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        //현재 index 변수에 저장
        currentIndex: _currentIndex,
        //tap -> index 변경
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        //BottomNavi item list
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.mpWords),
            label: '단어장',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.mpStudy),
            label: '학습',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.mpTest),
            label: '테스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.mpSettings),
            label: '설정',
          ),
        ],

        // BottomNavi 스타일 지정
        selectedItemColor: mainMint,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
        // unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        showUnselectedLabels: true,
        // 타입
        type: BottomNavigationBarType.fixed,
      ),

      //List item index로 Body 변경
      body: SafeArea(
        child: bodyPages[_currentIndex],
      ),
    );
  }
}
