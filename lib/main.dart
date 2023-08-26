import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/pages/p_setting.dart';
import 'package:arabic_korean_memo/pages/p_study.dart';
import 'package:arabic_korean_memo/pages/p_tests.dart';
import 'package:arabic_korean_memo/pages/p_vocabs.dart';
import 'package:arabic_korean_memo/pages/pp_flash_cards.dart';
import 'package:arabic_korean_memo/pages/pp_four_choice.dart';
import 'package:arabic_korean_memo/pages/pp_test_generator.dart';
import 'package:arabic_korean_memo/pages/pp_word_blink.dart';
import 'package:arabic_korean_memo/pages/pp_grammar.dart';

import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

import 'package:arabic_korean_memo/widgets/d_data_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ItemDataManager().loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '나만의 작은 아랍어',
      home: const MainPages(),
      routes: {
        '/flashcards': (context) => const FlashCards(),
        '/wordblink': (context) => const WordBlink(),
        '/grammar': (context) => const Grammar(),
        '/fourchoice': (context) => const FourChoice(),
        '/testgenerator': (context) => const TestGenerator(),
      },
    );
  }
}

// MainPages
class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MainPageVocabs(),
    const MainPageStudy(),
    const MainPageTests(),
    const MainPageSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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
    );
  }
}
