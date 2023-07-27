import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/pages/main_page_settings.dart';
import 'package:arabic_korean_memo/pages/main_page_study.dart';
import 'package:arabic_korean_memo/pages/main_page_tests.dart';
import 'package:arabic_korean_memo/pages/main_page_words.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '나만의 작은 아랍어',
      home: MainPageFormat(),
    );
  }
}

class MainPageFormat extends StatefulWidget {
  const MainPageFormat({super.key});

  @override
  State<MainPageFormat> createState() => _MainPageFormatState();
}

class _MainPageFormatState extends State<MainPageFormat> {
  int _currentIndex = 0;

  final List _bodyPages = [
    const MainPageWords(),
    const MainPageStudy(),
    const MainPageTests(),
    const MainPageSettings(),
  ];
  final List _pageNames = [
    '단어장',
    '학습',
    '테스트',
    '설정',
  ];
  final List<Widget> appBarButtons = [
    Row(
      children: [
        IconButton(
          icon: const Icon(CustomIcon.search),
          tooltip: '검색',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(CustomIcon.shuffle),
          tooltip: '셔플',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(CustomIcon.sliders),
          tooltip: '범위설정',
          onPressed: () {},
        ),
      ],
    ),
    IconButton(
      icon: const Icon(CustomIcon.sliders),
      iconSize: 24,
      tooltip: '범위설정',
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(CustomIcon.sliders),
      iconSize: 24,
      tooltip: '범위설정',
      onPressed: () {},
    ),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: MainPageAppBar(
            title: _pageNames[_currentIndex],
            buttons: appBarButtons[_currentIndex],
          ),
        ),
        body: _bodyPages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // 타입
          type: BottomNavigationBarType.fixed,
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
        ),
      ),
    );
  }
}

// ******************************************************APP-BAR 커스텀
class MainPageAppBar extends StatelessWidget {
  const MainPageAppBar({
    super.key,
    required this.title,
    required this.buttons,
  });

  final String title;
  final Widget buttons;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.deepOrangeAccent,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TITLE
            Container(
              color: Colors.green,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            // 아이콘버튼들
            Container(
              color: Colors.amber,
              child: buttons,
            ),
          ],
        ),
      ),
    );
  }
}
