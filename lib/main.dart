import 'package:arabic_korean_memo/pages/p_grammar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arabic_korean_memo/data/item_provider.dart';

import 'package:arabic_korean_memo/pages/p_setting.dart';
import 'package:arabic_korean_memo/pages/p_study.dart';
import 'package:arabic_korean_memo/pages/p_tests.dart';

import 'package:arabic_korean_memo/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ItemProvider()..loadData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '나만의 작은 아랍어',
        theme: AppTheme.lightTheme,
        home: const MainPages(),
      ),
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
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const MainPageGrammar(),
    const MainPageStudy(),
    const MainPageTests(),
    const MainPageSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
          icon: Icon(
            Icons.mosque_outlined,
          ),
          label: '문법 요약',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined),
          label: '학습',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.psychology_alt_outlined),
          label: '테스트',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: '설정',
        ),
      ],
    );
  }
}
